Class {
	#name : #EDASMongodbEventStoreSettingsJsonAdapter,
	#superclass : #Object,
	#traits : 'EDASSettingsPort + EDASEventStoreSettingsPort + EDASMongodbSettingsJsonAdapter',
	#classTraits : 'EDASSettingsPort classTrait + EDASEventStoreSettingsPort classTrait + EDASMongodbSettingsJsonAdapter classTrait',
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
	#category : #'EDAS-Settings-Adapters-Json'
}

{ #category : #accessing }
EDASMongodbEventStoreSettingsJsonAdapter class >> changedEventName [

	^ EDASMongodbEventStoreSettingsInMemoryAdapter changedEventName
]

{ #category : #testing }
EDASMongodbEventStoreSettingsJsonAdapter class >> description [

	^ #'pharoeda.settings.adapters.event_store.mongodb.json.description'
]

{ #category : #metadata }
EDASMongodbEventStoreSettingsJsonAdapter class >> edaPort [

	"This gets called in EDASSettings when selecting the port, so it gets selected correctly"

	^ EDASMongodbEventStoreSettingsInMemoryAdapter
]

{ #category : #'instance creation' }
EDASMongodbEventStoreSettingsJsonAdapter class >> fromFile: aFileReference withApp: anEDAApplication [

	^ self
		  fromFile: aFileReference
		  under: 'eventStore'
		  withApp: anEDAApplication
]

{ #category : #testing }
EDASMongodbEventStoreSettingsJsonAdapter class >> icon [

	^ EDACIconProvider new iconNamed: #eventstore orElse: #comments
]

{ #category : #testing }
EDASMongodbEventStoreSettingsJsonAdapter class >> label [

	^ #'pharoeda.settings.adapters.event_store.mongodb.label'
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsJsonAdapter class >> portChangedEventName [

	^ EDASMongodbEventStoreSettingsInMemoryAdapter portChangedEventName
]

{ #category : #metadata }
EDASMongodbEventStoreSettingsJsonAdapter class >> portLabel [

	^ EDASMongodbEventStoreSettingsInMemoryAdapter portLabel
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsJsonAdapter >> authenticationMechanism [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.authenticationMechanism.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.authenticationMechanism.description'
	icon: #authentication atPosition: 6 readOnly: false multiple: true>
	^ authenticationMechanism
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsJsonAdapter >> authenticationMechanism: anObject [

	authenticationMechanism := anObject
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsJsonAdapter >> database [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.database.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.database.description' icon:
	#eventstore atPosition: 5 readOnly: false multiple: false>
	^ database ifNil: [ '' ]
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsJsonAdapter >> database: anObject [

	database := anObject
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsJsonAdapter >> debug [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.debug.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.debug.description' icon: #debug
	atPosition: 9 readOnly: false multiple: false>
	^ debug ifNil: [ true ]
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsJsonAdapter >> debug: anObject [

	debug := anObject
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsJsonAdapter >> enableReplication [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.enableReplication.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.enableReplication.description'
	icon: #replication atPosition: 10 readOnly: false multiple: false>
	^ enableReplication ifNil: [ false ]
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsJsonAdapter >> enableReplication: anObject [

	enableReplication := anObject
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsJsonAdapter >> enableSingleton [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.enableSingleton.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.enableSingleton.description'
	icon: #singleton atPosition: 16 readOnly: false multiple: false>
	^ enableSingleton ifNil: [ false ]
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsJsonAdapter >> enableSingleton: anObject [

	enableSingleton := anObject
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsJsonAdapter >> ensuringCurrentOnSave [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.ensuringCurrentOnSave.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.ensuringCurrentOnSave.description'
	icon: #save atPosition: 11 readOnly: false multiple: false>
	^ ensuringCurrentOnSave ifNil: [ false ]
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsJsonAdapter >> ensuringCurrentOnSave: anObject [

	ensuringCurrentOnSave := anObject
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsJsonAdapter >> ensuringCurrentReferencesOnQueries [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.ensuringCurrentReferencesOnQueries.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.ensuringCurrentReferencesOnQueries.description'
	icon: #query atPosition: 12 readOnly: false multiple: false>
	^ ensuringCurrentReferencesOnQueries
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsJsonAdapter >> ensuringCurrentReferencesOnQueries: anObject [

	ensuringCurrentReferencesOnQueries := anObject
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsJsonAdapter >> forceEager [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.forceEager.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.forceEager.description' icon:
	#eager atPosition: 14 readOnly: false multiple: false>
	^ forceEager
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsJsonAdapter >> forceEager: anObject [

	forceEager := anObject
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsJsonAdapter >> host [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.host.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.host.description' icon: #host
	atPosition: 1 readOnly: false multiple: false>
	^ host ifNil: [ 'localhost' ]
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsJsonAdapter >> host: anObject [

	host := anObject
]

{ #category : #testing }
EDASMongodbEventStoreSettingsJsonAdapter >> isReadOnly: aString [

	^ true
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsJsonAdapter >> lazySynchronize [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.lazySynchronize.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.lazySynchronize.description'
	icon: #lazy atPosition: 13 readOnly: false multiple: false>
	^ lazySynchronize ifNil: [ true ]
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsJsonAdapter >> lazySynchronize: anObject [

	lazySynchronize := anObject
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsJsonAdapter >> password [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.password.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.password.description' icon:
	#password atPosition: 4 readOnly: false multiple: false>
	^ password ifNil: [ '' ]
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsJsonAdapter >> password: anObject [

	password := anObject
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsJsonAdapter >> port [

	^ port
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsJsonAdapter >> port: anObject [

	port := anObject
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsJsonAdapter >> tls [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.tls.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.tls.description' icon: #tls
	atPosition: 7 readOnly: false multiple: false>
	^ tls
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsJsonAdapter >> tls: anObject [

	tls := anObject
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsJsonAdapter >> urls [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.urls.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.urls.description' icon: #url
	atPosition: 8 readOnly: false multiple: false>
	^ urls ifNil: [ '' ]
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsJsonAdapter >> urls: anObject [

	urls := anObject
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsJsonAdapter >> user [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.user.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.user.description' icon: #user
	atPosition: 3 readOnly: false multiple: false>
	^ user ifNil: [ '' ]
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsJsonAdapter >> user: anObject [

	user := anObject
]

{ #category : #testing }
EDASMongodbEventStoreSettingsJsonAdapter >> values: aSymbol [

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
EDASMongodbEventStoreSettingsJsonAdapter >> wireProtocolEnabled [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.wireProtocolEnabled.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.wireProtocolEnabled.description'
	icon: #wire atPosition: 15 readOnly: false multiple: false>
	^ wireProtocolEnabled ifNil: [ false ]
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsJsonAdapter >> wireProtocolEnabled: anObject [

	wireProtocolEnabled := anObject
]
