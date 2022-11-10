Class {
	#name : #EDASMongodbProjectionsSettingsJsonAdapter,
	#superclass : #Object,
	#traits : 'EDASSettingsPort + EDASProjectionsSettingsPort + EDASMongodbSettingsJsonAdapter',
	#classTraits : 'EDASSettingsPort classTrait + EDASProjectionsSettingsPort classTrait + EDASMongodbSettingsJsonAdapter classTrait',
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
		'concurrentSynchronization',
		'headlessMode',
		'strategy',
		'enableSynchronization'
	],
	#category : #'EDAS-Settings-Adapters-Json'
}

{ #category : #'instance creation' }
EDASMongodbProjectionsSettingsJsonAdapter class >> fromFile: aFileReference withApp: anEDAApplication [

	^ self
		  fromFile: aFileReference
		  under: 'projections'
		  withApp: anEDAApplication
]

{ #category : #'as yet unclassified' }
EDASMongodbProjectionsSettingsJsonAdapter >> authenticationMechanism [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.authenticationMechanism.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.authenticationMechanism.description'
	icon: #authentication atPosition: 6 readOnly: false multiple: true>
	^ authenticationMechanism ifNil: [ self availableAuthenticationMechanisms first ]
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsJsonAdapter >> concurrentSynchronization [

	<edaSettings:
	#'pharoeda.settings.adapters.projections.concurrentSynchronization.label'
	withDescription:
	#'pharoeda.settings.adapters.projections.concurrentSynchronization.description'
	icon: #concurrent atPosition: 18 readOnly: false multiple: false>
	^ concurrentSynchronization ifNil: [ false ]
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsJsonAdapter >> concurrentSynchronization: anObject [

	concurrentSynchronization := anObject
]

{ #category : #'as yet unclassified' }
EDASMongodbProjectionsSettingsJsonAdapter >> database [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.database.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.database.description' icon:
	#database atPosition: 5 readOnly: false multiple: false>
	^ database ifNil: [ '' ]
]

{ #category : #'as yet unclassified' }
EDASMongodbProjectionsSettingsJsonAdapter >> debug [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.debug.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.debug.description' icon: #debug
	atPosition: 9 readOnly: false multiple: false>
	^ debug ifNil: [ true ]
]

{ #category : #'as yet unclassified' }
EDASMongodbProjectionsSettingsJsonAdapter >> enableReplication [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.enableReplication.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.enableReplication.description'
	icon: #replication atPosition: 10 readOnly: false multiple: false>
	^ enableReplication ifNil: [ false ]
]

{ #category : #'as yet unclassified' }
EDASMongodbProjectionsSettingsJsonAdapter >> enableSingleton [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.enableSingleton.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.enableSingleton.description'
	icon: #singleton atPosition: 16 readOnly: false multiple: false>
	^ enableSingleton ifNil: [ false ]
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsJsonAdapter >> enableSynchronization [

	<edaSettings:
	#'pharoeda.settings.adapters.projections.mongodb.enableSynchronization.label'
	withDescription:
	#'pharoeda.settings.adapters.projections.enableSynchronization.description'
	icon: #sync atPosition: 17 readOnly: false multiple: false>
	^ enableSynchronization ifNil: [ false ]
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsJsonAdapter >> enableSynchronization: anObject [

	enableSynchronization := anObject
]

{ #category : #'as yet unclassified' }
EDASMongodbProjectionsSettingsJsonAdapter >> ensuringCurrentOnSave [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.ensuringCurrentOnSave.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.ensuringCurrentOnSave.description'
	icon: #save atPosition: 11 readOnly: false multiple: false>
	^ ensuringCurrentOnSave ifNil: [ true ]
]

{ #category : #'as yet unclassified' }
EDASMongodbProjectionsSettingsJsonAdapter >> ensuringCurrentReferencesOnQueries [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.ensuringCurrentReferencesOnQueries.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.ensuringCurrentReferencesOnQueries.description'
	icon: #query atPosition: 12 readOnly: false multiple: false>
	^ ensuringCurrentReferencesOnQueries ifNil: [ true ]
]

{ #category : #'as yet unclassified' }
EDASMongodbProjectionsSettingsJsonAdapter >> forceEager [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.forceEager.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.forceEager.description' icon:
	#eager atPosition: 14 readOnly: false multiple: false>
	^ forceEager ifNil: [ false ]
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsJsonAdapter >> headlessMode [

	<edaSettings:
	#'pharoeda.settings.adapters.projections.headless.label'
	withDescription:
	#'pharoeda.settings.adapters.projections.headless.description' icon:
	#headless atPosition: 19 readOnly: false multiple: false>
	^ headlessMode ifNil: [ true ]
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsJsonAdapter >> headlessMode: anObject [

	headlessMode := anObject
]

{ #category : #'as yet unclassified' }
EDASMongodbProjectionsSettingsJsonAdapter >> host [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.host.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.host.description' icon: #host
	atPosition: 1 readOnly: false multiple: false>
	^ host ifNil: [ 'localhost' ]
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsJsonAdapter >> isReadOnly: aString [

	^ true
]

{ #category : #'as yet unclassified' }
EDASMongodbProjectionsSettingsJsonAdapter >> lazySynchronize [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.lazySynchronize.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.lazySynchronize.description'
	icon: #lazy atPosition: 13 readOnly: false multiple: false>
	^ lazySynchronize ifNil: [ true ]
]

{ #category : #'as yet unclassified' }
EDASMongodbProjectionsSettingsJsonAdapter >> password [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.password.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.password.description' icon:
	#password atPosition: 4 readOnly: false multiple: false>
	^ password ifNil: [ '' ]
]

{ #category : #'as yet unclassified' }
EDASMongodbProjectionsSettingsJsonAdapter >> port [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.port.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.port.description' icon: #host
	atPosition: 2 readOnly: false multiple: false>
	^ port ifNil: [ 27017 ]
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsJsonAdapter >> strategy [

	<edaSettings:
	#'pharoeda.settings.adapters.projections.strategy.label'
	withDescription:
	#'pharoeda.settings.adapters.projections.strategy.description' icon:
	#strategy atPosition: 20 readOnly: false multiple: false>
	^ strategy ifNil: [ '' ]
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsJsonAdapter >> strategy: anObject [

	strategy := anObject
]

{ #category : #'as yet unclassified' }
EDASMongodbProjectionsSettingsJsonAdapter >> tls [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.tls.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.tls.description' icon: #tls
	atPosition: 7 readOnly: false multiple: false>
	^ tls ifNil: [ false ]
]

{ #category : #'as yet unclassified' }
EDASMongodbProjectionsSettingsJsonAdapter >> urls [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.urls.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.urls.description' icon: #url
	atPosition: 8 readOnly: false multiple: false>
	^ urls ifNil: [ '' ]
]

{ #category : #'as yet unclassified' }
EDASMongodbProjectionsSettingsJsonAdapter >> user [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.user.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.user.description' icon: #user
	atPosition: 3 readOnly: false multiple: false>
	^ user ifNil: [ '' ]
]

{ #category : #'as yet unclassified' }
EDASMongodbProjectionsSettingsJsonAdapter >> wireProtocolEnabled [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.wireProtocolEnabled.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.wireProtocolEnabled.description'
	icon: #wire atPosition: 15 readOnly: false multiple: false>
	^ wireProtocolEnabled ifNil: [ false ]
]
