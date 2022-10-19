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
EDASStompTopicPublisherSettingsInMemoryAdapter class >> accepts: anEDAApplication [
	^ true
]

{ #category : #testing }
EDASStompTopicPublisherSettingsInMemoryAdapter class >> description [

	^ 'Stomp'
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
	^ errorExchange
]

{ #category : #accessing }
EDASStompTopicPublisherSettingsInMemoryAdapter >> errorExchange: aString [
	errorExchange := aString
]

{ #category : #accessing }
EDASStompTopicPublisherSettingsInMemoryAdapter >> errorRoutingKey [
	^ errorRoutingKey
]

{ #category : #accessing }
EDASStompTopicPublisherSettingsInMemoryAdapter >> errorRoutingKey: val [
	errorRoutingKey := val
]

{ #category : #accessing }
EDASStompTopicPublisherSettingsInMemoryAdapter >> exchange [
	^ exchange
]

{ #category : #accessing }
EDASStompTopicPublisherSettingsInMemoryAdapter >> exchange: val [
	exchange := val
]

{ #category : #accessing }
EDASStompTopicPublisherSettingsInMemoryAdapter >> routingKey [
	^ routingKey
]

{ #category : #accessing }
EDASStompTopicPublisherSettingsInMemoryAdapter >> routingKey: val [
	routingKey := val
]
