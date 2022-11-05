Class {
	#name : #EDASEnvironmentSettingsInMemoryAdapter,
	#superclass : #Object,
	#traits : 'EDASEnvironmentSettingsPort + EDASInMemoryAdapter',
	#classTraits : 'EDASEnvironmentSettingsPort classTrait + EDASInMemoryAdapter classTrait',
	#instVars : [
		'currentEnvironment',
		'edaApplication'
	],
	#category : #'EDAS-Settings-Adapters-InMemory'
}

{ #category : #testing }
EDASEnvironmentSettingsInMemoryAdapter class >> accepts: aPort [

	^ aPort = EDASEnvironmentSettingsPort
]

{ #category : #ambiguous }
EDASEnvironmentSettingsInMemoryAdapter class >> description [

	^ 'Manual'
]

{ #category : #accessing }
EDASEnvironmentSettingsInMemoryAdapter class >> priority [
	^ 99
]

{ #category : #accessing }
EDASEnvironmentSettingsInMemoryAdapter >> currentEnvironment [

	<edaSettings: 'Environment' withDescription: 'The environment' icon:
	#workspace atPosition: 1 readOnly: false multiple: false>
	^ currentEnvironment ifNil: [ '' ]
]

{ #category : #accessing }
EDASEnvironmentSettingsInMemoryAdapter >> currentEnvironment: anObject [

	| oldValue |
	currentEnvironment = anObject ifTrue: [ ^ self ].
	oldValue := currentEnvironment.
	currentEnvironment := anObject.
	self edaApplication
		notifyEnvironmentChangedFrom: oldValue
		to: anObject
]

{ #category : #accessing }
EDASEnvironmentSettingsInMemoryAdapter >> edaApplication [
	^ edaApplication
]

{ #category : #accessing }
EDASEnvironmentSettingsInMemoryAdapter >> edaApplication: anEDAApplication [
	edaApplication := anEDAApplication
]
