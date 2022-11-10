Class {
	#name : #EDASMongodbProjectionsSettingsJsonAdapter,
	#superclass : #Object,
	#traits : 'EDASSettingsPort + EDASProjectionsSettingsPort + EDASMongodbSettingsJsonAdapter',
	#classTraits : 'EDASSettingsPort classTrait + EDASProjectionsSettingsPort classTrait + EDASMongodbSettingsJsonAdapter classTrait',
	#instVars : [
		'concurrentSynchronization',
		'headlessMode',
		'strategy',
		'enableSynchronization',
		'authenticationMechanism'
	],
	#category : #'EDAS-Settings-Adapters-Json'
}

{ #category : #accessing }
EDASMongodbProjectionsSettingsJsonAdapter >> authenticationMechanism [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.authenticationMechanism.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.authenticationMechanism.description'
	icon: #authentication atPosition: 6 readOnly: false multiple: true>
	^ super authenticationMechanism
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
	^ super database
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsJsonAdapter >> debug [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.debug.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.debug.description' icon: #debug
	atPosition: 9 readOnly: false multiple: false>
	^ super debug
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsJsonAdapter >> enableReplication [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.enableReplication.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.enableReplication.description'
	icon: #replication atPosition: 10 readOnly: false multiple: false>
	^ super enableReplication
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsJsonAdapter >> enableSingleton [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.enableSingleton.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.enableSingleton.description'
	icon: #singleton atPosition: 16 readOnly: false multiple: false>
	^ enableSingleton
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

{ #category : #accessing }
EDASMongodbProjectionsSettingsJsonAdapter >> ensuringCurrentOnSave [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.ensuringCurrentOnSave.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.ensuringCurrentOnSave.description'
	icon: #save atPosition: 11 readOnly: false multiple: false>
	^ super ensuringCurrentOnSave
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsJsonAdapter >> ensuringCurrentReferencesOnQueries [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.ensuringCurrentReferencesOnQueries.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.ensuringCurrentReferencesOnQueries.description'
	icon: #query atPosition: 12 readOnly: false multiple: false>
	^ super ensuringCurrentOnSave
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsJsonAdapter >> forceEager [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.forceEager.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.forceEager.description' icon:
	#eager atPosition: 14 readOnly: false multiple: false>
	^ super forceEager
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
	^ super host
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsJsonAdapter >> isReadOnly: aString [

	^ true
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsJsonAdapter >> lazySynchronize [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.lazySynchronize.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.lazySynchronize.description'
	icon: #lazy atPosition: 13 readOnly: false multiple: false>
	^ super lazySynchronize
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsJsonAdapter >> password [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.password.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.password.description' icon:
	#password atPosition: 4 readOnly: false multiple: false>
	^ super password
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsJsonAdapter >> port [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.port.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.port.description' icon: #host
	atPosition: 2 readOnly: false multiple: false>
	^ super port
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsJsonAdapter >> strategy [

	<edaSettings:
	#'pharoeda.settings.adapters.projections.strategy.label'
	withDescription:
	#'pharoeda.settings.adapters.projections.strategy.description' icon:
	#strategy atPosition: 20 readOnly: false multiple: false>
	^ strategy
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
	^ super tls
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsJsonAdapter >> urls [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.urls.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.urls.description' icon: #url
	atPosition: 8 readOnly: false multiple: false>
	^ super urls
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsJsonAdapter >> user [

	<edaSettings: #'pharoeda.settings.adapters.mongodb.user.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.user.description' icon: #user
	atPosition: 3 readOnly: false multiple: false>
	^ super user
]

{ #category : #accessing }
EDASMongodbProjectionsSettingsJsonAdapter >> wireProtocolEnabled [

	<edaSettings:
	#'pharoeda.settings.adapters.mongodb.wireProtocolEnabled.label'
	withDescription:
	#'pharoeda.settings.adapters.mongodb.wireProtocolEnabled.description'
	icon: #wire atPosition: 15 readOnly: false multiple: false>
	^ super wireProtocolEnabled
]
