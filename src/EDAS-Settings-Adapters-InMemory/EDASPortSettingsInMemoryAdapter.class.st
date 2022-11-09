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

{ #category : #'reflective operations' }
EDASPortSettingsInMemoryAdapter >> adapterClassForSettings: aSettingsName [

	^ EDASPortResolver new availablePorts detect: [ :p | (p greaseString findString: aSettingsName capitalized) ~= 0 ] ifNone: [ nil ]
]

{ #category : #'reflective operations' }
EDASPortSettingsInMemoryAdapter >> adapterClassGetter: aMessage [

	^ (self classOrTraitExists: aMessage selector greaseString)
		  ifTrue: [ 
			  adapterClasses
				  at: (self classOrTraitNamed: aMessage selector greaseString)
				  ifAbsent: [ nil ] ]
		  ifFalse: [ "super doesNotUnderstand: aMessage" ]
]

{ #category : #'reflective operations' }
EDASPortSettingsInMemoryAdapter >> adapterClassSetter: aMessage [

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

{ #category : #accessing }
EDASPortSettingsInMemoryAdapter >> adapterFor: aPort [
	^ adapters at: aPort ifAbsent: [ nil ]
]

{ #category : #accessing }
EDASPortSettingsInMemoryAdapter >> adapterFor: aPort is: anAdapter [

	adapters at: aPort put: anAdapter
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
EDASPortSettingsInMemoryAdapter >> commandListenerSettings [

	^ adapters at: EDASCommandListenerSettingsPort ifAbsent: [ nil ]
]

{ #category : #testing }
EDASPortSettingsInMemoryAdapter >> commandListenerSettings: newValue [

	^ self adapterFor: EDASCommandListenerSettingsPort is: newValue
]

{ #category : #accessing }
EDASPortSettingsInMemoryAdapter >> commandListenerSettingsAdapterClass [

	| result |
	result := adapterClasses
		          at: EDASCommandListenerSettingsPort
		          ifAbsent: [ 
			          | t |
			          t := self commandListenerSettings.
			          t ifNotNil: [ :arg | 
				          self commandListenerSettingsAdapterClass: t class ].
			          t class ].
	^ result edaPort
]

{ #category : #testing }
EDASPortSettingsInMemoryAdapter >> commandListenerSettingsAdapterClass: newValue [

	^ self
		  updateAdapterClass: newValue
		  for: EDASCommandListenerSettingsPort
		  andAnnounce: EDASCommandListenerSettingsPortChanged
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
	^ (self classOrTraitExists: className)
		  ifTrue: [ 
			  setter
				  ifTrue: [ self adapterClassSetter: aMessage ]
				  ifFalse: [ self adapterClassGetter: aMessage ] ]
		  ifFalse: [ 
			  setter
				  ifTrue: [ self settingsSetter: aMessage ]
				  ifFalse: [ self settingsGetter: aMessage ] ]
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
EDASPortSettingsInMemoryAdapter >> environmentSettings [

	^ adapters at: EDASEnvironmentSettingsPort ifAbsent: [ nil ]

]

{ #category : #accessing }
EDASPortSettingsInMemoryAdapter >> environmentSettings: newValue [

	^ self adapterFor: EDASEnvironmentSettingsPort is: newValue
]

{ #category : #accessing }
EDASPortSettingsInMemoryAdapter >> environmentSettingsAdapterClass [

	^ adapterClasses at: EDASEnvironmentSettingsPort ifAbsent: [ 
		  | t |
		  t := self environmentSettings.
		  self environmentSettingsAdapterClass: t class.
		  t ]
]

{ #category : #accessing }
EDASPortSettingsInMemoryAdapter >> environmentSettingsAdapterClass: newValue [

	^ self
		  updateAdapterClass: newValue
		  for: EDASEnvironmentSettingsPort
		  andAnnounce: EDASEnvironmentSettingsPortChanged
]

{ #category : #accessing }
EDASPortSettingsInMemoryAdapter >> eventPublisherSettings [

	^ adapters at: EDASEventPublisherSettingsPort ifAbsent: [ nil ]
]

{ #category : #testing }
EDASPortSettingsInMemoryAdapter >> eventPublisherSettings: newValue [

	^ self adapterFor: EDASEventPublisherSettingsPort is: newValue
]

{ #category : #accessing }
EDASPortSettingsInMemoryAdapter >> eventPublisherSettingsAdapterClass [

	| result |
	result := adapterClasses
		          at: EDASEventPublisherSettingsPort
		          ifAbsent: [ 
			          | t |
			          t := self eventPublisherSettings.
			          t ifNotNil: [ :arg | 
				          self eventPublisherSettingsAdapterClass: t class ].
			          t class ].
	^ result edaPort
]

{ #category : #testing }
EDASPortSettingsInMemoryAdapter >> eventPublisherSettingsAdapterClass: newValue [

	^ self
		  updateAdapterClass: newValue
		  for: EDASEventPublisherSettingsPort
		  andAnnounce: EDASEventPublisherSettingsPortChanged
]

{ #category : #initialization }
EDASPortSettingsInMemoryAdapter >> initialize [
	super initialize.
	adapters := Dictionary new.
	adapterClasses := Dictionary new.
]

{ #category : #'reflective operations' }
EDASPortSettingsInMemoryAdapter >> settingsGetter: aMessage [

	^ adapters at: (self adapterClassForSettings: aMessage selector greaseString) ifAbsent: [ nil ]

]

{ #category : #'reflective operations' }
EDASPortSettingsInMemoryAdapter >> settingsSetter: aMessage [

	| adapterClass |
	adapterClass := self adapterClassForSettings:
		                (self
			                 removeSuffix: ':'
			                 from: aMessage selector greaseString).
	^ adapterClass ifNotNil: [ :a | 
		  self adapterFor: (self classOrTraitNamed: a) is: aMessage arguments first ]
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
