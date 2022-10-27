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

	^ aPort = EDASEnvironmentSettingsPort
]

{ #category : #meta }
EDASPredefinedEnvironmentSettingsInMemoryAdapter class >> availableEnvironments [

	^ EDASStompTopicListenerSettingsJsonAdapter availableEnvironments
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
EDASPredefinedEnvironmentSettingsInMemoryAdapter >> currentEnvironment: anObject [

	| oldValue |
	currentEnvironment = anObject ifTrue: [ ^ self ].
	oldValue := currentEnvironment.
	currentEnvironment := anObject.
	self edaApplication
		notifyEnvironmentChangedFrom: oldValue
		to: anObject
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
