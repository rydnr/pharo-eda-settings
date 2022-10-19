Class {
	#name : #EDASPredefinedEnvironmentSettingsInMemoryAdapter,
	#superclass : #Object,
	#traits : 'EDASEnvironmentSettingsPort + EDASInMemoryAdapter + EDACCollectionHelper',
	#classTraits : 'EDASEnvironmentSettingsPort classTrait + EDASInMemoryAdapter classTrait + EDACCollectionHelper classTrait',
	#instVars : [
		'currentEnvironment',
		'edaApplication'
	],
	#category : #'EDAS-Settings-Adapters-InMemory'
}

{ #category : #testing }
EDASPredefinedEnvironmentSettingsInMemoryAdapter class >> accepts: aPort [

	^ true
]

{ #category : #meta }
EDASPredefinedEnvironmentSettingsInMemoryAdapter class >> availableEnvironments [
	^ OrderedCollection with: 'dev' with: 'test' with: 'PRO'
]

{ #category : #meta }
EDASPredefinedEnvironmentSettingsInMemoryAdapter class >> description [
	^ 'Predefined list (', (self concatenateCollection: self availableEnvironments with: ', ') , ')'
]

{ #category : #meta }
EDASPredefinedEnvironmentSettingsInMemoryAdapter class >> priority [
	^ 60
]

{ #category : #meta }
EDASPredefinedEnvironmentSettingsInMemoryAdapter >> availableEnvironments [
	^ self class availableEnvironments 
]

{ #category : #accessing }
EDASPredefinedEnvironmentSettingsInMemoryAdapter >> currentEnvironment [
	^ currentEnvironment ifNil: [ self availableEnvironments first ]
]

{ #category : #accessing }
EDASPredefinedEnvironmentSettingsInMemoryAdapter >> currentEnvironment: anEnvironment [
	currentEnvironment := anEnvironment
]

{ #category : #accessing }
EDASPredefinedEnvironmentSettingsInMemoryAdapter >> edaApplication [
	^ edaApplication
]

{ #category : #accessing }
EDASPredefinedEnvironmentSettingsInMemoryAdapter >> edaApplication: anEDAApplication [
	edaApplication := anEDAApplication
]

{ #category : #accessing }
EDASPredefinedEnvironmentSettingsInMemoryAdapter >> resolveEnvironmentSettingsPort [
	^ self
]

{ #category : #'as yet unclassified' }
EDASPredefinedEnvironmentSettingsInMemoryAdapter >> supportsMultiple: aSymbol [
	^ true
]
