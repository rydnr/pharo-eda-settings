Class {
	#name : #EDASStompTopicPublisherSettingsInMemoryAdapter,
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
EDASStompTopicPublisherSettingsInMemoryAdapter class >> accepts: aPort [

	^ true
]

{ #category : #accessing }
EDASStompTopicPublisherSettingsInMemoryAdapter class >> description [

	^ #'pharoeda.settings.ports.topic_publisher.stomp.description'
]

{ #category : #testing }
EDASStompTopicPublisherSettingsInMemoryAdapter class >> label [

	^ #'pharoeda.settings.ports.topic_publisher.stomp.label'
]

{ #category : #metadata }
EDASStompTopicPublisherSettingsInMemoryAdapter class >> portLabel [

	^ #'pharoeda.settings.ports.event_publisher.stomp.label'
]

{ #category : #accessing }
EDASStompTopicPublisherSettingsInMemoryAdapter class >> priority [
	^ 0
]

{ #category : #'class initialization' }
EDASStompTopicPublisherSettingsInMemoryAdapter >> doInitialize [
	super doInitialize.
	self exchange: nil.
	self routingKey: nil.
	self durable: true
]

{ #category : #accessing }
EDASStompTopicPublisherSettingsInMemoryAdapter >> errorExchange [

	<edaSettings:
	#'pharoeda.settings.adapters.event_publisher.stomp.errorExchange.label'
	withDescription:
	#'pharoeda.settings.adapters.event_publisher.stomp.errorExchange.description'
	icon: #errorexchange atPosition: 12 readOnly: false multiple: false>
	^ errorExchange ifNil: [ '' ]
]

{ #category : #accessing }
EDASStompTopicPublisherSettingsInMemoryAdapter >> errorExchange: aString [
	errorExchange := aString
]

{ #category : #accessing }
EDASStompTopicPublisherSettingsInMemoryAdapter >> errorRoutingKey [

	<edaSettings:
#'pharoeda.settings.adapters.event_publisher.stomp.errorRoutingKey.label'
	withDescription:
	#'pharoeda.settings.adapters.event_publisher.stomp.errorRoutingKey.description'
	icon: #errorroutingkey
	atPosition: 13 readOnly: false multiple: false>
	^ errorRoutingKey ifNil: [ '' ]
]

{ #category : #accessing }
EDASStompTopicPublisherSettingsInMemoryAdapter >> errorRoutingKey: val [
	errorRoutingKey := val
]

{ #category : #accessing }
EDASStompTopicPublisherSettingsInMemoryAdapter >> exchange [

	<edaSettings:
	
		#'pharoeda.settings.adapters.event_publisher.stomp.exchange.label'
	withDescription:
	#'pharoeda.settings.adapters.event_publisher.stomp.exchange.description'

	icon: #exchange atPosition: 5 readOnly: false multiple: false>
	^ exchange ifNil: [ '' ]
]

{ #category : #accessing }
EDASStompTopicPublisherSettingsInMemoryAdapter >> exchange: val [
	exchange := val
]

{ #category : #accessing }
EDASStompTopicPublisherSettingsInMemoryAdapter >> routingKey [

	<edaSettings:
	#'pharoeda.settings.adapters.event_publisher.stomp.routingKey.label'
	withDescription:
	#'pharoeda.settings.adapters.event_publisher.stomp.routingKey.description'
	atPosition: 6 readOnly: false multiple: false>
	^ routingKey ifNil: [ '' ]
]

{ #category : #accessing }
EDASStompTopicPublisherSettingsInMemoryAdapter >> routingKey: val [
	routingKey := val
]
