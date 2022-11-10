Class {
	#name : #EDASMongodbSettingsInMemoryAdapter,
	#superclass : #Object,
	#instVars : [
		'host',
		'port',
		'user',
		'password',
		'database',
		'authenticationMechanism',
		'debug',
		'enableReplication',
		'enableSingleton',
		'ensuringCurrentOnSave',
		'ensuringCurrentReferencesOnQueries',
		'lazySynchronize',
		'wireProtocolEnabled',
		'tls',
		'urls',
		'forceEager',
		'edaApplication'
	],
	#category : #'EDAS-Settings-Adapters-InMemory'
}

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter class >> iconFor: arg1 in: arg2 [ 
	^ self subclassResponsibility
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter >> authenticationMechanism [
	^ authenticationMechanism
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter >> authenticationMechanism: anObject [
	authenticationMechanism := anObject
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter >> database [

	^ database ifNil: [ '' ]
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter >> database: anObject [

	database := anObject
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter >> debug [

	^ debug ifNil: [ true ]
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter >> debug: aBoolean [
	debug = aBoolean
		ifTrue: [ ^ self ].
	debug := aBoolean
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter >> doInitialize [

	self urls: nil.
	self tls: nil.
	self database: nil.
	self user: nil.
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
EDASMongodbSettingsInMemoryAdapter >> edaApplication [
	^ edaApplication
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter >> edaApplication: anEDAApplication [
	edaApplication := anEDAApplication
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter >> enableReplication [

	^ enableReplication ifNil: [ false ]
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter >> enableReplication: aBoolean [
	enableReplication = aBoolean
		ifTrue: [ ^ self ].
	enableReplication := aBoolean
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter >> enableSingleton [

	^ enableSingleton ifNil: [ false ]
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter >> enableSingleton: aBoolean [
	enableSingleton = aBoolean
		ifTrue: [ ^ self ].
	enableSingleton := aBoolean
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter >> ensuringCurrentOnSave [

	^ ensuringCurrentOnSave ifNil: [ false ]
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter >> ensuringCurrentOnSave: aBoolean [
	ensuringCurrentOnSave = aBoolean
		ifTrue: [ ^ self ].
	ensuringCurrentOnSave := aBoolean
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter >> ensuringCurrentReferencesOnQueries [

	^ ensuringCurrentReferencesOnQueries ifNil: [ false ]
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter >> ensuringCurrentReferencesOnQueries: aBoolean [
	ensuringCurrentReferencesOnQueries = aBoolean
		ifTrue: [ ^ self ].
	ensuringCurrentReferencesOnQueries := aBoolean
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter >> forceEager [

	^ forceEager ifNil: [ false ]
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter >> forceEager: aBoolean [
	forceEager = aBoolean
		ifTrue: [ ^ self ].
	forceEager := aBoolean
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter >> host [

	^ host ifNil: [ '' ]
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter >> host: aString [

	^ host ifNil: [ 'localhost' ]
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter >> initialize [
	super initialize.
	self doInitialize
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter >> lazySynchronize [

	^ lazySynchronize ifNil: [ true ]
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter >> lazySynchronize: aBoolean [
	lazySynchronize = aBoolean
		ifTrue: [ ^ self ].
	lazySynchronize := aBoolean
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter >> password [

	^ password ifNil: [ '' ]
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter >> password: anObject [
	password := anObject
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter >> port [

	^ port ifNil: [ 27017 ]
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter >> port: anObject [

	port := anObject
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter >> tls [

	^ tls ifNil: [ false ]
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter >> tls: aBoolean [
	tls := aBoolean
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter >> urls [

	^ urls ifNil: [ '' ]
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter >> urls: aString [
	urls := aString
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter >> user [

	^ user ifNil: [ '' ]
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter >> user: anObject [

	user := anObject
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter >> values: aSymbol [

	^ aSymbol = #authenticationMechanism
		  ifTrue: [ 
			  Dictionary new
				  at:
					  #'pharoeda.settings.adapters.mongodb.authenticationMechanism.scramsha256'
						  translated
				  put: #'SCRAM-SHA-256';
				  at:
					  #'pharoeda.settings.adapters.mongodb.authenticationMechanism.mongodbcr'
						  translated
				  put: #'MONGODB-CR';
				  associations ]
		  ifFalse: [ OrderedCollection new ]
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter >> wireProtocolEnabled [

	^ wireProtocolEnabled ifNil: [ false ]
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter >> wireProtocolEnabled: aBoolean [
	wireProtocolEnabled = aBoolean
		ifTrue: [ ^ self ].
	wireProtocolEnabled := aBoolean
]
