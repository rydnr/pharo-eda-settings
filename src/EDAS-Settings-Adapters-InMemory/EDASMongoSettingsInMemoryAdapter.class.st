Class {
	#name : #EDASMongoSettingsInMemoryAdapter,
	#superclass : #Object,
	#instVars : [
		'authenticationMechanism',
		'databaseName',
		'debug',
		'enableReplication',
		'enableSingleton',
		'ensuringCurrentOnSave',
		'ensuringCurrentReferencesOnQueries',
		'forceEager',
		'lazySynchronize',
		'password',
		'tls',
		'urls',
		'username',
		'wireProtocolEnabled',
		'edaApplication'
	],
	#category : #'EDAS-Settings-Adapters-InMemory'
}

{ #category : #accessing }
EDASMongoSettingsInMemoryAdapter class >> iconFor: arg1 in: arg2 [ 
	^ self subclassResponsibility
]

{ #category : #accessing }
EDASMongoSettingsInMemoryAdapter >> authenticationMechanism [
	^ authenticationMechanism
]

{ #category : #accessing }
EDASMongoSettingsInMemoryAdapter >> authenticationMechanism: anObject [
	authenticationMechanism := anObject
]

{ #category : #accessing }
EDASMongoSettingsInMemoryAdapter >> databaseName [
	^ databaseName
]

{ #category : #accessing }
EDASMongoSettingsInMemoryAdapter >> databaseName: anObject [
	databaseName := anObject
]

{ #category : #accessing }
EDASMongoSettingsInMemoryAdapter >> debug [
	^ debug
]

{ #category : #accessing }
EDASMongoSettingsInMemoryAdapter >> debug: aBoolean [
	debug = aBoolean
		ifTrue: [ ^ self ].
	debug := aBoolean
]

{ #category : #accessing }
EDASMongoSettingsInMemoryAdapter >> doInitialize [
	self urls: nil.
	self tls: nil.
	self databaseName: nil.
	self username: nil.
	self password: nil.
	self debug: nil.
	self enableReplication: nil.
	self enableSingleton: nil.
	self ensuringCurrentOnSave: nil.
	self ensuringCurrentReferencesOnQueries: nil.
	self forceEager: nil.
	self lazySynchronize: nil.
	self wireProtocolEnabled: nil
]

{ #category : #accessing }
EDASMongoSettingsInMemoryAdapter >> edaApplication [
	^ edaApplication
]

{ #category : #accessing }
EDASMongoSettingsInMemoryAdapter >> edaApplication: anEDAApplication [
	edaApplication := anEDAApplication
]

{ #category : #accessing }
EDASMongoSettingsInMemoryAdapter >> enableReplication [
	^ enableReplication
]

{ #category : #accessing }
EDASMongoSettingsInMemoryAdapter >> enableReplication: aBoolean [
	enableReplication = aBoolean
		ifTrue: [ ^ self ].
	enableReplication := aBoolean
]

{ #category : #accessing }
EDASMongoSettingsInMemoryAdapter >> enableSingleton [
	^ enableSingleton
]

{ #category : #accessing }
EDASMongoSettingsInMemoryAdapter >> enableSingleton: aBoolean [
	enableSingleton = aBoolean
		ifTrue: [ ^ self ].
	enableSingleton := aBoolean
]

{ #category : #accessing }
EDASMongoSettingsInMemoryAdapter >> ensuringCurrentOnSave [
	^ ensuringCurrentOnSave
]

{ #category : #accessing }
EDASMongoSettingsInMemoryAdapter >> ensuringCurrentOnSave: aBoolean [
	ensuringCurrentOnSave = aBoolean
		ifTrue: [ ^ self ].
	ensuringCurrentOnSave := aBoolean
]

{ #category : #accessing }
EDASMongoSettingsInMemoryAdapter >> ensuringCurrentReferencesOnQueries [
	^ ensuringCurrentReferencesOnQueries
]

{ #category : #accessing }
EDASMongoSettingsInMemoryAdapter >> ensuringCurrentReferencesOnQueries: aBoolean [
	ensuringCurrentReferencesOnQueries = aBoolean
		ifTrue: [ ^ self ].
	ensuringCurrentReferencesOnQueries := aBoolean
]

{ #category : #accessing }
EDASMongoSettingsInMemoryAdapter >> forceEager [
	^ forceEager
]

{ #category : #accessing }
EDASMongoSettingsInMemoryAdapter >> forceEager: aBoolean [
	forceEager = aBoolean
		ifTrue: [ ^ self ].
	forceEager := aBoolean
]

{ #category : #accessing }
EDASMongoSettingsInMemoryAdapter >> initialize [
	super initialize.
	self doInitialize
]

{ #category : #accessing }
EDASMongoSettingsInMemoryAdapter >> lazySynchronize [
	^ lazySynchronize
]

{ #category : #accessing }
EDASMongoSettingsInMemoryAdapter >> lazySynchronize: aBoolean [
	lazySynchronize = aBoolean
		ifTrue: [ ^ self ].
	lazySynchronize := aBoolean
]

{ #category : #accessing }
EDASMongoSettingsInMemoryAdapter >> password [
	^ password
]

{ #category : #accessing }
EDASMongoSettingsInMemoryAdapter >> password: anObject [
	password := anObject
]

{ #category : #accessing }
EDASMongoSettingsInMemoryAdapter >> tls [
	^ tls
]

{ #category : #accessing }
EDASMongoSettingsInMemoryAdapter >> tls: aBoolean [
	tls := aBoolean
]

{ #category : #accessing }
EDASMongoSettingsInMemoryAdapter >> urls [
	^ urls
]

{ #category : #accessing }
EDASMongoSettingsInMemoryAdapter >> urls: aString [
	urls := aString
]

{ #category : #accessing }
EDASMongoSettingsInMemoryAdapter >> username [
	^ username
]

{ #category : #accessing }
EDASMongoSettingsInMemoryAdapter >> username: anObject [
	username := anObject
]

{ #category : #accessing }
EDASMongoSettingsInMemoryAdapter >> wireProtocolEnabled [
	^ wireProtocolEnabled
]

{ #category : #accessing }
EDASMongoSettingsInMemoryAdapter >> wireProtocolEnabled: aBoolean [
	wireProtocolEnabled = aBoolean
		ifTrue: [ ^ self ].
	wireProtocolEnabled := aBoolean
]
