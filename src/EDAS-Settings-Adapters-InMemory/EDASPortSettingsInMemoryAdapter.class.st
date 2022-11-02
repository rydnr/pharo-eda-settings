Class {
	#name : #EDASPortSettingsInMemoryAdapter,
	#superclass : #Object,
	#traits : 'EDASPortSettingsPort',
	#classTraits : 'EDASPortSettingsPort classTrait',
	#instVars : [
		'announcer',
		'environmentSettingsAdapterClass',
		'commandListenerSettingsAdapterClass',
		'edaApplication',
		'commandListenerSettings',
		'environmentSettings',
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

	^ adapterClasses at: EDASCommandListenerSettingsPort ifAbsent: [ 
		  | t |
		  t := self commandListenerSettings.
		  self commandListenerSettingsAdapterClass: t class.
		  t ]
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
	self adapterFor: newValue is: (newValue withApp: self edaApplication).
	self announcer announce:
		(anEventClass old: oldValue new: newValue on: self edaApplication)
]
