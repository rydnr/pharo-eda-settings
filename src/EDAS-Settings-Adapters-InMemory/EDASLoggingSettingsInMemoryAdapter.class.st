Class {
	#name : #EDASLoggingSettingsInMemoryAdapter,
	#superclass : #Object,
	#traits : 'EDASLoggingSettingsPort + EDASInMemoryAdapter',
	#classTraits : 'EDASLoggingSettingsPort classTrait + EDASInMemoryAdapter classTrait',
	#instVars : [
		'loggingLevel',
		'edaApplication'
	],
	#category : #'EDAS-Settings-Adapters-InMemory'
}

{ #category : #testing }
EDASLoggingSettingsInMemoryAdapter class >> accepts: anEDAApplication [
	^ true
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
EDASLoggingSettingsInMemoryAdapter >> loggingLevel [
	^ loggingLevel
]

{ #category : #accessing }
EDASLoggingSettingsInMemoryAdapter >> loggingLevel: aString [
	loggingLevel := aString
]
