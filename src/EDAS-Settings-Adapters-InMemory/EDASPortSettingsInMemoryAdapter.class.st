Class {
	#name : #EDASPortSettingsInMemoryAdapter,
	#superclass : #Object,
	#traits : 'EDASPortSettingsPort',
	#classTraits : 'EDASPortSettingsPort classTrait',
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

{ #category : #testing }
EDASPortSettingsInMemoryAdapter >> updateAdapterClass: newValue for: aPort andAnnounce: anEventClass [

	| oldValue |
	oldValue := adapterClasses at: aPort ifAbsent: [ nil ].
	adapterClasses at: aPort put: newValue.
	oldValue = newValue ifTrue: [ ^ self ].
	self adapterFor: aPort is: (newValue withApp: self edaApplication).
	self announcer announce:
		(anEventClass old: oldValue new: newValue on: self edaApplication)
]
