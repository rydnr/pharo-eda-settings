Class {
	#name : #EDASMongoEventStoreSettingsInMemoryAdapter,
	#superclass : #EDASMongoSettingsInMemoryAdapter,
	#traits : 'EDASEventStoreSettingsPort',
	#classTraits : 'EDASEventStoreSettingsPort classTrait',
	#category : #'EDAS-Settings-Adapters-InMemory'
}

{ #category : #testing }
EDASMongoEventStoreSettingsInMemoryAdapter class >> accepts: anEDAApplication [
	^ true
]

{ #category : #metadata }
EDASMongoEventStoreSettingsInMemoryAdapter class >> availableAuthenticationMechanisms [

	^ OrderedCollection with: 'SCRAM-SHA-256' with: 'MONGODB-CR'
]

{ #category : #metadata }
EDASMongoEventStoreSettingsInMemoryAdapter class >> portLabel [

	^ #'pharoeda.settings.ports.event_store.mongodb.label'
]

{ #category : #accessing }
EDASMongoEventStoreSettingsInMemoryAdapter class >> priority [
	^ 0
]

{ #category : #accessing }
EDASMongoEventStoreSettingsInMemoryAdapter >> authenticationMechanism [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.authenticationMechanism.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.authenticationMechanism.description'
	icon: #authentication atPosition: 6 readOnly: false multiple: true>
	^ super authenticationMechanism
]

{ #category : #accessing }
EDASMongoEventStoreSettingsInMemoryAdapter >> availableAuthenticationMechanisms [

	^ self class availableAuthenticationMechanisms
]

{ #category : #accessing }
EDASMongoEventStoreSettingsInMemoryAdapter >> database [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.database.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.database.description'
	icon: #database atPosition: 5 readOnly: false multiple: false>
	^ super database
]

{ #category : #accessing }
EDASMongoEventStoreSettingsInMemoryAdapter >> debug [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.debug.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.debug.description' icon: #debug
	atPosition: 9 readOnly: false multiple: false>
	^ super debug
]

{ #category : #accessing }
EDASMongoEventStoreSettingsInMemoryAdapter >> enableReplication [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.enableReplication.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.enableReplication.description'
	icon: #replication atPosition: 10 readOnly: false multiple: false>
	^ super enableReplication
]

{ #category : #accessing }
EDASMongoEventStoreSettingsInMemoryAdapter >> enableSingleton [

	^ super enableSingleton
]

{ #category : #accessing }
EDASMongoEventStoreSettingsInMemoryAdapter >> ensuringCurrentOnSave [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.ensuringCurrentOnSave.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.ensuringCurrentOnSave.description'
	icon: #save atPosition: 11 readOnly: false multiple: false>
	^ super ensuringCurrentOnSave
]

{ #category : #accessing }
EDASMongoEventStoreSettingsInMemoryAdapter >> ensuringCurrentReferencesOnQueries [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.ensuringCurrentReferencesOnQueries.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.ensuringCurrentReferencesOnQueries.description'
	icon: #query atPosition: 12 readOnly: false multiple: false>
	^ super ensuringCurrentReferencesOnQueries
]

{ #category : #accessing }
EDASMongoEventStoreSettingsInMemoryAdapter >> forceEager [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.forceEager.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.forceEager.description'
	icon: #eager atPosition: 14 readOnly: false multiple: false>
	^ super forceEager
]

{ #category : #accessing }
EDASMongoEventStoreSettingsInMemoryAdapter >> host [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.host.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.host.description' icon: #host
	atPosition: 1 readOnly: false multiple: false>
	^ super host
	
]

{ #category : #accessing }
EDASMongoEventStoreSettingsInMemoryAdapter >> lazySynchronize [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.lazySynchronize.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.lazySynchronize.description'
	icon: #lazy atPosition: 13 readOnly: false multiple: false>
	^ super lazySynchronize
]

{ #category : #accessing }
EDASMongoEventStoreSettingsInMemoryAdapter >> password [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.password.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.password.description' icon: #password
	atPosition: 4 readOnly: false multiple: false>
	^ super password
]

{ #category : #accessing }
EDASMongoEventStoreSettingsInMemoryAdapter >> port [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.port.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.host.description' icon: #port
		atPosition: 2 readOnly: false multiple: false>
	^ super port
]

{ #category : #accessing }
EDASMongoEventStoreSettingsInMemoryAdapter >> tls [

	^ super tls
]

{ #category : #accessing }
EDASMongoEventStoreSettingsInMemoryAdapter >> urls [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.urls.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.urls.description'
	icon: #urls atPosition: 8 readOnly: false multiple: false>
	^ super urls
]

{ #category : #accessing }
EDASMongoEventStoreSettingsInMemoryAdapter >> user [

<edaSettings: #'pharoeda.settings.adapters.mongodb.user.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.user.description' icon: #user
	atPosition: 3 readOnly: false multiple: false>
	^ super user
]

{ #category : #accessing }
EDASMongoEventStoreSettingsInMemoryAdapter >> values: aSymbol [

	aSymbol = #authenticationMechanism ifTrue: [ ^ self availableAuthenticationMechanisms ]
		ifFalse: [ ^ OrderedCollection new ]
]
