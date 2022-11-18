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

{ #category : #testing }
EDASMongodbProjectionsSettingsJsonAdapter class >> description [

	^ #'pharoeda.settings.adapters.projections.mongodb.json.description'
]

{ #category : #metadata }
EDASMongodbProjectionsSettingsJsonAdapter class >> edaPort [

	"This gets called in EDASSettings when selecting the port, so it gets selected correctly"

	^ EDASMongodbProjectionsSettingsInMemoryAdapter
]

{ #category : #'instance creation' }
EDASMongodbProjectionsSettingsJsonAdapter class >> fromFile: aFileReference withApp: anEDAApplication [

	^ self
		  fromFile: aFileReference
		  under: 'projections'
		  withApp: anEDAApplication
]

{ #category : #testing }
EDASMongodbProjectionsSettingsJsonAdapter class >> icon [

	^ EDACIconProvider new iconNamed: #projections orElse: #comments
]

{ #category : #testing }
EDASMongodbProjectionsSettingsJsonAdapter class >> label [

	^ #'pharoeda.settings.adapters.projections.mongodb.label'
]

{ #category : #accessing }
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

{ #category : #accessing }
EDASMongodbProjectionsSettingsJsonAdapter >> database [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.database.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.database.description' icon:
	#database atPosition: 5 readOnly: false multiple: false>
	^ database ifNil: [ '' ]
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsJsonAdapter >> debug [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.debug.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.debug.description' icon: #debug
	atPosition: 9 readOnly: false multiple: false>
	^ debug ifNil: [ true ]
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsJsonAdapter >> enableReplication [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.enableReplication.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.enableReplication.description'
	icon: #replication atPosition: 10 readOnly: false multiple: false>
	^ enableReplication ifNil: [ false ]
]

{ #category : #accessing }
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
	#'pharoeda.settings.adapters.projections.enableSynchronization.label'
	withDescription:
	#'pharoeda.settings.adapters.projections.enableSynchronization.description'
	icon: #sync atPosition: 17 readOnly: false multiple: false>
	^ enableSynchronization ifNil: [ false ]
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsJsonAdapter >> enableSynchronization: anObject [

	enableSynchronization := anObject
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsJsonAdapter >> ensuringCurrentOnSave [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.ensuringCurrentOnSave.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.ensuringCurrentOnSave.description'
	icon: #save atPosition: 11 readOnly: false multiple: false>
	^ ensuringCurrentOnSave ifNil: [ true ]
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsJsonAdapter >> ensuringCurrentReferencesOnQueries [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.ensuringCurrentReferencesOnQueries.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.ensuringCurrentReferencesOnQueries.description'
	icon: #query atPosition: 12 readOnly: false multiple: false>
	^ ensuringCurrentReferencesOnQueries ifNil: [ true ]
]

{ #category : #accessing }
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

{ #category : #accessing }
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

{ #category : #accessing }
EDASMongodbProjectionsSettingsJsonAdapter >> keyIn: aSymbol forValue: aValue [

	^ EDASMongodbProjectionsSettingsInMemoryAdapter new
		  keyIn: aSymbol
		  forValue: aValue
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsJsonAdapter >> lazySynchronize [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.lazySynchronize.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.lazySynchronize.description'
	icon: #lazy atPosition: 13 readOnly: false multiple: false>
	^ lazySynchronize ifNil: [ true ]
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsJsonAdapter >> password [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.password.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.password.description' icon:
	#password atPosition: 4 readOnly: false multiple: false>
	^ password ifNil: [ '' ]
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsJsonAdapter >> port [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.port.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.port.description' icon: #port
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

{ #category : #accessing }
EDASMongodbProjectionsSettingsJsonAdapter >> tls [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.tls.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.tls.description' icon: #tls
	atPosition: 7 readOnly: false multiple: false>
	^ tls ifNil: [ false ]
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsJsonAdapter >> urls [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.urls.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.urls.description' icon: #url
	atPosition: 8 readOnly: false multiple: false>
	^ urls ifNil: [ '' ]
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsJsonAdapter >> user [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.user.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.user.description' icon: #user
	atPosition: 3 readOnly: false multiple: false>
	^ user ifNil: [ '' ]
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsJsonAdapter >> values: aSymbol [

	^ EDASMongodbProjectionsSettingsInMemoryAdapter new
		  values: aSymbol
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsJsonAdapter >> wireProtocolEnabled [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.wireProtocolEnabled.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.wireProtocolEnabled.description'
	icon: #wire atPosition: 15 readOnly: false multiple: false>
	^ wireProtocolEnabled ifNil: [ false ]
]
