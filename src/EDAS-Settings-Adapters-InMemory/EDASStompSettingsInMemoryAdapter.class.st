Class {
	#name : #EDASStompSettingsInMemoryAdapter,
	#superclass : #Object,
	#traits : 'EDASInMemoryAdapter',
	#classTraits : 'EDASInMemoryAdapter classTrait',
	#instVars : [
		'host',
		'port',
		'username',
		'password',
		'timeout',
		'debug',
		'durable',
		'restartOnError',
		'errorStrategyName',
		'edaApplication'
	],
	#category : #'EDAS-Settings-Adapters-InMemory'
}

{ #category : #resolving }
EDASStompSettingsInMemoryAdapter class >> availableErrorStrategies [

	^ EDAEErrorHandlingStrategy subclasses collect: [ :s | s name ]
]

{ #category : #accessing }
EDASStompSettingsInMemoryAdapter >> availableErrorStrategies [ 

	^ self class availableErrorStrategies
]

{ #category : #accessing }
EDASStompSettingsInMemoryAdapter >> debug [

	^ debug ifNil: [ true ]
]

{ #category : #accessing }
EDASStompSettingsInMemoryAdapter >> debug: aBoolean [
	debug := aBoolean
]

{ #category : #'class initialization' }
EDASStompSettingsInMemoryAdapter >> doInitialize [

	self host: nil.
	self port: nil.
	self username: nil.
	self password: nil.
	self timeout: nil.
	self durable: true
]

{ #category : #accessing }
EDASStompSettingsInMemoryAdapter >> durable [

	^ durable ifNil: [ true ]
]

{ #category : #accessing }
EDASStompSettingsInMemoryAdapter >> durable: flag [
	durable := flag
]

{ #category : #accessing }
EDASStompSettingsInMemoryAdapter >> edaApplication [
	^ edaApplication
]

{ #category : #accessing }
EDASStompSettingsInMemoryAdapter >> edaApplication: anEDAApplication [
	edaApplication := anEDAApplication
]

{ #category : #accessing }
EDASStompSettingsInMemoryAdapter >> errorStrategy [

	^ Smalltalk at: self errorStrategyName asSymbol
]

{ #category : #accessing }
EDASStompSettingsInMemoryAdapter >> errorStrategyName [

	^ errorStrategyName
]

{ #category : #accessing }
EDASStompSettingsInMemoryAdapter >> errorStrategyName: anObject [

	errorStrategyName := anObject
]

{ #category : #accessing }
EDASStompSettingsInMemoryAdapter >> host [

	^ host ifNil: [ 'localhost' ]
]

{ #category : #accessing }
EDASStompSettingsInMemoryAdapter >> host: val [
	host := val
]

{ #category : #'class initialization' }
EDASStompSettingsInMemoryAdapter >> initialize [
	super initialize.
	self doInitialize
]

{ #category : #accessing }
EDASStompSettingsInMemoryAdapter >> password [

	^ password ifNil: [ '' ]
]

{ #category : #accessing }
EDASStompSettingsInMemoryAdapter >> password: val [
	password := val
]

{ #category : #accessing }
EDASStompSettingsInMemoryAdapter >> port [

	^ port ifNil: [ 61613 ]
]

{ #category : #accessing }
EDASStompSettingsInMemoryAdapter >> port: val [
	port := val
]

{ #category : #accessing }
EDASStompSettingsInMemoryAdapter >> restartOnError [

	^ restartOnError ifNil: [ true ]
]

{ #category : #accessing }
EDASStompSettingsInMemoryAdapter >> restartOnError: anObject [

	restartOnError := anObject
]

{ #category : #testing }
EDASStompSettingsInMemoryAdapter >> supportsMultiple: aSymbol [

	^ aSymbol = #errorStrategyName
]

{ #category : #accessing }
EDASStompSettingsInMemoryAdapter >> timeout [

	^ timeout ifNil: [ 60 ]
]

{ #category : #accessing }
EDASStompSettingsInMemoryAdapter >> timeout: val [
	timeout := val
]

{ #category : #accessing }
EDASStompSettingsInMemoryAdapter >> username [

	^ username ifNil: [ '' ]
]

{ #category : #accessing }
EDASStompSettingsInMemoryAdapter >> username: val [
	username := val
]

{ #category : #accessing }
EDASStompSettingsInMemoryAdapter >> values: aSymbol [

	aSymbol = #errorStrategyName
		ifTrue: [ ^ self availableErrorStrategies ]
		ifFalse: [ ^ OrderedCollection new ]
]
