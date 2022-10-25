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
		'environmentSettings'
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
EDASPortSettingsInMemoryAdapter >> announcer [
	^ announcer
]

{ #category : #accessing }
EDASPortSettingsInMemoryAdapter >> announcer: anObject [
	announcer := anObject
]

{ #category : #accessing }
EDASPortSettingsInMemoryAdapter >> commandListenerSettings [

	^ commandListenerSettings ifNil: [ 
		  | t |
		  t := EDASPortResolver new
			       resolvePort: EDASCommandListenerSettingsPort
			       forApp: self edaApplication.
		  self commandListenerSettings: t.
		  t ]
]

{ #category : #testing }
EDASPortSettingsInMemoryAdapter >> commandListenerSettings: newValue [

	| oldValue |
	oldValue := commandListenerSettings.
	commandListenerSettings := newValue.
	oldValue = newValue ifFalse: [ 
		self announcer announce: (EDASCommandListenerSettingsPortChanged
				 old: oldValue
				 new: newValue
				 on: self edaApplication) ]
]

{ #category : #accessing }
EDASPortSettingsInMemoryAdapter >> commandListenerSettingsAdapterClass [

	^ commandListenerSettingsAdapterClass ifNil: [ 
		  | t |
		  t := self commandListenerSettings.
		  self commandListenerSettingsAdapterClass: t class.
		  t ]
]

{ #category : #testing }
EDASPortSettingsInMemoryAdapter >> commandListenerSettingsAdapterClass: newValue [

	| oldValue |
	oldValue := commandListenerSettingsAdapterClass.
	commandListenerSettingsAdapterClass := newValue.
	oldValue = newValue ifTrue: [ ^ self ].
	self commandListenerSettings: (newValue withApp: self edaApplication).
	self announcer announce: (EDASCommandListenerSettingsPortChanged
			 old: oldValue
			 new: newValue
			 on: self edaApplication)
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

	^ environmentSettings ifNil: [ 
		  | t |
		  t := EDASPortResolver new
			       resolvePort: EDASEnvironmentSettingsPort
			       forApp: self edaApplication.
		  self environmentSettings: t.
		  t ]
]

{ #category : #accessing }
EDASPortSettingsInMemoryAdapter >> environmentSettings: newValue [

	| oldValue |
	oldValue := environmentSettings.
	environmentSettings := newValue.
	oldValue = newValue ifFalse: [ 
		self announcer announce: (EDASEnvironmentSettingsChanged
				 old: oldValue
				 new: newValue
				 on: self edaApplication) ]
]

{ #category : #accessing }
EDASPortSettingsInMemoryAdapter >> environmentSettingsAdapterClass [

	^ environmentSettingsAdapterClass ifNil: [ 
		  | t |
		  t := self environmentSettings.
		  self environmentSettingsAdapterClass: t class.
		  t ]
]

{ #category : #accessing }
EDASPortSettingsInMemoryAdapter >> environmentSettingsAdapterClass: newValue [

	| oldValue |
	oldValue := environmentSettingsAdapterClass.
	environmentSettingsAdapterClass := newValue.
	oldValue = newValue ifTrue: [ ^ self ].
	self environmentSettings: (newValue withApp: self edaApplication).
	self announcer announce: (EDASEnvironmentSettingsChanged
			 old: oldValue
			 new: newValue
			 on: self edaApplication)
]
