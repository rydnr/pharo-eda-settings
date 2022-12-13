Class {
	#name : #EDASMongodbSettingsInMemoryAdapter,
	#superclass : #Object,
	#traits : 'EDACSourceCodeHelper',
	#classTraits : 'EDACSourceCodeHelper classTrait',
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
		'edaApplication',
		'authenticationMechanismsDict',
		'authenticationMechanismsReverseDict'
	],
	#category : #'EDAS-Settings-Adapters-InMemory'
}

{ #category : #testing }
EDASMongodbSettingsInMemoryAdapter class >> < anotherAdapterClass [

	self subclassResponsibility
]

{ #category : #testing }
EDASMongodbSettingsInMemoryAdapter class >> <= anotherAdapterClass [

	self subclassResponsibility
]

{ #category : #testing }
EDASMongodbSettingsInMemoryAdapter class >> > anotherAdapterClass [

	self subclassResponsibility
]

{ #category : #testing }
EDASMongodbSettingsInMemoryAdapter class >> >= anotherAdapterClass [

	self subclassResponsibility 
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter class >> accepts: arg1 inApp: arg2 [ 
	^ self subclassResponsibility
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter class >> adapterAccessor [
	^ self subclassResponsibility
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter class >> adapterClassAccessor [
	^ self subclassResponsibility
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter class >> availableAuthenticationMechanisms [
	^ self subclassResponsibility
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter class >> changedEventName [
	^ self subclassResponsibility
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter class >> description [
	^ self subclassResponsibility
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter class >> edaPort [
	^ self subclassResponsibility
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter class >> icon [
	^ self subclassResponsibility
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter class >> iconFor: arg1 in: arg2 [ 
	^ self subclassResponsibility
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter class >> portChangedEventName [
	^ self subclassResponsibility
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter class >> portLabel [
	^ self subclassResponsibility
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter class >> position [
	^ self subclassResponsibility
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter class >> priority [
	^ self subclassResponsibility
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter class >> selector [
	^ self subclassResponsibility
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter class >> settingsAttributes [
	^ self subclassResponsibility
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter class >> settingsBlock [
	^ self subclassResponsibility
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter class >> withApp: arg1 [ 
	^ self subclassResponsibility
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter >> adapterFor: arg1 is: arg2 [ 
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
EDASMongodbSettingsInMemoryAdapter >> description [
	^ self subclassResponsibility
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter >> descriptionFor: arg1 [ 
	^ self subclassResponsibility
]

{ #category : #initialization }
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
	self wireProtocolEnabled: nil.
	authenticationMechanismsDict := Dictionary new.
	(MongoAuthMechanism allSubclasses reject: [ :s | s isAbstract ]) do: [ 
		:s | 
		authenticationMechanismsDict
			at: ('pharoeda.settings.adapters.mongodb.authenticationMechanism.'
				 , (self toCamelCase: s mechanismName) asLowercase) asSymbol
			put: s mechanismName ].
	authenticationMechanismsReverseDict := Dictionary new.
	authenticationMechanismsDict keysAndValuesDo: [ :k :v | 
		authenticationMechanismsReverseDict at: v put: k ]
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
EDASMongodbSettingsInMemoryAdapter >> icon [
	^ self subclassResponsibility
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter >> iconFor: arg1 [ 
	^ self subclassResponsibility
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter >> iconFor: arg1 in: arg2 [ 
	^ self subclassResponsibility
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter >> initialize [
	super initialize.
	self doInitialize
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter >> isReadOnly: arg1 [ 
	^ self subclassResponsibility
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter >> keyIn: aSymbol forValue: value [

	^ aSymbol = #authenticationMechanism
		  ifTrue: [ authenticationMechanismsReverseDict at: value ]
		  ifFalse: [ nil ]
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter >> label [
	^ self subclassResponsibility
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter >> labelFor: arg1 [ 
	^ self subclassResponsibility
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
EDASMongodbSettingsInMemoryAdapter >> selector [
	^ self subclassResponsibility
]

{ #category : #accessing }
EDASMongodbSettingsInMemoryAdapter >> supportsMultiple: arg1 [ 
	^ self subclassResponsibility
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
		  ifTrue: [ authenticationMechanismsDict associations collect: [ :e | e key translated -> e value ] ]
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
