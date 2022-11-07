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

	^ false
]

{ #category : #accessing }
EDASStompTopicPublisherSettingsInMemoryAdapter class >> description [

	^ #'pharoeda.settings.ports.topic_publisher.stomp.description'
]

{ #category : #testing }
EDASStompTopicPublisherSettingsInMemoryAdapter class >> label [

	^ #'pharoeda.settings.ports.topic_publisher.stomp.label'
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

	<edaSettings: 'Error exchange' withDescription: 'The name of the error exchange' atPosition: 12
	readOnly: false multiple: false>
	^ errorExchange
]

{ #category : #accessing }
EDASStompTopicPublisherSettingsInMemoryAdapter >> errorExchange: aString [
	errorExchange := aString
]

{ #category : #accessing }
EDASStompTopicPublisherSettingsInMemoryAdapter >> errorRoutingKey [


	<edaSettings: 'Error routing key' withDescription: 'The routing key for error messages' atPosition: 13
	readOnly: false multiple: false>
	^ errorRoutingKey
]

{ #category : #accessing }
EDASStompTopicPublisherSettingsInMemoryAdapter >> errorRoutingKey: val [
	errorRoutingKey := val
]

{ #category : #accessing }
EDASStompTopicPublisherSettingsInMemoryAdapter >> exchange [

	<edaSettings: 'Exchange' withDescription: 'The name of the exchange'
	atPosition: 5 readOnly: false multiple: false>
	^ exchange
]

{ #category : #accessing }
EDASStompTopicPublisherSettingsInMemoryAdapter >> exchange: val [
	exchange := val
]

{ #category : #accessing }
EDASStompTopicPublisherSettingsInMemoryAdapter >> routingKey [

	<edaSettings: 'Routing key' withDescription: 'The routing key when publishing messages'
	atPosition: 6 readOnly: false multiple: false>
	^ routingKey
]

{ #category : #accessing }
EDASStompTopicPublisherSettingsInMemoryAdapter >> routingKey: val [
	routingKey := val
]
