Class {
	#name : #EDASStompEventPublisherSettingsJsonAdapter,
	#superclass : #Object,
	#traits : 'EDASSettingsPort + EDASStompSettingsJsonAdapter + EDASEventPublisherSettingsPort + EDASStompSettingsPort',
	#classTraits : 'EDASSettingsPort classTrait + EDASStompSettingsJsonAdapter classTrait + EDASEventPublisherSettingsPort classTrait + EDASStompSettingsPort classTrait',
	#instVars : [
		'errorExchange',
		'errorRoutingKey',
		'exchange',
		'routingKey',
		'debug',
		'durable',
		'errorStrategyName',
		'host',
		'password',
		'port',
		'restartOnErrors',
		'timeout',
		'user'
	],
	#category : #'EDAS-Settings-Adapters-Json'
}

{ #category : #accessing }
EDASStompEventPublisherSettingsJsonAdapter class >> changedEventName [

	^ EDASStompEventPublisherSettingsInMemoryAdapter changedEventName
]

{ #category : #testing }
EDASStompEventPublisherSettingsJsonAdapter class >> description [

	^ #'pharoeda.settings.adapters.event_publisher.stomp.json.description'
]

{ #category : #ambiguous }
EDASStompEventPublisherSettingsJsonAdapter class >> edaPort [

	"This gets called in EDASSettings when selecting the port, so it gets selected correctly"

	^ EDASStompEventPublisherSettingsInMemoryAdapter
]

{ #category : #'instance creation' }
EDASStompEventPublisherSettingsJsonAdapter class >> fromFile: aFileReference withApp: anEDAApplication [

	^ self
		  fromFile: aFileReference
		  under: 'eventPublisher'
		  withApp: anEDAApplication
]

{ #category : #testing }
EDASStompEventPublisherSettingsJsonAdapter class >> icon [

	^ EDACIconProvider new iconNamed: #eventpublisher orElse: #comments
]

{ #category : #testing }
EDASStompEventPublisherSettingsJsonAdapter class >> label [

	^ #'pharoeda.settings.adapters.event_publisher.stomp.label'
]

{ #category : #accessing }
EDASStompEventPublisherSettingsJsonAdapter class >> portChangedEventName [

	^ EDASStompEventPublisherSettingsInMemoryAdapter portChangedEventName
]

{ #category : #metadata }
EDASStompEventPublisherSettingsJsonAdapter class >> portLabel [

	^ EDASStompEventPublisherSettingsInMemoryAdapter portLabel
]

{ #category : #accessing }
EDASStompEventPublisherSettingsJsonAdapter >> debug [

	<edaSettings: #'pharoeda.settings.adapters.stomp.debug.label'
	withDescription:
	#'pharoeda.settings.adapters.stomp.debug.description' icon: #debug
	atPosition: 9 readOnly: false multiple: false>
	^ debug
]

{ #category : #accessing }
EDASStompEventPublisherSettingsJsonAdapter >> debug: anObject [

	debug := anObject
]

{ #category : #accessing }
EDASStompEventPublisherSettingsJsonAdapter >> durable [

	<edaSettings: #'pharoeda.settings.adapters.stomp.durable.label'
	withDescription:
	#'pharoeda.settings.adapters.stomp.durable.description' icon:
	#durable atPosition: 8 readOnly: false multiple: false>
	^ durable
]

{ #category : #accessing }
EDASStompEventPublisherSettingsJsonAdapter >> durable: anObject [

	durable := anObject
]

{ #category : #accessing }
EDASStompEventPublisherSettingsJsonAdapter >> errorExchange [

	<edaSettings:
	#'pharoeda.settings.adapters.event_publisher.stomp.errorExchange.label'
	withDescription:
	#'pharoeda.settings.adapters.event_publisher.stomp.errorExchange.description'
	icon: #errorexchange atPosition: 12 readOnly: false multiple: false>
	^ errorExchange
]

{ #category : #accessing }
EDASStompEventPublisherSettingsJsonAdapter >> errorExchange: anObject [

	errorExchange := anObject
]

{ #category : #accessing }
EDASStompEventPublisherSettingsJsonAdapter >> errorRoutingKey [

	<edaSettings:
	#'pharoeda.settings.adapters.event_publisher.stomp.errorRoutingKey.label'
	withDescription:
	#'pharoeda.settings.adapters.event_publisher.stomp.errorRoutingKey.description'
	icon: #errorroutingkey atPosition: 13 readOnly: false multiple: false>
	^ errorRoutingKey ifNil: [ '#' ]
]

{ #category : #accessing }
EDASStompEventPublisherSettingsJsonAdapter >> errorRoutingKey: anObject [

	errorRoutingKey := anObject
]

{ #category : #accessing }
EDASStompEventPublisherSettingsJsonAdapter >> errorStrategyName [

	<edaSettings:
	#'pharoeda.settings.adapters.stomp.errorStrategyName.label'
	withDescription:
	#'pharoeda.settings.adapters.stomp.errorStrategyName.description'
	icon: #errorstrategy atPosition: 11 readOnly: false multiple: true>
	^ errorStrategyName
]

{ #category : #accessing }
EDASStompEventPublisherSettingsJsonAdapter >> errorStrategyName: anObject [

	errorStrategyName := anObject
]

{ #category : #accessing }
EDASStompEventPublisherSettingsJsonAdapter >> exchange [

	<edaSettings:
	#'pharoeda.settings.adapters.event_publisher.stomp.exchange.label'
	withDescription:
	#'pharoeda.settings.adapters.event_publisher.stomp.exchange.description'
	icon: #exchange atPosition: 5 readOnly: false multiple: false>
	^ exchange
]

{ #category : #accessing }
EDASStompEventPublisherSettingsJsonAdapter >> exchange: anObject [

	exchange := anObject
]

{ #category : #accessing }
EDASStompEventPublisherSettingsJsonAdapter >> host [

	<edaSettings: #'pharoeda.settings.adapters.stomp.host.label'
	withDescription: #'pharoeda.settings.adapters.stomp.host.description'
	icon: #host atPosition: 1 readOnly: false multiple: false>
	^ host
]

{ #category : #accessing }
EDASStompEventPublisherSettingsJsonAdapter >> host: anObject [

	host := anObject
]

{ #category : #testing }
EDASStompEventPublisherSettingsJsonAdapter >> isReadOnly: aString [

	^ true
]

{ #category : #accessing }
EDASStompEventPublisherSettingsJsonAdapter >> password [

	<edaSettings: #'pharoeda.settings.adapters.stomp.password.label'
	withDescription:
	#'pharoeda.settings.adapters.stomp.password.description' icon:
	#password atPosition: 4 readOnly: false multiple: false>
	^ password
]

{ #category : #accessing }
EDASStompEventPublisherSettingsJsonAdapter >> password: anObject [

	password := anObject
]

{ #category : #accessing }
EDASStompEventPublisherSettingsJsonAdapter >> port [

	<edaSettings: #'pharoeda.settings.adapters.stomp.port.label'
	withDescription: #'pharoeda.settings.adapters.stomp.port.description'
	icon: #port atPosition: 2 readOnly: false multiple: false>
	^ port
]

{ #category : #accessing }
EDASStompEventPublisherSettingsJsonAdapter >> port: anObject [

	port := anObject
]

{ #category : #accessing }
EDASStompEventPublisherSettingsJsonAdapter >> restartOnErrors [

	<edaSettings:
	#'pharoeda.settings.adapters.stomp.restartOnErrors.label'
	withDescription:
	#'pharoeda.settings.adapters.stomp.restartOnErrors.description' icon:
	#restartonerrors atPosition: 10 readOnly: false multiple: false>
	^ restartOnErrors
]

{ #category : #accessing }
EDASStompEventPublisherSettingsJsonAdapter >> restartOnErrors: anObject [

	restartOnErrors := anObject
]

{ #category : #accessing }
EDASStompEventPublisherSettingsJsonAdapter >> routingKey [

	<edaSettings:
	#'pharoeda.settings.adapters.event_publisher.stomp.routingKey.label'
	withDescription:
	#'pharoeda.settings.adapters.event_publisher.stomp.routingKey.description'
	icon: #routingkey atPosition: 6 readOnly: false multiple: false>
	^ routingKey ifNil: [ '#' ]
]

{ #category : #accessing }
EDASStompEventPublisherSettingsJsonAdapter >> routingKey: anObject [

	routingKey := anObject
]

{ #category : #accessing }
EDASStompEventPublisherSettingsJsonAdapter >> timeout [

	<edaSettings: #'pharoeda.settings.adapters.stomp.timeout.label'
	withDescription:
	#'pharoeda.settings.adapters.stomp.timeout.description' icon:
	#timeout atPosition: 6 readOnly: false multiple: false>
	^ timeout
]

{ #category : #accessing }
EDASStompEventPublisherSettingsJsonAdapter >> timeout: anObject [

	timeout := anObject
]

{ #category : #accessing }
EDASStompEventPublisherSettingsJsonAdapter >> user [

	<edaSettings: #'pharoeda.settings.adapters.stomp.user.label'
	withDescription: #'pharoeda.settings.adapters.stomp.user.description'
	icon: #user atPosition: 3 readOnly: false multiple: false>
	^ user
]

{ #category : #accessing }
EDASStompEventPublisherSettingsJsonAdapter >> user: anObject [

	user := anObject
]

{ #category : #resolving }
EDASStompEventPublisherSettingsJsonAdapter >> values: aSymbol [

	aSymbol = #errorStrategyName
		ifTrue: [ ^ self availableErrorStrategies ]
		ifFalse: [ ^ OrderedCollection new ]
]
