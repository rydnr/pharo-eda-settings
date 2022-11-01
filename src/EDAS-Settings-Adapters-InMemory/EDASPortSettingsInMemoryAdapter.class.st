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
EDASPortSettingsInMemoryAdapter >> commandListenerSettings [

	^ adapters at: EDASCommandListenerSettingsPort ifAbsent: [ nil ]
]

{ #category : #testing }
EDASPortSettingsInMemoryAdapter >> commandListenerSettings: newValue [

	^ self adapterFor: #commandListener is: newValue
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

	^ self updateAdapterClass: newValue for: #commandListener andAnnounce: EDASCommandListenerSettingsPortChanged

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

	| oldValue |
	oldValue := environmentSettings.
	environmentSettings := newValue
]

{ #category : #accessing }
EDASPortSettingsInMemoryAdapter >> environmentSettingsAdapterClass [

	^ adapterClasses at: EDASCommandListenerSettingsPort ifAbsent: [ 
		  | t |
		  t := self environmentSettings.
		  self environmentSettingsAdapterClass: t class.
		  t ]
]

{ #category : #accessing }
EDASPortSettingsInMemoryAdapter >> environmentSettingsAdapterClass: newValue [


	^ self
		  updateAdapterClass: newValue
		  for: #environment
		  andAnnounce: EDASEnvironmentSettingsPortChanged
]

{ #category : #initialization }
EDASPortSettingsInMemoryAdapter >> initialize [
	super initialize.
	adapters := Dictionary new.
	adapterClasses := Dictionary new.
]

{ #category : #testing }
EDASPortSettingsInMemoryAdapter >> updateAdapterClass: newValue for: aSymbol andAnnounce: anEventClass [

	| oldValue |
	oldValue := adapterClasses at: aSymbol ifAbsent: [ nil ].
	adapterClasses at: aSymbol put: newValue.
	oldValue = newValue ifTrue: [ ^ self ].
	self adapterFor: newValue is: (newValue withApp: self edaApplication).
	self announcer announce: (anEventClass old: oldValue new: newValue on: self edaApplication)
]
