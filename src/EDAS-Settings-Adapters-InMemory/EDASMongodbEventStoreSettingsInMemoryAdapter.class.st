Class {
	#name : #EDASMongodbEventStoreSettingsInMemoryAdapter,
	#superclass : #EDASMongodbSettingsInMemoryAdapter,
	#traits : 'EDASEventStoreSettingsPort + EDASMongodbEventStoreSettingsAdapter',
	#classTraits : 'EDASEventStoreSettingsPort classTrait + EDASMongodbEventStoreSettingsAdapter classTrait',
	#category : #'EDAS-Settings-Adapters-InMemory'
}

{ #category : #'as yet unclassified' }
EDASMongodbEventStoreSettingsInMemoryAdapter class >> accepts: aPort inApp: anEDAApplication [

	^ aPort = EDASEventStoreSettingsPort
]

{ #category : #metadata }
EDASMongodbEventStoreSettingsInMemoryAdapter class >> availableAuthenticationMechanisms [

	^ OrderedCollection with: 'SCRAM-SHA-256' with: 'MONGODB-CR'
]

{ #category : #testing }
EDASMongodbEventStoreSettingsInMemoryAdapter class >> description [

	^ #'pharoeda.settings.adapters.eventStore.mongodb.description'
]

{ #category : #testing }
EDASMongodbEventStoreSettingsInMemoryAdapter class >> label [

	^ #'pharoeda.settings.adapters.eventStore.mongodb.label'
]

{ #category : #metadata }
EDASMongodbEventStoreSettingsInMemoryAdapter class >> portLabel [

	^ #'pharoeda.settings.ports.eventStore.mongodb.label'
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsInMemoryAdapter class >> priority [
	^ 0
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsInMemoryAdapter >> authenticationMechanism [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.authenticationMechanism.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.authenticationMechanism.description'
	icon: #authentication atPosition: 6 readOnly: false multiple: true>
	^ super authenticationMechanism
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsInMemoryAdapter >> database [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.database.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.database.description' icon:
	#database atPosition: 5 readOnly: false multiple: false>
	^ super database
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsInMemoryAdapter >> debug [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.debug.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.debug.description' icon: #debug
	atPosition: 9 readOnly: false multiple: false>
	^ super debug
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsInMemoryAdapter >> enableReplication [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.enableReplication.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.enableReplication.description'
	icon: #replication atPosition: 10 readOnly: false multiple: false>
	^ super enableReplication
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsInMemoryAdapter >> enableSingleton [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.enableSingleton.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.enableSingleton.description'
	icon: #singleton atPosition: 16 readOnly: false multiple: false>
	^ super enableSingleton
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsInMemoryAdapter >> ensuringCurrentOnSave [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.ensuringCurrentOnSave.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.ensuringCurrentOnSave.description'
	icon: #save atPosition: 11 readOnly: false multiple: false>
	^ super ensuringCurrentOnSave
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsInMemoryAdapter >> ensuringCurrentReferencesOnQueries [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.ensuringCurrentReferencesOnQueries.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.ensuringCurrentReferencesOnQueries.description'
	icon: #query atPosition: 12 readOnly: false multiple: false>
	^ super ensuringCurrentReferencesOnQueries
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsInMemoryAdapter >> forceEager [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.forceEager.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.forceEager.description'
	icon: #eager atPosition: 14 readOnly: false multiple: false>
	^ super forceEager
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsInMemoryAdapter >> host [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.host.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.host.description' icon: #host
	atPosition: 1 readOnly: false multiple: false>
	^ super host
	
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsInMemoryAdapter >> lazySynchronize [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.lazySynchronize.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.lazySynchronize.description'
	icon: #lazy atPosition: 13 readOnly: false multiple: false>
	^ super lazySynchronize
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsInMemoryAdapter >> password [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.password.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.password.description' icon: #password
	atPosition: 4 readOnly: false multiple: false>
	^ super password
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsInMemoryAdapter >> port [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.port.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.host.description' icon: #port
		atPosition: 2 readOnly: false multiple: false>
	^ super port
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsInMemoryAdapter >> tls [


	<edaSettings: #'pharoeda.settings.adapters.mongodb.tls.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.tls.description' icon: #tls
	atPosition: 7 readOnly: false multiple: false>
	^ super tls
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsInMemoryAdapter >> urls [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.urls.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.urls.description' icon: #url
	atPosition: 8 readOnly: false multiple: false>
	^ super urls
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsInMemoryAdapter >> user [

<edaSettings: #'pharoeda.settings.adapters.mongodb.user.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.user.description' icon: #user
	atPosition: 3 readOnly: false multiple: false>
	^ super user
]

{ #category : #accessing }
EDASMongodbEventStoreSettingsInMemoryAdapter >> wireProtocolEnabled [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.wireProtocolEnabled.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.wireProtocolEnabled.description' icon:
	#wire atPosition: 15 readOnly: false multiple: false>
	^ super wireProtocolEnabled
]
