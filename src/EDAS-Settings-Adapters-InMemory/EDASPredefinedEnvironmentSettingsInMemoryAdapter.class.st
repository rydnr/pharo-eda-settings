Class {
	#name : #EDASPredefinedEnvironmentSettingsInMemoryAdapter,
	#superclass : #Object,
	#traits : 'EDASEnvironmentSettingsPort + EDACCollectionHelper',
	#classTraits : 'EDASEnvironmentSettingsPort classTrait + EDACCollectionHelper classTrait',
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

	^ EDASStompTopicListenerSettingsJsonAdapter availableEnvironments 
		  collect: [ :e | 
			  ('pharoeda.settings.ports.environment.predefined.' , e) asSymbol
				  translated -> e ]
]

{ #category : #meta }
EDASPredefinedEnvironmentSettingsInMemoryAdapter class >> description [

	^ #'pharoeda.settings.adapters.environment.predefined.description'
]

{ #category : #meta }
EDASPredefinedEnvironmentSettingsInMemoryAdapter class >> label [

	^ #'pharoeda.settings.adapters.environment.predefined.label'
]

{ #category : #meta }
EDASPredefinedEnvironmentSettingsInMemoryAdapter class >> portLabel [

	^ #'pharoeda.settings.ports.environment.predefined.label'
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
	
	<edaSettings: #'pharoeda.settings.adapters.environment.label'
	withDescription:
	#'pharoeda.settings.adapters.environment.description' icon:
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
