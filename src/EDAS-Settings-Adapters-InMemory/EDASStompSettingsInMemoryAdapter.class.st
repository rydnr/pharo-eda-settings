Class {
	#name : #EDASStompSettingsInMemoryAdapter,
	#superclass : #Object,
	#traits : 'EDASInMemoryAdapter + EDASStompSettingsPort',
	#classTraits : 'EDASInMemoryAdapter classTrait + EDASStompSettingsPort classTrait',
	#instVars : [
		'host',
		'port',
		'username',
		'password',
		'timeout',
		'debug',
		'durable',
		'errorStrategyName',
		'edaApplication',
		'restartOnErrors',
		'user'
	],
	#category : #'EDAS-Settings-Adapters-InMemory'
}

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
	self user: nil.
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
EDASStompSettingsInMemoryAdapter >> restartOnErrors [

	^ restartOnErrors ifNil: [ true ]
]

{ #category : #accessing }
EDASStompSettingsInMemoryAdapter >> restartOnErrors: aBoolean [
	restartOnErrors := aBoolean
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
EDASStompSettingsInMemoryAdapter >> user [

	^ user ifNil: [ '' ]
]

{ #category : #accessing }
EDASStompSettingsInMemoryAdapter >> user: aString [

	user := aString
]
