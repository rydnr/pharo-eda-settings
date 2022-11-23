Class {
	#name : #EDASEnvironmentSettingsInMemoryAdapter,
	#superclass : #Object,
	#traits : 'EDASEnvironmentSettingsPort',
	#classTraits : 'EDASEnvironmentSettingsPort classTrait',
	#instVars : [
		'currentEnvironment',
		'defaultEnvironment',
		'edaApplication'
	],
	#category : #'EDAS-Settings-Adapters-InMemory'
}

{ #category : #testing }
EDASEnvironmentSettingsInMemoryAdapter class >> accepts: aPort inApp: anEDAApplication [

	^ aPort = EDASEnvironmentSettingsPort
]

{ #category : #metadata }
EDASEnvironmentSettingsInMemoryAdapter class >> description [

	^ #'pharoeda.settings.ports.environment.manual.description'
]

{ #category : #metadata }
EDASEnvironmentSettingsInMemoryAdapter class >> label [

	^ #'pharoeda.settings.adapters.environment.manual.label'
]

{ #category : #metadata }
EDASEnvironmentSettingsInMemoryAdapter class >> portLabel [

	^ #'pharoeda.settings.ports.environment.manual.label'
]

{ #category : #accessing }
EDASEnvironmentSettingsInMemoryAdapter class >> priority [
	^ 99
]

{ #category : #abstract }
EDASEnvironmentSettingsInMemoryAdapter >> currentEnvironment [

	<edaSettings: 
	#'pharoeda.settings.adapters.environment.label'	
	withDescription:
	#'pharoeda.settings.adapters.environment.description'	
	 icon:
	#environment atPosition: 1 readOnly: false multiple: false>
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
EDASEnvironmentSettingsInMemoryAdapter >> defaultEnvironment [

	^ defaultEnvironment ifNil: [ 
		  (self availableEnvironments: self edaApplication)
			  ifEmpty: [ self currentEnvironment ]
			  ifNotEmpty: [ :c | c first ] ]
]

{ #category : #accessing }
EDASEnvironmentSettingsInMemoryAdapter >> defaultEnvironment: anObject [

	defaultEnvironment := anObject
]

{ #category : #accessing }
EDASEnvironmentSettingsInMemoryAdapter >> edaApplication [
	^ edaApplication
]

{ #category : #accessing }
EDASEnvironmentSettingsInMemoryAdapter >> edaApplication: anEDAApplication [
	edaApplication := anEDAApplication
]
