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

	^ aPort = EDASEnvironmentSettingsPort and: [ self availableEnvironments isNotEmpty  ]
]

{ #category : #meta }
EDASPredefinedEnvironmentSettingsInMemoryAdapter class >> availableEnvironments [

	^ EDASStompTopicListenerSettingsJsonAdapter availableEnvironments collect: [ :e | e -> e ]
]

{ #category : #meta }
EDASPredefinedEnvironmentSettingsInMemoryAdapter class >> description [
	^ 'Predefined list (', (self concatenateCollection: (self availableEnvironments collect: [ :assoc | assoc value ]) with: ', ') , ')'
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

	<edaSettings: 'Environment' withDescription: 'The environment' icon:
	#environment atPosition: 1 readOnly: false multiple: true>
	^ currentEnvironment ifNil: [ 
		  self availableEnvironments
			  ifEmpty: [ '' ]
			  ifNotEmpty: [ :c | c first value ] ]
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
