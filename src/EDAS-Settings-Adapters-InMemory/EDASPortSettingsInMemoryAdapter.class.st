Class {
	#name : #EDASPortSettingsInMemoryAdapter,
	#superclass : #Object,
	#traits : 'EDASPortSettingsPort + EDACLanguageHelper + EDACReflectionHelper',
	#classTraits : 'EDASPortSettingsPort classTrait + EDACLanguageHelper classTrait + EDACReflectionHelper classTrait',
	#instVars : [
		'announcer',
		'edaApplication',
		'adapters',
		'adapterClasses'
	],
	#category : #'EDAS-Settings-Adapters-InMemory'
}

{ #category : #'instance creation' }
EDASPortSettingsInMemoryAdapter class >> withAnnouncer: anEDASettingsAnnouncer [

	^ self new
		  announcer: anEDASettingsAnnouncer;
		edaApplication: anEDASettingsAnnouncer edaApplication;
		  yourself
]

{ #category : #accessing }
EDASPortSettingsInMemoryAdapter >> adapterFor: aPort [
	^ adapters at: aPort ifAbsent: [ nil ]
]

{ #category : #accessing }
EDASPortSettingsInMemoryAdapter >> adapterFor: aPort is: anAdapter [

	adapters at: aPort put: anAdapter.
	adapterClasses at: aPort put: anAdapter class.
]

{ #category : #'reflective operations' }
EDASPortSettingsInMemoryAdapter >> adapterGetter: aMessage [

	^ adapters
		  at: (self portClassForSettings: aMessage selector greaseString)
		  ifAbsent: [ nil ]
]

{ #category : #'reflective operations' }
EDASPortSettingsInMemoryAdapter >> adapterSetter: aMessage [

	| portClass |
	portClass := self portClassForSettings:
		                (self
			                 removeSuffix: ':'
			                 from: aMessage selector greaseString).
	^ portClass ifNotNil: [ :p | 
		  self adapterFor: p is: aMessage arguments first ]
]

{ #category : #accessing }
EDASPortSettingsInMemoryAdapter >> adapters [

	^ adapters
]

{ #category : #accessing }
EDASPortSettingsInMemoryAdapter >> announcer [
	^ announcer
]

{ #category : #accessing }
EDASPortSettingsInMemoryAdapter >> announcer: anObject [
	announcer := anObject
]

{ #category : #accessing }
EDASPortSettingsInMemoryAdapter >> commandListener [

	^ adapters at: EDASCommandListenerSettingsPort ifAbsent: [ nil ]
]

{ #category : #accessing }
EDASPortSettingsInMemoryAdapter >> currentEnvironment [
	^ adapters at: EDASEnvironmentSettingsPort ifAbsent: [ nil ]
]

{ #category : #'reflective operations' }
EDASPortSettingsInMemoryAdapter >> doesNotUnderstand: aMessage [

	| selector className setter result |
	selector := aMessage selector greaseString.
	setter := selector endsWithAColon.
	className := setter
		             ifTrue: [ self removeSuffix: ':' from: selector ]
		             ifFalse: [ selector ].
	result := (self classOrTraitExists: className)
		          ifTrue: [ 
			          setter
				          ifTrue: [ 
					          self portClassSetter: aMessage ]
				          ifFalse: [ self portClassGetter: aMessage ] ]
		          ifFalse: [ 
			          setter
				          ifTrue: [ 
					          self adapterSetter: aMessage ]
				          ifFalse: [ self adapterGetter: aMessage ] ].
	^ result
]

{ #category : #accessing }
EDASPortSettingsInMemoryAdapter >> edaApplication [

	^ edaApplication
]

{ #category : #accessing }
EDASPortSettingsInMemoryAdapter >> edaApplication: anObject [

	edaApplication := anObject
]

{ #category : #accessing }
EDASPortSettingsInMemoryAdapter >> edaPorts [

	^ adapterClasses keys
]

{ #category : #initialization }
EDASPortSettingsInMemoryAdapter >> initialize [
	super initialize.
	adapters := Dictionary new.
	adapterClasses := Dictionary new.
]

{ #category : #'reflective operations' }
EDASPortSettingsInMemoryAdapter >> portClassForSettings: aSettingsName [

	^ EDASPortResolver new availablePorts detect: [ :p | (p greaseString findString: aSettingsName capitalized) ~= 0 ] ifNone: [ nil ]
]

{ #category : #'reflective operations' }
EDASPortSettingsInMemoryAdapter >> portClassGetter: aMessage [

	^ (self classOrTraitExists: aMessage selector greaseString)
		  ifTrue: [ 
			  | result |
			  result := adapterClasses
				            at:
				            (self classOrTraitNamed:
					             aMessage selector greaseString)
				            ifAbsent: [ nil ].
			  result ifNotNil: [ :r | r edaPort ] ]
		  ifFalse: [ "super doesNotUnderstand: aMessage" ]
]

{ #category : #'reflective operations' }
EDASPortSettingsInMemoryAdapter >> portClassSetter: aMessage [

	| portName result previousAdapterClass newAdapterClass |
	portName := self removeSuffix: ':' from: aMessage selector greaseString.
	result := nil.
	(self classOrTraitExists: portName)
		ifTrue: [ | port |
			port := self classOrTraitNamed: portName.
			previousAdapterClass := adapterClasses
				                        at: port
				                        ifAbsent: [ nil ].
			newAdapterClass := aMessage arguments first isAssociation
				                   ifTrue: [ aMessage arguments first value ]
				                   ifFalse: [ aMessage arguments first ].

			result := newAdapterClass = previousAdapterClass
				          ifTrue: [ previousAdapterClass ]
				          ifFalse: [ 
					          self
						          updateAdapterClass: newAdapterClass
						          for: port
						          andAnnounce: port portChangedEventName.
					          newAdapterClass ] ]
		ifFalse: [ "super doesNotUnderstand: aMessage" ].
	^ result ifNotNil: [ :r | r edaPort ]
]

{ #category : #testing }
EDASPortSettingsInMemoryAdapter >> updateAdapterClass: newValue for: aPort [

	^ self updateAdapterClass: newValue for: aPort andAnnounce: nil
]

{ #category : #testing }
EDASPortSettingsInMemoryAdapter >> updateAdapterClass: newValue for: aPort andAnnounce: anEventClass [

	| oldValue |
	oldValue := adapterClasses at: aPort ifAbsent: [ nil ].
	adapterClasses at: aPort put: newValue.
	oldValue = newValue ifTrue: [ ^ self ].
	self adapterFor: aPort is: (newValue withApp: self edaApplication).
	anEventClass ifNotNil: [ :cls |
	self announcer announce:
		(cls old: oldValue new: newValue on: self edaApplication) ]
]
