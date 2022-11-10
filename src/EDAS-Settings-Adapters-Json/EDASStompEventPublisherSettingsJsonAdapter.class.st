Class {
	#name : #EDASStompEventPublisherSettingsJsonAdapter,
	#superclass : #Object,
	#traits : 'EDASSettingsPort + EDASStompSettingsJsonAdapter + EDASEventPublisherSettingsPort + EDASStompSettingsPort',
	#classTraits : 'EDASSettingsPort classTrait + EDASStompSettingsJsonAdapter classTrait + EDASEventPublisherSettingsPort classTrait + EDASStompSettingsPort classTrait',
	#instVars : [
		'errorExchange',
		'errorRoutingKey',
		'exchange',
		'routingKey'
	],
	#category : #'EDAS-Settings-Adapters-Json'
}

{ #category : #accessing }
EDASStompEventPublisherSettingsJsonAdapter class >> changedEventName [

	^ EDASStompEventPublisherSettingsInMemoryAdapter changedEventName
]

{ #category : #testing }
EDASStompEventPublisherSettingsJsonAdapter class >> description [

	^ #'pharoeda.settings.adapters.eventPublisher.stomp.json.description'
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

	^ #'pharoeda.settings.adapters.eventPublisher.stomp.label'
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
	^ debug ifNil: [ true ]
]

{ #category : #accessing }
EDASStompEventPublisherSettingsJsonAdapter >> durable [

	<edaSettings: #'pharoeda.settings.adapters.stomp.durable.label'
	withDescription:
	#'pharoeda.settings.adapters.stomp.durable.description' icon:
	#durable atPosition: 8 readOnly: false multiple: false>
	^ durable ifNil: [ true ]
]

{ #category : #accessing }
EDASStompEventPublisherSettingsJsonAdapter >> errorExchange [

	<edaSettings:
	#'pharoeda.settings.adapters.eventPublisher.stomp.errorExchange.label'
	withDescription:
	#'pharoeda.settings.adapters.eventPublisher.stomp.errorExchange.description'
	icon: #errorexchange atPosition: 12 readOnly: false multiple: false>
	^ errorExchange ifNil: [ '' ]
]

{ #category : #accessing }
EDASStompEventPublisherSettingsJsonAdapter >> errorExchange: anObject [

	errorExchange := anObject
]

{ #category : #accessing }
EDASStompEventPublisherSettingsJsonAdapter >> errorRoutingKey [

	<edaSettings:
	#'pharoeda.settings.adapters.eventPublisher.stomp.errorRoutingKey.label'
	withDescription:
	#'pharoeda.settings.adapters.eventPublisher.stomp.errorRoutingKey.description'
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
	^ errorStrategyName ifNil: [ self availableErrorStrategies first ]
]

{ #category : #accessing }
EDASStompEventPublisherSettingsJsonAdapter >> exchange [

	<edaSettings:
	#'pharoeda.settings.adapters.eventPublisher.stomp.exchange.label'
	withDescription:
	#'pharoeda.settings.adapters.eventPublisher.stomp.exchange.description'
	icon: #exchange atPosition: 5 readOnly: false multiple: false>
	^ exchange ifNil: [ '' ]
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
	^ host ifNil: [ 'localhost' ]
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
	^ password ifNil: [ '' ]
]

{ #category : #accessing }
EDASStompEventPublisherSettingsJsonAdapter >> port [

	<edaSettings: #'pharoeda.settings.adapters.stomp.port.label'
	withDescription: #'pharoeda.settings.adapters.stomp.port.description'
	icon: #port atPosition: 2 readOnly: false multiple: false>
	^ port ifNil: [ 61613 ]
]

{ #category : #accessing }
EDASStompEventPublisherSettingsJsonAdapter >> restartOnErrors [

	<edaSettings:
	#'pharoeda.settings.adapters.stomp.restartOnErrors.label'
	withDescription:
	#'pharoeda.settings.adapters.stomp.restartOnErrors.description' icon:
	#restartonerrors atPosition: 10 readOnly: false multiple: false>
	^ restartOnErrors ifNil: [ true ]
]

{ #category : #accessing }
EDASStompEventPublisherSettingsJsonAdapter >> routingKey [

	<edaSettings:
	#'pharoeda.settings.adapters.eventPublisher.stomp.routingKey.label'
	withDescription:
	#'pharoeda.settings.adapters.eventPublisher.stomp.routingKey.description'
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
	^ timeout ifNil: [ 60 ]
]

{ #category : #accessing }
EDASStompEventPublisherSettingsJsonAdapter >> user [

	<edaSettings: #'pharoeda.settings.adapters.stomp.user.label'
	withDescription: #'pharoeda.settings.adapters.stomp.user.description'
	icon: #user atPosition: 3 readOnly: false multiple: false>
	^ user ifNil: [ '' ]
]
