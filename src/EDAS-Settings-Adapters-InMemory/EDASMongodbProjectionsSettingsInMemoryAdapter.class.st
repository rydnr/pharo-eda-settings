Class {
	#name : #EDASMongodbProjectionsSettingsInMemoryAdapter,
	#superclass : #EDASMongodbSettingsInMemoryAdapter,
	#traits : 'EDASProjectionsSettingsPort',
	#classTraits : 'EDASProjectionsSettingsPort classTrait',
	#instVars : [
		'concurrentSynchronization',
		'headlessMode',
		'strategy',
		'enableSynchronization'
	],
	#category : #'EDAS-Settings-Adapters-InMemory'
}

{ #category : #'as yet unclassified' }
EDASMongodbProjectionsSettingsInMemoryAdapter class >> accepts: aPort inApp: anEDAApplication [

	^ aPort = EDASProjectionsSettingsPort
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsInMemoryAdapter class >> availableAuthenticationMechanisms [

	^ OrderedCollection with: 'SCRAM-SHA-256' with: 'MONGODB-CR'
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsInMemoryAdapter class >> description [

	^ #'pharoeda.settings.adapters.projections.mongodb.description'
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsInMemoryAdapter class >> label [

	^ #'pharoeda.settings.adapters.projections.mongodb.label'
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsInMemoryAdapter class >> portLabel [

	^ #'pharoeda.settings.ports.projections.mongodb.label'
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsInMemoryAdapter class >> priority [
	^ 0
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsInMemoryAdapter >> authenticationMechanism [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.authenticationMechanism.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.authenticationMechanism.description'
	icon: #authentication atPosition: 6 readOnly: false multiple: true>
	^ super authenticationMechanism
]

{ #category : #testing }
EDASMongodbProjectionsSettingsInMemoryAdapter >> availableAuthenticationMechanisms [

	^ self class availableAuthenticationMechanisms
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsInMemoryAdapter >> concurrentSynchronization [

	<edaSettings:
	#'pharoeda.settings.adapters.projections.concurrentSynchronization.label'
	withDescription:
	#'pharoeda.settings.adapters.projections.concurrentSynchronization.description'
	icon: #concurrent atPosition: 18 readOnly: false multiple: false>
	^ concurrentSynchronization ifNil: [ false ]
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsInMemoryAdapter >> concurrentSynchronization: aBoolean [
	concurrentSynchronization := aBoolean
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsInMemoryAdapter >> database [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.database.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.database.description' icon:
	#eventstore atPosition: 5 readOnly: false multiple: false>
	^ super database
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsInMemoryAdapter >> debug [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.debug.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.debug.description' icon: #debug
	atPosition: 9 readOnly: false multiple: false>
	^ super debug
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsInMemoryAdapter >> enableReplication [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.enableReplication.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.enableReplication.description'
	icon: #replication atPosition: 10 readOnly: false multiple: false>
	^ super enableReplication
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsInMemoryAdapter >> enableSingleton [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.enableSingleton.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.enableSingleton.description'
	icon: #singleton atPosition: 16 readOnly: false multiple: false>
	^ super enableSingleton
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsInMemoryAdapter >> enableSynchronization [

	<edaSettings:
	#'pharoeda.settings.adapters.projections.enableSynchronization.label'
	withDescription:
	#'pharoeda.settings.adapters.projections.enableSynchronization.description'
	icon: #sync atPosition: 17 readOnly: false multiple: false>
	^ enableSynchronization ifNil: [ false ]
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsInMemoryAdapter >> enableSynchronization: aBoolean [

	enableSynchronization := aBoolean
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsInMemoryAdapter >> ensuringCurrentOnSave [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.ensuringCurrentOnSave.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.ensuringCurrentOnSave.description'
	icon: #save atPosition: 11 readOnly: false multiple: false>
	^ super ensuringCurrentOnSave
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsInMemoryAdapter >> ensuringCurrentReferencesOnQueries [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.ensuringCurrentReferencesOnQueries.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.ensuringCurrentReferencesOnQueries.description'
	icon: #query atPosition: 12 readOnly: false multiple: false>
	^ super ensuringCurrentReferencesOnQueries
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsInMemoryAdapter >> forceEager [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.forceEager.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.forceEager.description' icon:
	#eager atPosition: 14 readOnly: false multiple: false>
	^ super forceEager
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsInMemoryAdapter >> headlessMode [

	<edaSettings:
	#'pharoeda.settings.adapters.projections.headless.label'
	withDescription:
	#'pharoeda.settings.adapters.projections.headless.description' icon:
	#headless atPosition: 19 readOnly: false multiple: false>
	^ headlessMode ifNil: [ true ]
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsInMemoryAdapter >> headlessMode: aBoolean [
	headlessMode := aBoolean
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsInMemoryAdapter >> host [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.host.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.host.description' icon: #host
	atPosition: 1 readOnly: false multiple: false>
	^ super host
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsInMemoryAdapter >> lazySynchronize [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.lazySynchronize.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.lazySynchronize.description'
	icon: #lazy atPosition: 13 readOnly: false multiple: false>
	^ super lazySynchronize
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsInMemoryAdapter >> password [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.password.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.password.description' icon:
	#password atPosition: 4 readOnly: false multiple: false>
	^ super password
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsInMemoryAdapter >> port [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.port.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.host.description' icon: #port
	atPosition: 2 readOnly: false multiple: false>
	^ super port
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsInMemoryAdapter >> strategy [

	<edaSettings:
	#'pharoeda.settings.adapters.projections.strategy.label'
	withDescription:
	#'pharoeda.settings.adapters.projections.strategy.description' icon:
	#strategy atPosition: 20 readOnly: false multiple: false>
	^ strategy
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsInMemoryAdapter >> strategy: aStrategy [
	strategy := aStrategy
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsInMemoryAdapter >> tls [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.tls.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.tls.description' icon: #tls
	atPosition: 7 readOnly: false multiple: false>
	^ super tls
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsInMemoryAdapter >> urls [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.urls.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.urls.description' icon: #url
	atPosition: 8 readOnly: false multiple: false>
	^ super urls
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsInMemoryAdapter >> user [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.user.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.user.description' icon: #user
	atPosition: 3 readOnly: false multiple: false>
	^ super user
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsInMemoryAdapter >> wireProtocolEnabled [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.wireProtocolEnabled.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.wireProtocolEnabled.description'
	icon: #wire atPosition: 15 readOnly: false multiple: false>
	^ super wireProtocolEnabled
]
