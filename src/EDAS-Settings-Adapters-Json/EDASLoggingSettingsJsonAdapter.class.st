Class {
	#name : #EDASLoggingSettingsJsonAdapter,
	#superclass : #Object,
	#traits : 'EDASSettingsPort + EDASLoggingSettingsPort + EDASSettingsJsonAdapter',
	#classTraits : 'EDASSettingsPort classTrait + EDASLoggingSettingsPort classTrait + EDASSettingsJsonAdapter classTrait',
	#instVars : [
		'level'
	],
	#category : #'EDAS-Settings-Adapters-Json'
}

{ #category : #metadata }
EDASLoggingSettingsJsonAdapter class >> edaPort [

	^ EDASLoggingSettingsInMemoryAdapter
]

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
EDASLoggingSettingsJsonAdapter >> level [

	<edaSettings: #'pharoeda.settings.ports.logging.level.label'
	withDescription: #'pharoeda.settings.ports.logging.level.description'
	icon: #level atPosition: 1 readOnly: false multiple: true>
	^ level ifNil: [ #info ]
]

{ #category : #accessing }
EDASLoggingSettingsJsonAdapter >> level: anObject [

	level := anObject
]

{ #category : #accessing }
EDASLoggingSettingsJsonAdapter >> values: aSymbol [

	^ EDASLoggingSettingsInMemoryAdapter new values: aSymbol
]
