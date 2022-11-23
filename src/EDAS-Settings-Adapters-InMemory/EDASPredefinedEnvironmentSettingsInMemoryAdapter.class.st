Class {
	#name : #EDASPredefinedEnvironmentSettingsInMemoryAdapter,
	#superclass : #Object,
	#traits : 'EDASEnvironmentSettingsPort + EDACCollectionHelper',
	#classTraits : 'EDASEnvironmentSettingsPort classTrait + EDACCollectionHelper classTrait',
	#instVars : [
		'currentEnvironment',
		'defaultEnvironment'
	],
	#category : #'EDAS-Settings-Adapters-InMemory'
}

{ #category : #testing }
EDASPredefinedEnvironmentSettingsInMemoryAdapter class >> accepts: aPort inApp: anEDAApplication [

	^ aPort = EDASEnvironmentSettingsPort and: [ 
		  (self availableEnvironments: anEDAApplication) isNotEmpty ]
]

{ #category : #meta }
EDASPredefinedEnvironmentSettingsInMemoryAdapter class >> availableEnvironments: anEDAApplication [

	^ (EDASStompCommandListenerSettingsJsonAdapter availableEnvironments: anEDAApplication)
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
EDASPredefinedEnvironmentSettingsInMemoryAdapter >> availableEnvironments: anEDAApplication [

	^ self class availableEnvironments: anEDAApplication
]

{ #category : #abstract }
EDASPredefinedEnvironmentSettingsInMemoryAdapter >> currentEnvironment [

	<edaSettings: #'pharoeda.settings.adapters.environment.label'
	withDescription:
	#'pharoeda.settings.adapters.environment.description' icon:
	#environment atPosition: 1 readOnly: false multiple: true>
	^ currentEnvironment ifNil: [ 
		self defaultEnvironment ifNil: [ 
		  (self availableEnvironments: self edaApplication)
			  ifEmpty: [ '' ]
			  ifNotEmpty: [ :c | c first value ] ] ]
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

{ #category : #abstract }
EDASPredefinedEnvironmentSettingsInMemoryAdapter >> defaultEnvironment [

	^ defaultEnvironment
]
