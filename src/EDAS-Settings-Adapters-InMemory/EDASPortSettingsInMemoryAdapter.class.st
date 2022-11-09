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

	adapters at: aPort put: anAdapter
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

	| selector className setter |
	selector := aMessage selector greaseString.
	setter := selector endsWithAColon.
	className := setter
		             ifTrue: [ self removeSuffix: ':' from: selector ]
		             ifFalse: [ selector ].
	self halt.
	^ (self classOrTraitExists: className)
		  ifTrue: [ 
			  setter
				  ifTrue: [ self portClassSetter: aMessage ]
				  ifFalse: [ self portClassGetter: aMessage ] ]
		  ifFalse: [ 
			  setter
				  ifTrue: [ self adapterSetter: aMessage ]
				  ifFalse: [ self adapterGetter: aMessage ] ]
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

{ #category : #accessing }
EDASPortSettingsInMemoryAdapter >> environmentSettingsAdapterClass_ [

	^ adapterClasses at: EDASEnvironmentSettingsPort ifAbsent: [ 
		  | t |
		  t := self environmentSettings_.
		  self environmentSettingsAdapterClass_: t class.
		  t ]
]

{ #category : #accessing }
EDASPortSettingsInMemoryAdapter >> environmentSettingsAdapterClass_: newValue [

	^ self
		  updateAdapterClass: newValue
		  for: EDASEnvironmentSettingsPort
		  andAnnounce: EDASEnvironmentSettingsPortChanged
]

{ #category : #accessing }
EDASPortSettingsInMemoryAdapter >> environmentSettings_ [

	^ adapters at: EDASEnvironmentSettingsPort ifAbsent: [ nil ]
]

{ #category : #accessing }
EDASPortSettingsInMemoryAdapter >> environmentSettings_: newValue [

	^ self adapterFor: EDASEnvironmentSettingsPort is: newValue
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
			  adapterClasses
				  at: (self classOrTraitNamed: aMessage selector greaseString)
				  ifAbsent: [ nil ] ]
		  ifFalse: [ "super doesNotUnderstand: aMessage" ]
]

{ #category : #'reflective operations' }
EDASPortSettingsInMemoryAdapter >> portClassSetter: aMessage [

	| port |
	port := self removeSuffix: ':' from: aMessage selector greaseString.

	^ (self classOrTraitExists: port)
		  ifTrue: [ 
			  | result |
			  result := adapterClasses
				            at: (self classOrTraitNamed: port)
				            ifAbsent: [ 
					            | t adapterClass |
									adapterClass := aMessage arguments first isAssociation ifTrue: [ aMessage arguments first value ] ifFalse: [ aMessage arguments first ].
					            t := self perform:
						                 adapterClass adapterAccessor.
					            t ifNotNil: [ :arg | 
						            self
							            updateAdapterClass: arg class
							            for: port
							            andAnnounce:
							            (self classOrTraitNamed: port , 'Changed') ].
					            t class ].
			  result edaPort ]
		  ifFalse: [ "super doesNotUnderstand: aMessage" ]
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
