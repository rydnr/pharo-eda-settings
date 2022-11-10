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

{ #category : #testing }
EDASLoggingSettingsJsonAdapter class >> description [

	^ #'pharoeda.settings.ports.logging.description'
]

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

{ #category : #testing }
EDASLoggingSettingsJsonAdapter class >> icon [

	^ EDACIconProvider new iconNamed: #logging orElse: #comments
]

{ #category : #testing }
EDASLoggingSettingsJsonAdapter class >> label [

	^ #'pharoeda.settings.ports.logging.label'
]

{ #category : #testing }
EDASLoggingSettingsJsonAdapter >> isReadOnly: aString [

	^ true
]

{ #category : #accessing }
EDASLoggingSettingsJsonAdapter >> keyIn: aSymbol forValue: aValue [

	^ EDASLoggingSettingsInMemoryAdapter new keyIn: aSymbol forValue: aValue
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
