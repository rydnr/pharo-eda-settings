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
EDASEnvironmentSettingsInMemoryAdapter class >> accepts: anEDAApplication [
	^ true
]

{ #category : #accessing }
EDASEnvironmentSettingsInMemoryAdapter class >> priority [
	^ 99
]

{ #category : #accessing }
EDASEnvironmentSettingsInMemoryAdapter >> currentEnvironment [
	^ currentEnvironment ifNil: [ '' ]
]

{ #category : #accessing }
EDASEnvironmentSettingsInMemoryAdapter >> currentEnvironment: anObject [

	| oldValue |
	currentEnvironment ~= anObject ifFalse: [ ^ self ].
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

{ #category : #testing }
EDASEnvironmentSettingsInMemoryAdapter >> isReadOnly: environment [

	^ false
]

{ #category : #logic }
EDASEnvironmentSettingsInMemoryAdapter >> resolveEnvironmentSettingsPort [
	^ self
]

{ #category : #testing }
EDASEnvironmentSettingsInMemoryAdapter >> supportsMultiple: environment [

	^ false
]
