Class {
	#name : #EDASStompEventPublisherSettingsJsonAdapter,
	#superclass : #Object,
	#traits : 'EDASSettingsPort + EDASStompSettingsJsonAdapter + EDASEventPublisherSettingsPort',
	#classTraits : 'EDASSettingsPort classTrait + EDASStompSettingsJsonAdapter classTrait + EDASEventPublisherSettingsPort classTrait',
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
EDASStompEventPublisherSettingsJsonAdapter >> errorExchange [

	^ errorExchange
]

{ #category : #accessing }
EDASStompEventPublisherSettingsJsonAdapter >> errorExchange: anObject [

	errorExchange := anObject
]

{ #category : #accessing }
EDASStompEventPublisherSettingsJsonAdapter >> errorRoutingKey [

	^ errorRoutingKey
]

{ #category : #accessing }
EDASStompEventPublisherSettingsJsonAdapter >> errorRoutingKey: anObject [

	errorRoutingKey := anObject
]

{ #category : #accessing }
EDASStompEventPublisherSettingsJsonAdapter >> exchange [

	^ exchange
]

{ #category : #accessing }
EDASStompEventPublisherSettingsJsonAdapter >> exchange: anObject [

	exchange := anObject
]

{ #category : #testing }
EDASStompEventPublisherSettingsJsonAdapter >> isReadOnly: aString [

	^ true
]

{ #category : #accessing }
EDASStompEventPublisherSettingsJsonAdapter >> routingKey [

	^ routingKey
]

{ #category : #accessing }
EDASStompEventPublisherSettingsJsonAdapter >> routingKey: anObject [

	routingKey := anObject
]
