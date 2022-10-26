"
* Class: EDASettings

Manages the configuration settings of EDA, using Pharo Settings framework, and injecting default values from config/[environment].json files.

* Responsibility: 

Build Settings menu entries with EDA-specific configuration settings, for the user to manage.
"
Class {
	#name : #EDASSettings,
	#superclass : #Object,
	#classInstVars : [
		'duEnvironmentClass',
		'noApplications',
		'priorizedAdapter'
	],
	#category : #'EDAS-Settings'
}

{ #category : #settings }
EDASSettings class >> NEW_portSettingsOn: aBuilder under: aParent on: app [
	| entry values byPriorityAdapter key |
	key := aParent , 'ports'.
	entry := aBuilder group: key.
	entry
		label: 'Ports' translated;
		parent: aParent.
	byPriorityAdapter := EDASPortResolverByPriorityAdapter new.
	priorizedAdapter := byPriorityAdapter resolveEnvironmentSettingsPort.
	values := OrderedCollection
		with:
			('By priority (' , priorizedAdapter class description , ')')
				-> EDASPortResolverByPriorityAdapter.
	values
		addAll:
			((byPriorityAdapter availableEnvironmentSettingsAdapters
				reject: [ :adapterClass | adapterClass = priorizedAdapter class ]
				thenCollect:
					[ :adapterClass | adapterClass description translated -> adapterClass ])
				sorted: [ :a :b | a value < b value ]).
	(aBuilder pickOne: #environmentSettingsResolverPortClass)
		label: 'Environment adapter' translated;
		target: app portSettingsPort;
		parent: key;
		domainValues: values
]

{ #category : #settings }
EDASSettings class >> commandListenerErrorStrategySettingsOn: aBuilder under: aParent on: app order: anInteger [

	^ self
		  settingOn: aBuilder
		  named: #errorStrategyName
		  labelled: 'Error strategy'
		  withDescription:
		  'Strategy to use when incoming commands cannot be processed for some reason'
		  usingConfig: app commandListenerSettings
		  under: aParent
		  on: app
		  order: anInteger
]

{ #category : #settings }
EDASSettings class >> commandListenerSettingsOn: aBuilder under: parent on: app order: anInteger [

	| key |
	key := parent , 'commandListener'.
	(aBuilder group: key)
		label: 'Command Listener' translated;
		description: 'Command listener';
		parent: parent;
		order: anInteger.
	self
		settingOn: aBuilder
		named: #host
		labelled: 'Host'
		withDescription: 'Stomp host address / IP'
		usingConfig: app commandListenerSettings
		under: key
		on: app
		order: 1.
	self
		settingOn: aBuilder
		named: #port
		labelled: 'Port'
		withDescription: 'Stomp host port'
		usingConfig: app commandListenerSettings
		under: key
		on: app
		order: 2.
	self
		settingOn: aBuilder
		named: #username
		labelled: 'User'
		withDescription: 'Stomp user'
		usingConfig: app commandListenerSettings
		under: key
		on: app
		order: 3.
	self
		settingOn: aBuilder
		named: #password
		labelled: 'Password'
		withDescription: 'Stomp password'
		usingConfig: app commandListenerSettings
		under: key
		on: app
		order: 4.
	self
		settingOn: aBuilder
		named: #queue
		labelled: 'Queue'
		withDescription: 'Stomp queue'
		usingConfig: app commandListenerSettings
		under: key
		on: app
		order: 5.
	self
		settingOn: aBuilder
		named: #timeout
		labelled: 'Timeout'
		withDescription: 'Stomp timeout'
		usingConfig: app commandListenerSettings
		under: key
		on: app
		order: 5.
	self
		settingOn: aBuilder
		named: #prefetchCount
		labelled: 'Prefetch count'
		withDescription: 'The number of messages to prefetch'
		usingConfig: app commandListenerSettings
		under: key
		on: app
		order: 6.
	self
		settingOn: aBuilder
		named: #durable
		labelled: 'Durable'
		withDescription: 'Whether the topic is durable'
		usingConfig: app commandListenerSettings
		under: key
		on: app
		order: 7.
	self
		settingOn: aBuilder
		named: #debug
		labelled: 'Debug'
		withDescription: 'Whether to enable debug mode'
		usingConfig: app commandListenerSettings
		under: key
		on: app
		order: 8.
	self
		commandListenerErrorStrategySettingsOn: aBuilder
		under: key
		on: app
		order: 9.
	self
		settingOn: aBuilder
		named: #restartOnError
		labelled: 'Restart on error'
		withDescription: 'Whether to restart the listener in case of errors'
		usingConfig: app commandListenerSettings
		under: key
		on: app
		order: 10
]

{ #category : #settings }
EDASSettings class >> customProjectionErrorBehaviorsOn: aBuilder under: parent populatedWithValuesFrom: aConfigEntry [
	EDAProjectionErrorBehavior subclasses
		doWithIndex: [ :behavior :index | 
			(aBuilder pickOne: #strategy)
				parent: #errors;
				target: behavior;
				label: behavior label translated;
				description: behavior label translated;
				order: index + 1;
				domainValues:
					(EDAErrorHandlingStrategy subclasses
						collect: [ :strategy | strategy description -> strategy greaseString ]);
				default: EDAPublishMessageErrorStrategy greaseString ]
]

{ #category : #accessing }
EDASSettings class >> duEnvironmentClass [
	^ duEnvironmentClass
]

{ #category : #accessing }
EDASSettings class >> duEnvironmentClass: envClass [
	duEnvironmentClass := envClass
]

{ #category : #settings }
EDASSettings class >> edaSettingsOn: aBuilder [
	<systemsettings>
	| root rootSymbol |
	rootSymbol := #edaApps.
	root := aBuilder group: rootSymbol.
	EDAApplications uniqueInstance edaApplications
		ifEmpty: [ root
				label: 'No PharoEDA applications registered' translated;
				description: 'No PharoEDA applications registered' ]
		ifNotEmpty: [ :apps | 
			root
				label: 'PharoEDA application(s)' translated , ': ' , apps size printString;
				description: 'Registered PharoEDA applications';
				noOrdering.
			apps
				do: [ :app | self edaSettingsOn: aBuilder for: app under: rootSymbol ] ]
]

{ #category : #settings }
EDASSettings class >> edaSettingsOn: aBuilder for: anEDAApplication under: aSymbol [

	| parent parentGroup |
	parent := anEDAApplication applicationName.
	parentGroup := aBuilder group: parent.
	parentGroup
		label: parent translated;
		parent: aSymbol;
		description: parent;
		noOrdering.
	self
		environmentSettingsOn: aBuilder
		under: parent
		on: anEDAApplication
		order: 1.
	self
		commandListenerSettingsOn: aBuilder
		under: parent
		on: anEDAApplication
		order: 2.
	"
	self
		eventPublisherSettingsOn: aBuilder
		under: parent
		on: anEDAApplication.
	self
		eventStoreSettingsOn: aBuilder
		under: parent
		on: anEDAApplication.
	self
		projectionSettingsOn: aBuilder
		under: parent
		populatedWithValuesFrom: 'projections'
		on: anEDAApplication.
	self loggingSettingsOn: aBuilder under: parent on: anEDAApplication."
	self portSettingsOn: aBuilder under: parent on: anEDAApplication order: 3
]

{ #category : #settings }
EDASSettings class >> environmentSettingsOn: aBuilder under: aParent on: app order: anInteger [

	^ self
		  settingOn: aBuilder
		  named: #currentEnvironment
		  labelled: 'Environment'
		  withDescription: 'Environment'
		  usingConfig: app environmentSettings
		  under: aParent
		  on: app
		  order: anInteger
]

{ #category : #settings }
EDASSettings class >> eventPublisherSettingsOn: aBuilder under: parent on: app [
	| key |
	key := parent , 'eventPublisher'.
	(aBuilder group: key)
		label: 'Event Publisher' translated;
		description: 'Event publisher (for integration tests)';
		parent: parent.
	^ self
		stompPublisherSettingsOn: aBuilder
		withConfig: app eventPublisherSettingsPort
		under: key
		populatedWithValuesFrom: 'eventPublisher'
]

{ #category : #settings }
EDASSettings class >> eventStoreSettingsOn: aBuilder under: parent on: app [
	| extSettings key |
	key := parent , 'eventStore'.
	extSettings := self retrieveSettingAsDict: 'eventStore'.
	(aBuilder group: key)
		label: 'Event Store' translated;
		parent: parent.
	^ self
		mongoSettingsOn: aBuilder
		withConfig: app eventStoreSettingsPort
		under: key
		populatedWithValuesFrom: extSettings
		on: app
]

{ #category : #initialization }
EDASSettings class >> initialize [
	self duEnvironmentClass: EDADUEnvironment

]

{ #category : #settings }
EDASSettings class >> loggingSettingsOn: aBuilder under: parent on: app [
	| extSettings key |
	key := parent , 'logging'.
	extSettings := self retrieveSettingAsDict: 'logging'.
	(aBuilder group: key)
		label: 'Logging' translated;
		parent: parent.
	(aBuilder pickOne: #loggingLevel)
		parent: key;
		target: app loggingSettingsPort;
		label: 'Logging level' translated;
		description: 'Logging level';
		order: 1;
		domainValues:
			(EDACLoggingSettings levels
				collect: [ :level | level translated -> level greaseString ]);
		default: (extSettings at: 'level')
]

{ #category : #settings }
EDASSettings class >> mongoSettingsOn: aBuilder withConfig: container under: parent populatedWithValuesFrom: mongoConfig on: app [

	(aBuilder setting: #urls)
		parent: parent;
		target: container;
		label: 'Urls' translated;
		description: 'Comma-separated MongoDB urls';
		order: 1;
		default:
			(mongoConfig at: 'urls' ifAbsent: 'mondodb://localhost:27017/admin').
	(aBuilder setting: #tls)
		parent: parent;
		target: container;
		label: 'Use TLS' translated;
		description: 'Whether to connect using TLS';
		default: (mongoConfig at: 'tls' ifAbsent: false).
	(aBuilder setting: #password)
		parent: parent;
		target: container;
		label: 'Mongo user' translated;
		description: 'Mongo user';
		default: (mongoConfig at: 'user' ifAbsent: 'mongodb').
	(aBuilder setting: #password)
		parent: parent;
		target: container;
		label: 'Mongo password' translated;
		description: 'Mongo password';
		default: (mongoConfig at: 'password' ifAbsent: 'secret').
	(aBuilder setting: #databaseName)
		parent: parent;
		target: container;
		label: 'Mongo database' translated;
		description: 'Mongo database name';
		default: (mongoConfig at: 'database' ifAbsent: 'eda').
	(aBuilder pickOne: #authenticationMechanism)
		parent: parent;
		target: container;
		label: 'AuthenticationMechanism' translated;
		description: 'AuthenticationMechanism';
		domainValues:
			((MongoAuthMechanism allSubclasses reject: [ :item | 
					  item isAbstract ]) collect: [ :item | 
					 item textDescription -> item ]);
		default: (MongoAuthMechanism allSubclasses select: [ :item | 
					 item isAbstract not and: [ 
							 item textDescription
							 =
								 (mongoConfig
									  at: 'authenticationMechanism'
									  ifAbsent: 'SCRAM-SHA-1') ] ]) first.
	(aBuilder setting: #debug)
		parent: parent;
		target: container;
		label: 'Debug' translated;
		description: 'Debug';
		default: (mongoConfig at: 'debug' ifAbsent: true).
	(aBuilder setting: #enableReplication)
		parent: parent;
		target: container;
		label: 'Enable replication' translated;
		description: 'Enable replication';
		default: (mongoConfig at: 'enableReplication' ifAbsent: false).
	(aBuilder setting: #enableSingleton)
		parent: parent;
		target: container;
		label: 'Enable singleton' translated;
		description: 'Enable singleton';
		default: (mongoConfig at: 'enableSingleton' ifAbsent: true).
	(aBuilder setting: #ensuringCurrentOnSave)
		parent: parent;
		target: container;
		label: 'Current on save' translated;
		description: 'Ensure current on save';
		default: (mongoConfig at: 'ensuringCurrentOnSave' ifAbsent: true).
	(aBuilder setting: #ensuringCurrentReferencesOnQueries)
		parent: parent;
		target: container;
		label: 'Current references on queries' translated;
		description: 'Ensure current references on queries';
		default:
			(mongoConfig
				 at: 'ensuringCurrentReferencesOnQueries'
				 ifAbsent: true).
	(aBuilder setting: #lazySynchronize)
		parent: parent;
		target: container;
		label: 'Lazy synchronize';
		description: 'Lazy synchronize';
		default: (mongoConfig at: 'lazySynchronize' ifAbsent: true).
	(aBuilder setting: #wireProtocolEnabled)
		parent: parent;
		target: container;
		label: 'Wire protocol' translated;
		description: 'Whether to enable wire protocol';
		default: (mongoConfig at: 'wireProtocolEnabled' ifAbsent: true)
]

{ #category : #settings }
EDASSettings class >> old_commandListenerSettingsOn: aBuilder under: parent on: app [

	| key |
	key := parent , 'commandListener'.
	(aBuilder group: key)
		label: 'Command Listener' translated;
		description: 'Command listener';
		parent: parent.
	self
		stompListenerSettingsOn: aBuilder
		withConfig: app commandListenerSettings
		under: key
		populatedWithValuesFrom: 'commandListener'.
	(aBuilder pickOne: #strategy)
		parent: key;
		target: app commandListenerSettings;
		label: 'Command Consuming Error' translated;
		description: 'Strategy when dealing with command consuming errors';
		order: 1;
		domainValues:
			(EDAEErrorHandlingStrategy subclasses collect: [ :strategy | 
					 strategy description translated -> strategy greaseString ]);
		default: EDAEPublishMessageErrorStrategy greaseString.
	^ self
]

{ #category : #settings }
EDASSettings class >> portSettingsOn: aBuilder under: aParent on: app order: anInteger [

	| entry environmentValues key portResolver commandListenerValues |
	key := aParent , 'ports'.
	entry := aBuilder group: key.
	entry
		label: 'Ports' translated;
		parent: aParent.
	portResolver := EDASPortResolver new.
	environmentValues := OrderedCollection withAll:
		                     ((portResolver
			                       availableEnvironmentSettingsAdapters 
			                       collect: [ :adapterClass | 
			                       adapterClass description translated
			                       -> adapterClass ]) sorted: [ :a :b | a < b ]).
	(aBuilder pickOne: #environmentSettingsAdapterClass)
		label: 'Environment adapter' translated;
		target: app portSettings;
		parent: key;
		domainValues: environmentValues;
		order: 1.
	commandListenerValues := OrderedCollection withAll:
		                         ((portResolver
			                           availableCommandListenerSettingsAdapters 
			                           collect: [ :adapterClass | 
			                           adapterClass description translated
			                           -> adapterClass ]) sorted: [ :a :b | 
			                          a < b ]).
	(aBuilder pickOne: #commandListenerSettingsAdapterClass)
		label: 'Command Listener adapter' translated;
		target: app portSettings;
		parent: key;
		domainValues: commandListenerValues;
		order: 2
]

{ #category : #settings }
EDASSettings class >> projectionErrorHandlingSettingsOn: aBuilder withConfig: aConfig under: parent populatedWithValuesFrom: aConfigEntry on: app [
	| key |
	key := parent , 'errors'.
	(aBuilder group: key)
		label: 'Projection errors' translated;
		description: 'Projection error handling';
		noOrdering;
		parent: parent.
	(aBuilder pickOne: #strategy)
		parent: key;
		target: aConfig;
		label: 'Default projection Error Handling' translated;
		description: 'Default strategy when dealing with errors projecting events';
		order: 1;
		domainValues:
			(EDAErrorHandlingStrategy subclasses
				collect: [ :strategy | strategy description -> strategy printString ]);
		default: EDAPublishMessageErrorStrategy printString.
	"self
		customProjectionErrorBehaviorsOn: aBuilder
		withConfig: aConfig
		under: key
		populatedWithValuesFrom: aConfigEntry
		on: app"
]

{ #category : #settings }
EDASSettings class >> projectionSettingsOn: aBuilder under: parent populatedWithValuesFrom: aConfigEntry on: app [
	| extSettings key |
	key := parent , 'projections'.
	extSettings := self retrieveSettingAsDict: aConfigEntry.
	(aBuilder group: key)
		label: 'Projections' translated;
		parent: parent.
	self
		projectionsRepositorySettingsOn: aBuilder
		withConfig: app projectionSettingsPort
		under: key
		populatedWithValuesFrom: (extSettings at: 'projectionsRepository')
		on: app.
	(aBuilder setting: #projectionSynchronizationEnabled)
		parent: key;
		target: app projectionSettingsPort;
		label: 'Synchronize on startup' translated;
		description:
			'When the EDAApplication starts, this setting enables a check and conditional automatic synchronization of projections';
		default: (extSettings at: 'synchronizationEnabled').
	(aBuilder setting: #concurrentSynchronization)
		parent: key;
		target: app projectionSettingsPort;
		label: 'Synchronization in parallel' translated;
		description: 'Whether enable or disable concurrent projection synchronization';
		order: 2;
		default: (extSettings at: 'concurrentSynchronization').
	(aBuilder setting: #headlessMode)
		parent: key;
		target: app projectionSettingsPort;
		label: 'Headless' translated;
		description: 'Whether to show the progress when projecting events visually';
		order: 3;
		default: (extSettings at: 'headlessMode').
	self
		projectionErrorHandlingSettingsOn: aBuilder
		withConfig: app projectionSettingsPort
		under: parent
		populatedWithValuesFrom: aConfigEntry
		on: app
]

{ #category : #settings }
EDASSettings class >> projectionsRepositorySettingsOn: aBuilder withConfig: aConfig under: parent populatedWithValuesFrom: aConfigEntry on: app [
	(aBuilder group: #projectionsRepository)
		label: 'Projections Repository' translated;
		parent: parent.
	^ self
		mongoSettingsOn: aBuilder
		withConfig: aConfig
		under: #projectionsRepository
		populatedWithValuesFrom: aConfigEntry
		on: app
]

{ #category : #settings }
EDASSettings class >> resetSettings [
	#(#EDAACommandStompTopicListener #EDAAEventStompTopicPublisher #EDAAMongoEventStore #EDACLoggingSettings EDAApplication  EDAProjector 	 EDACompositeProjector  #EDAAProjectionMongoRepository)
		do: [ :cls | cls initialize ]
]

{ #category : #settings }
EDASSettings class >> settingOn: aBuilder named: aSymbol labelled: aString withDescription: aDescription usingConfig: aConfig under: aParent on: app order: anInteger [

	| entry |
	(aConfig supportsMultiple: aSymbol)
		ifTrue: [ 
			entry := aBuilder pickOne: aSymbol.
			entry domainValues: ((aConfig values: aSymbol) collect: [ :level | 
					 level translated -> level greaseString ]) ]
		ifFalse: [ 
			(aConfig isReadOnly: aSymbol)
				ifTrue: [ 
					entry := aBuilder group: aSymbol.
					entry dialog: [ LabelMorph newLabel: (aConfig perform: aSymbol) ] ]
				ifFalse: [ entry := aBuilder setting: aSymbol ] ].
	entry
		parent: aParent;
		target: aConfig;
		label: aString translated;
		description: aDescription;
		order: anInteger
]

{ #category : #settings }
EDASSettings class >> stompListenerSettingsOn: aBuilder withConfig: container under: parent populatedWithValuesFrom: configEntry [
	| stompConfig ack |
	stompConfig := self retrieveSettingAsDict: configEntry.
	(aBuilder setting: #host)
		parent: parent;
		target: container;
		label: 'STOMP host' translated;
		description: 'STOMP server host address';
		order: 1;
		default: (stompConfig at: 'host' ifAbsent: 'localhost').
	(aBuilder setting: #port)
		parent: parent;
		target: container;
		label: 'STOMP port' translated;
		description: 'STOMP server port';
		default: (stompConfig at: 'port' ifAbsent: 61613).
	(aBuilder setting: #username)
		parent: parent;
		target: container;
		label: 'STOMP username' translated;
		description: 'STOMP username';
		default: (stompConfig at: 'user' ifAbsent: 'user').
	(aBuilder setting: #password)
		parent: parent;
		target: container;
		label: 'STOMP password' translated;
		description: 'STOMP password';
		default: (stompConfig at: 'password' ifAbsent: 'secret').
	(aBuilder setting: #queue)
		parent: parent;
		target: container;
		label: 'Queue name' translated;
		description: 'Queue name';
		default: (stompConfig at: 'queue' ifAbsent: 'queue').
	(aBuilder setting: #durable)
		parent: parent;
		target: container;
		label: 'Durable subscription' translated;
		description: 'Durability of subscription';
		default: (stompConfig at: 'durable' ifAbsent: true).
	(stompConfig at: 'ack' ifAbsent: #auto) asSymbol = #auto
		ifTrue:
			[ self logErrorMessage: 'ACK is AUTO. Using client-individual anyway' ].
	ack := #'client-individual'.
	(aBuilder pickOne: #ack)
		parent: parent;
		target: container;
		label: 'Ack policy' translated;
		description: 'Acknowledgement policy';
		domainValues:
			(OrderedCollection
				with: 'Auto' translated -> #auto
				with: 'Client' translated -> #client
				with: 'Client Individual' translated -> #'client-individual');
		default: ack.
	(aBuilder setting: #prefetchCount)
		parent: parent;
		target: container;
		label: 'Prefetch count' translated;
		description: 'Prefetch count';
		default: (stompConfig at: 'prefetchCount' ifAbsent: 1).
	(aBuilder setting: #timeout)
		parent: parent;
		target: container;
		label: 'Timeout' translated;
		description: 'Timeout (in seconds)';
		default: (stompConfig at: 'timeout' ifAbsent: 60).
	(aBuilder setting: #commandListenerClientDebug)
		parent: parent;
		target: container;
		label: 'STOMP client in debug mode' translated;
		description: 'Whether enable debug mode in the STOMP client';
		default: (stompConfig at: 'debug' ifAbsent: true).
	(aBuilder setting: #restartOnCommandConsumingErrors)
		parent: parent;
		target: container;
		label: 'Restart on error' translated;
		description: 'Whether to restart the client in case of errors';
		default: (stompConfig at: 'restartOnError' ifAbsent: false)
]

{ #category : #settings }
EDASSettings class >> stompPublisherSettingsOn: aBuilder withConfig: container under: parent populatedWithValuesFrom: configEntry [
	| stompConfig |
	stompConfig := self retrieveSettingAsDict: configEntry.
	(aBuilder setting: #host)
		parent: parent;
		target: container;
		label: 'STOMP host' translated;
		description: 'STOMP server host address';
		order: 1;
		default: (stompConfig at: 'host' ifAbsent: 'localhost').
	(aBuilder setting: #port)
		parent: parent;
		target: container;
		label: 'STOMP port' translated;
		description: 'STOMP server port';
		default: (stompConfig at: 'port' ifAbsent: 61613).
	(aBuilder setting: #username)
		parent: parent;
		target: container;
		label: 'STOMP username' translated;
		description: 'STOMP username';
		default: (stompConfig at: 'user' ifAbsent: 'user').
	(aBuilder setting: #password)
		parent: parent;
		target: container;
		label: 'STOMP password' translated;
		description: 'STOMP password';
		default: (stompConfig at: 'password' ifAbsent: 'secret').
	(aBuilder setting: #exchange)
		parent: parent;
		target: container;
		label: 'Exchange name' translated;
		description: 'Exchange name';
		default: (stompConfig at: 'exchange' ifAbsent: 'exchange').
	(aBuilder setting: #routingKey)
		parent: parent;
		target: container;
		label: 'Routing key';
		description: 'Routing key';
		default: (stompConfig at: 'routingKey' ifAbsent: '#').
	(aBuilder setting: #durable)
		parent: parent;
		target: container;
		label: 'Durable subscription' translated;
		description: 'Durability of subscription';
		default: (stompConfig at: 'durable' ifAbsent: true).
	(aBuilder setting: #timeout)
		parent: parent;
		target: container;
		label: 'Timeout' translated;
		description: 'Timeout (in seconds)';
		default: (stompConfig at: 'timeout' ifAbsent: 60).
	(aBuilder setting: #errorExchange)
		parent: parent;
		target: container;
		label: 'Error exchange' translated;
		description: 'The exchange for errors';
		default: (stompConfig at: 'errorExchange' ifAbsent: 'errors').
	(aBuilder setting: #errorRoutingKey)
		parent: parent;
		target: container;
		label: 'Error routing key';
		description: 'Routing key used for errors';
		default: (stompConfig at: 'errorRoutingKey' ifAbsent: '#')
]
