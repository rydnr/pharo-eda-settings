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
	currentEnvironment := anObject
]

{ #category : #accessing }
EDASEnvironmentSettingsInMemoryAdapter >> edaApplication [
	^ edaApplication
]

{ #category : #accessing }
EDASEnvironmentSettingsInMemoryAdapter >> edaApplication: anEDAApplication [
	edaApplication := anEDAApplication
]

{ #category : #logic }
EDASEnvironmentSettingsInMemoryAdapter >> resolveEnvironmentSettingsPort [
	^ self
]