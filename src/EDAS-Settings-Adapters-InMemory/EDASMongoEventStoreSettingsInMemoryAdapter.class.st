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
EDASMongoEventStoreSettingsInMemoryAdapter class >> portLabel [

	^ #'pharoeda.settings.ports.event_store.mongodb.label'
]

{ #category : #accessing }
EDASMongoEventStoreSettingsInMemoryAdapter class >> priority [
	^ 0
]

{ #category : #accessing }
EDASMongoEventStoreSettingsInMemoryAdapter >> authenticationMechanism [

	^ super authenticationMechanism
]

{ #category : #accessing }
EDASMongoEventStoreSettingsInMemoryAdapter >> database [

	^ super database
]

{ #category : #accessing }
EDASMongoEventStoreSettingsInMemoryAdapter >> debug [

	^ super debug
]

{ #category : #accessing }
EDASMongoEventStoreSettingsInMemoryAdapter >> enableReplication [

	^ super enableReplication
]

{ #category : #accessing }
EDASMongoEventStoreSettingsInMemoryAdapter >> enableSingleton [

	^ super enableSingleton
]

{ #category : #accessing }
EDASMongoEventStoreSettingsInMemoryAdapter >> ensuringCurrentOnSave [

	^ super ensuringCurrentOnSave
]

{ #category : #accessing }
EDASMongoEventStoreSettingsInMemoryAdapter >> ensuringCurrentReferencesOnQueries [

	^ super ensuringCurrentReferencesOnQueries
]

{ #category : #accessing }
EDASMongoEventStoreSettingsInMemoryAdapter >> forceEager [

	^ super forceEager
]

{ #category : #accessing }
EDASMongoEventStoreSettingsInMemoryAdapter >> host [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.host.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.host.description' icon: #host
	atPosition: 1 readOnly: false multiple: false>
	
]

{ #category : #accessing }
EDASMongoEventStoreSettingsInMemoryAdapter >> lazySynchronize [

	^ super lazySynchronize
]

{ #category : #accessing }
EDASMongoEventStoreSettingsInMemoryAdapter >> password [

	^ super password
]

{ #category : #accessing }
EDASMongoEventStoreSettingsInMemoryAdapter >> port [

	^ super port
]

{ #category : #accessing }
EDASMongoEventStoreSettingsInMemoryAdapter >> tls [

	^ super tls
]

{ #category : #accessing }
EDASMongoEventStoreSettingsInMemoryAdapter >> urls [

	^ super urls
]

{ #category : #accessing }
EDASMongoEventStoreSettingsInMemoryAdapter >> user [

	^ user
]
