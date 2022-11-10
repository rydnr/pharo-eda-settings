Trait {
	#name : #EDASMongodbSettingsJsonAdapter,
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
		'forceEager'
	],
	#traits : 'EDASSettingsJsonAdapter',
	#classTraits : 'EDASSettingsJsonAdapter classTrait',
	#category : #'EDAS-Settings-Adapters-Json'
}

{ #category : #accessing }
EDASMongodbSettingsJsonAdapter classSide >> availableAuthenticationMechanisms [

	^ OrderedCollection with: 'SCRAM-SHA-256' with: 'MONGODB-CR'
]

{ #category : #'instance creation' }
EDASMongodbSettingsJsonAdapter classSide >> fromFile: aFileReference under: aLabel withApp: anEDAApplication [

	^ self
		  fromFile: aFileReference
		  under: aLabel
		  for: 'mongodb'
		  withApp: anEDAApplication
]

{ #category : #accessing }
EDASMongodbSettingsJsonAdapter >> authenticationMechanism [

	^ authenticationMechanism ifNil: [ 
		  self availableAuthenticationMechanisms first ]
]

{ #category : #accessing }
EDASMongodbSettingsJsonAdapter >> authenticationMechanism: anObject [

	authenticationMechanism := anObject
]

{ #category : #accessing }
EDASMongodbSettingsJsonAdapter >> availableAuthenticationMechanisms [

	^ self class availableAuthenticationMechanisms
]

{ #category : #accessing }
EDASMongodbSettingsJsonAdapter >> database [

	^ database ifNil: [ '' ]
]

{ #category : #accessing }
EDASMongodbSettingsJsonAdapter >> database: anObject [

	database := anObject
]

{ #category : #accessing }
EDASMongodbSettingsJsonAdapter >> debug [

	^ debug ifNil: [ true ]
]

{ #category : #accessing }
EDASMongodbSettingsJsonAdapter >> debug: anObject [

	debug := anObject
]

{ #category : #accessing }
EDASMongodbSettingsJsonAdapter >> enableReplication [

	^ enableReplication ifNil: [ false ]
]

{ #category : #accessing }
EDASMongodbSettingsJsonAdapter >> enableReplication: anObject [

	enableReplication := anObject
]

{ #category : #accessing }
EDASMongodbSettingsJsonAdapter >> enableSingleton [

	^ enableSingleton ifNil: [ false ]
]

{ #category : #accessing }
EDASMongodbSettingsJsonAdapter >> enableSingleton: anObject [

	enableSingleton := anObject
]

{ #category : #accessing }
EDASMongodbSettingsJsonAdapter >> ensuringCurrentOnSave [

	^ ensuringCurrentOnSave ifNil: [ true ]
]

{ #category : #accessing }
EDASMongodbSettingsJsonAdapter >> ensuringCurrentOnSave: anObject [

	ensuringCurrentOnSave := anObject
]

{ #category : #accessing }
EDASMongodbSettingsJsonAdapter >> ensuringCurrentReferencesOnQueries [

	^ ensuringCurrentReferencesOnQueries ifNil: [ true ]
]

{ #category : #accessing }
EDASMongodbSettingsJsonAdapter >> ensuringCurrentReferencesOnQueries: anObject [

	ensuringCurrentReferencesOnQueries := anObject
]

{ #category : #accessing }
EDASMongodbSettingsJsonAdapter >> forceEager [

	^ forceEager ifNil: [ false ]
]

{ #category : #accessing }
EDASMongodbSettingsJsonAdapter >> forceEager: anObject [

	forceEager := anObject
]

{ #category : #accessing }
EDASMongodbSettingsJsonAdapter >> host [

	^ host ifNil: [ 'localhost' ]
]

{ #category : #accessing }
EDASMongodbSettingsJsonAdapter >> host: anObject [

	host := anObject
]

{ #category : #accessing }
EDASMongodbSettingsJsonAdapter >> lazySynchronize [

	^ lazySynchronize ifNil: [ true ]
]

{ #category : #accessing }
EDASMongodbSettingsJsonAdapter >> lazySynchronize: anObject [

	lazySynchronize := anObject
]

{ #category : #accessing }
EDASMongodbSettingsJsonAdapter >> password [

	^ password ifNil: [ '' ]
]

{ #category : #accessing }
EDASMongodbSettingsJsonAdapter >> password: anObject [

	password := anObject
]

{ #category : #accessing }
EDASMongodbSettingsJsonAdapter >> port [

	^ port ifNil: [ 27017 ]
]

{ #category : #accessing }
EDASMongodbSettingsJsonAdapter >> port: anObject [

	port := anObject
]

{ #category : #accessing }
EDASMongodbSettingsJsonAdapter >> tls [

	^ tls ifNil: [ false ]
]

{ #category : #accessing }
EDASMongodbSettingsJsonAdapter >> tls: anObject [

	tls := anObject
]

{ #category : #accessing }
EDASMongodbSettingsJsonAdapter >> urls [

	^ urls ifNil: [ '' ]
]

{ #category : #accessing }
EDASMongodbSettingsJsonAdapter >> urls: anObject [

	urls := anObject
]

{ #category : #accessing }
EDASMongodbSettingsJsonAdapter >> user [

	^ user ifNil: [ '' ]
]

{ #category : #accessing }
EDASMongodbSettingsJsonAdapter >> user: anObject [

	user := anObject
]

{ #category : #accessing }
EDASMongodbSettingsJsonAdapter >> wireProtocolEnabled [

	^ wireProtocolEnabled ifNil: [ false ]
]

{ #category : #accessing }
EDASMongodbSettingsJsonAdapter >> wireProtocolEnabled: anObject [

	wireProtocolEnabled := anObject
]
