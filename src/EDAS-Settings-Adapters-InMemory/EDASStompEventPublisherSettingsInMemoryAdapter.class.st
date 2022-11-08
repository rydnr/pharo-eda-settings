Class {
	#name : #EDASStompEventPublisherSettingsInMemoryAdapter,
	#superclass : #EDASStompSettingsInMemoryAdapter,
	#traits : 'EDASEventPublisherSettingsPort',
	#classTraits : 'EDASEventPublisherSettingsPort classTrait',
	#instVars : [
		'errorExchange',
		'errorRoutingKey',
		'exchange',
		'routingKey'
	],
	#category : #'EDAS-Settings-Adapters-InMemory'
}

{ #category : #testing }
EDASStompEventPublisherSettingsInMemoryAdapter class >> accepts: aPort [

	^ true
]

{ #category : #accessing }
EDASStompEventPublisherSettingsInMemoryAdapter class >> description [

	^ #'pharoeda.settings.adapters.event_publisher.stomp.description'
]

{ #category : #testing }
EDASStompEventPublisherSettingsInMemoryAdapter class >> label [

	^ #'pharoeda.settings.adapters.event_publisher.stomp.label'
]

{ #category : #metadata }
EDASStompEventPublisherSettingsInMemoryAdapter class >> portLabel [

	^ #'pharoeda.settings.ports.event_publisher.stomp.label'
]

{ #category : #accessing }
EDASStompEventPublisherSettingsInMemoryAdapter class >> priority [
	^ 0
]

{ #category : #'class initialization' }
EDASStompEventPublisherSettingsInMemoryAdapter >> doInitialize [
	super doInitialize.
	self exchange: nil.
	self routingKey: nil.
	self durable: true
]

{ #category : #accessing }
EDASStompEventPublisherSettingsInMemoryAdapter >> errorExchange [

	<edaSettings:
	#'pharoeda.settings.adapters.event_publisher.stomp.errorExchange.label'
	withDescription:
	#'pharoeda.settings.adapters.event_publisher.stomp.errorExchange.description'
	icon: #errorexchange atPosition: 12 readOnly: false multiple: false>
	^ errorExchange ifNil: [ '' ]
]

{ #category : #accessing }
EDASStompEventPublisherSettingsInMemoryAdapter >> errorExchange: aString [
	errorExchange := aString
]

{ #category : #accessing }
EDASStompEventPublisherSettingsInMemoryAdapter >> errorRoutingKey [

	<edaSettings:
#'pharoeda.settings.adapters.event_publisher.stomp.errorRoutingKey.label'
	withDescription:
	#'pharoeda.settings.adapters.event_publisher.stomp.errorRoutingKey.description'
	icon: #errorroutingkey
	atPosition: 13 readOnly: false multiple: false>
	^ errorRoutingKey ifNil: [ '' ]
]

{ #category : #accessing }
EDASStompEventPublisherSettingsInMemoryAdapter >> errorRoutingKey: val [
	errorRoutingKey := val
]

{ #category : #accessing }
EDASStompEventPublisherSettingsInMemoryAdapter >> exchange [

	<edaSettings:
	
		#'pharoeda.settings.adapters.event_publisher.stomp.exchange.label'
	withDescription:
	#'pharoeda.settings.adapters.event_publisher.stomp.exchange.description'

	icon: #exchange atPosition: 5 readOnly: false multiple: false>
	^ exchange ifNil: [ '' ]
]

{ #category : #accessing }
EDASStompEventPublisherSettingsInMemoryAdapter >> exchange: val [
	exchange := val
]

{ #category : #accessing }
EDASStompEventPublisherSettingsInMemoryAdapter >> routingKey [

	<edaSettings:
	#'pharoeda.settings.adapters.event_publisher.stomp.routingKey.label'
	withDescription:
	#'pharoeda.settings.adapters.event_publisher.stomp.routingKey.description'
	atPosition: 6 readOnly: false multiple: false>
	^ routingKey ifNil: [ '' ]
]

{ #category : #accessing }
EDASStompEventPublisherSettingsInMemoryAdapter >> routingKey: val [
	routingKey := val
]
