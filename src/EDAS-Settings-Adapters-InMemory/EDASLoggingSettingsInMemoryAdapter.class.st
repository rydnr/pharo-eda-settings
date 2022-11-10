Class {
	#name : #EDASLoggingSettingsInMemoryAdapter,
	#superclass : #Object,
	#traits : 'EDASLoggingSettingsPort',
	#classTraits : 'EDASLoggingSettingsPort classTrait',
	#instVars : [
		'level',
		'edaApplication'
	],
	#category : #'EDAS-Settings-Adapters-InMemory'
}

{ #category : #testing }
EDASLoggingSettingsInMemoryAdapter class >> accepts: anEDAApplication [
	^ true
]

{ #category : #testing }
EDASLoggingSettingsInMemoryAdapter class >> description [

	^ #'pharoeda.settings.ports.logging.manual.description'
]

{ #category : #testing }
EDASLoggingSettingsInMemoryAdapter class >> label [

	^ #'pharoeda.settings.adapters.logging.manual.label'
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

{ #category : #accessing }
EDASLoggingSettingsInMemoryAdapter >> level [

	<edaSettings: #'pharoeda.settings.adapters.logging.label'
	withDescription: #'pharoeda.settings.adapters.logging.description'
	icon: #level atPosition: 1 readOnly: false multiple: true>
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
			  Dictionary new
				  at: #'pharoeda.settings.adapters.logging.level.trace' translated
				  put: #trace;
				  at: #'pharoeda.settings.adapters.logging.level.debug' translated
				  put: #debug;
				  at: #'pharoeda.settings.adapters.logging.level.info' translated
				  put: #info;
				  at:
					  #'pharoeda.settings.adapters.logging.level.warning' translated
				  put: #warning;
				  at: #'pharoeda.settings.adapters.logging.level.error' translated
				  put: #error;
				  associations ]
		  ifFalse: [ OrderedCollection new ]
]
