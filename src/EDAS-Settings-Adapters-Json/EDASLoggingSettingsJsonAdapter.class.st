Class {
	#name : #EDASLoggingSettingsJsonAdapter,
	#superclass : #Object,
	#traits : 'EDASSettingsPort + EDASLoggingSettingsPort + EDASSettingsJsonAdapter',
	#classTraits : 'EDASSettingsPort classTrait + EDASLoggingSettingsPort classTrait + EDASSettingsJsonAdapter classTrait',
	#instVars : [
		'loggingLevel'
	],
	#category : #'EDAS-Settings-Adapters-Json'
}

{ #category : #'instance creation' }
EDASLoggingSettingsJsonAdapter class >> fromFile: aFileReference withApp: anEDAApplication [

	| result json entries |
	result := self withApp: anEDAApplication.
	json := (NeoJSONReader on: aFileReference readStream) next.
	entries := (json at: 'logging').
	entries keysAndValuesDo: [ :k :v | result instVarNamed: k put: v ].
	^ result
]

{ #category : #accessing }
EDASLoggingSettingsJsonAdapter >> loggingLevel [

	<edaSettings: #'pharoeda.settings.ports.logging.level.label'
	withDescription: #'pharoeda.settings.ports.logging.level.description'
	icon: #level atPosition: 1 readOnly: false multiple: true>
	^ loggingLevel ifNil: [ #info ]
]

{ #category : #accessing }
EDASLoggingSettingsJsonAdapter >> loggingLevel: anObject [

	loggingLevel := anObject
]

{ #category : #accessing }
EDASLoggingSettingsJsonAdapter >> values: aSymbol [

	^ EDASLoggingSettingsInMemoryAdapter new values: aSymbol
]
