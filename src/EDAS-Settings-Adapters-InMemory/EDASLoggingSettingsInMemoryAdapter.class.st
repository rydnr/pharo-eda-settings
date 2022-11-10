Class {
	#name : #EDASLoggingSettingsInMemoryAdapter,
	#superclass : #Object,
	#traits : 'EDASLoggingSettingsPort',
	#classTraits : 'EDASLoggingSettingsPort classTrait',
	#instVars : [
		'level',
		'edaApplication',
		'levelsDict',
		'levelsReverseDict'
	],
	#category : #'EDAS-Settings-Adapters-InMemory'
}

{ #category : #testing }
EDASLoggingSettingsInMemoryAdapter class >> accepts: anEDAApplication [
	^ true
]

{ #category : #testing }
EDASLoggingSettingsInMemoryAdapter class >> description [

	^ #'pharoeda.settings.ports.logging.description'
]

{ #category : #testing }
EDASLoggingSettingsInMemoryAdapter class >> label [

	^ #'pharoeda.settings.ports.logging.label'
]

{ #category : #metadata }
EDASLoggingSettingsInMemoryAdapter class >> portLabel [

	^ #'pharoeda.settings.ports.logging.manual.label'
]

{ #category : #accessing }
EDASLoggingSettingsInMemoryAdapter class >> priority [

	^ 99
]

{ #category : #accessing }
EDASLoggingSettingsInMemoryAdapter >> edaApplication [
	^ edaApplication
]

{ #category : #accessing }
EDASLoggingSettingsInMemoryAdapter >> edaApplication: anEDAApplication [
	edaApplication := anEDAApplication
]

{ #category : #initialization }
EDASLoggingSettingsInMemoryAdapter >> initialize [

	levelsDict := Dictionary new.
	levelsDict
		at: #'pharoeda.settings.ports.logging.level.trace' put: #trace;
		at: #'pharoeda.settings.ports.logging.level.debug' put: #debug;
		at: #'pharoeda.settings.ports.logging.level.info' put: #info;
		at: #'pharoeda.settings.ports.logging.level.warning' put: #warning;
		at: #'pharoeda.settings.ports.logging.level.error' put: #error.
	levelsReverseDict := Dictionary new.
	levelsDict keysAndValuesDo: [ :k :v | levelsReverseDict at: v put: k ]
]

{ #category : #accessing }
EDASLoggingSettingsInMemoryAdapter >> keyIn: aSymbol forValue: value [

	^ aSymbol = #level
		  ifTrue: [ levelsReverseDict at: value ]
		  ifFalse: [ nil ]
]

{ #category : #accessing }
EDASLoggingSettingsInMemoryAdapter >> level [

	<edaSettings: #'pharoeda.settings.ports.logging.level.label'
	withDescription:
	#'pharoeda.settings.ports.logging.level.description' icon: #level
	atPosition: 1 readOnly: false multiple: true>
	^ level ifNil: [ #info ]
]

{ #category : #accessing }
EDASLoggingSettingsInMemoryAdapter >> level: aString [

	level := aString
]

{ #category : #accessing }
EDASLoggingSettingsInMemoryAdapter >> values: aSymbol [

	^ aSymbol = #level
		  ifTrue: [  
		  levelsDict associations collect: [ :e | e key translated -> e value ] ]
			   
		  ifFalse: [ OrderedCollection new ]
]
