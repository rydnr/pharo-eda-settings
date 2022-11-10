Class {
	#name : #EDASMongodbEventStoreSettingsJsonAdapter,
	#superclass : #Object,
	#traits : 'EDASSettingsPort + EDASEventStoreSettingsPort + EDASMongodbSettingsJsonAdapter',
	#classTraits : 'EDASSettingsPort classTrait + EDASEventStoreSettingsPort classTrait + EDASMongodbSettingsJsonAdapter classTrait',
	#category : #'EDAS-Settings-Adapters-Json'
}

{ #category : #accessing }
EDASMongodbEventStoreSettingsJsonAdapter class >> changedEventName [

	^ EDASMongodbEventStoreSettingsInMemoryAdapter changedEventName
]

{ #category : #testing }
EDASMongodbEventStoreSettingsJsonAdapter class >> description [

	^ #'pharoeda.settings.adapters.eventStore.mongodb.json.description'
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

	^ #'pharoeda.settings.adapters.eventStore.mongodb.label'
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsJsonAdapter class >> portChangedEventName [

	^ EDASMongodbEventStoreSettingsInMemoryAdapter portChangedEventName
]

{ #category : #metadata }
EDASMongodbEventStoreSettingsJsonAdapter class >> portLabel [

	^ EDASMongodbEventStoreSettingsInMemoryAdapter portLabel
]

{ #category : #'as yet unclassified' }
EDASMongodbEventStoreSettingsJsonAdapter >> authenticationMechanism [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.authenticationMechanism.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.authenticationMechanism.description'
	icon: #authentication atPosition: 6 readOnly: false multiple: true>
	^ authenticationMechanism ifNil: [ self availableAuthenticationMechanisms first ]
]

{ #category : #'as yet unclassified' }
EDASMongodbEventStoreSettingsJsonAdapter >> database [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.database.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.database.description' icon:
	#database atPosition: 5 readOnly: false multiple: false>
	^ database ifNil: [ '' ]
]

{ #category : #'as yet unclassified' }
EDASMongodbEventStoreSettingsJsonAdapter >> debug [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.debug.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.debug.description' icon: #debug
	atPosition: 9 readOnly: false multiple: false>
	^ debug ifNil: [ true ]
]

{ #category : #'as yet unclassified' }
EDASMongodbEventStoreSettingsJsonAdapter >> enableReplication [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.enableReplication.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.enableReplication.description'
	icon: #replication atPosition: 10 readOnly: false multiple: false>
	^ enableReplication ifNil: [ false ]
]

{ #category : #'as yet unclassified' }
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

{ #category : #'as yet unclassified' }
EDASMongodbEventStoreSettingsJsonAdapter >> ensuringCurrentOnSave [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.ensuringCurrentOnSave.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.ensuringCurrentOnSave.description'
	icon: #save atPosition: 11 readOnly: false multiple: false>
	^ ensuringCurrentOnSave ifNil: [ true ]
]

{ #category : #'as yet unclassified' }
EDASMongodbEventStoreSettingsJsonAdapter >> ensuringCurrentReferencesOnQueries [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.ensuringCurrentReferencesOnQueries.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.ensuringCurrentReferencesOnQueries.description'
	icon: #query atPosition: 12 readOnly: false multiple: false>
	^ ensuringCurrentReferencesOnQueries ifNil: [ true ]
]

{ #category : #'as yet unclassified' }
EDASMongodbEventStoreSettingsJsonAdapter >> forceEager [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.forceEager.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.forceEager.description'
	icon: #eager atPosition: 14 readOnly: false multiple: false>
	^ forceEager ifNil: [ false ]
]

{ #category : #'as yet unclassified' }
EDASMongodbEventStoreSettingsJsonAdapter >> host [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.host.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.host.description' icon: #host
	atPosition: 1 readOnly: false multiple: false>
	^ host ifNil: [ 'localhost' ]
]

{ #category : #testing }
EDASMongodbEventStoreSettingsJsonAdapter >> isReadOnly: aString [

	^ true
]

{ #category : #'as yet unclassified' }
EDASMongodbEventStoreSettingsJsonAdapter >> lazySynchronize [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.lazySynchronize.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.lazySynchronize.description'
	icon: #lazy atPosition: 13 readOnly: false multiple: false>
	^ lazySynchronize ifNil: [ true ]
]

{ #category : #'as yet unclassified' }
EDASMongodbEventStoreSettingsJsonAdapter >> password [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.password.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.password.description' icon:
	#password atPosition: 4 readOnly: false multiple: false>
	^ password ifNil: [ '' ]
]

{ #category : #'as yet unclassified' }
EDASMongodbEventStoreSettingsJsonAdapter >> port [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.port.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.port.description' icon: #host
	atPosition: 2 readOnly: false multiple: false>
	^ port ifNil: [ 27017 ]
]

{ #category : #'as yet unclassified' }
EDASMongodbEventStoreSettingsJsonAdapter >> tls [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.tls.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.tls.description' icon: #tls
	atPosition: 7 readOnly: false multiple: false>
	^ tls ifNil: [ false ]
]

{ #category : #'as yet unclassified' }
EDASMongodbEventStoreSettingsJsonAdapter >> urls [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.urls.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.urls.description' icon: #url
	atPosition: 8 readOnly: false multiple: false>
	^ urls ifNil: [ '' ]
]

{ #category : #'as yet unclassified' }
EDASMongodbEventStoreSettingsJsonAdapter >> user [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.user.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.user.description' icon: #user
	atPosition: 3 readOnly: false multiple: false>
	^ user ifNil: [ '' ]
]

{ #category : #'as yet unclassified' }
EDASMongodbEventStoreSettingsJsonAdapter >> wireProtocolEnabled [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.wireProtocolEnabled.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.wireProtocolEnabled.description'
	icon: #wire atPosition: 15 readOnly: false multiple: false>
	^ wireProtocolEnabled ifNil: [ false ]
]
