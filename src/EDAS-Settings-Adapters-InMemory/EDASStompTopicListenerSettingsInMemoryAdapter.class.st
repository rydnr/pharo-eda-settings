Class {
	#name : #EDASStompTopicListenerSettingsInMemoryAdapter,
	#superclass : #EDASStompSettingsInMemoryAdapter,
	#traits : 'EDASCommandListenerSettingsPort',
	#classTraits : 'EDASCommandListenerSettingsPort classTrait',
	#instVars : [
		'topicListener',
		'ack',
		'queue',
		'strategy',
		'restartOnCommandConsumingErrors'
	],
	#category : #'EDAS-Settings-Adapters-InMemory'
}

{ #category : #testing }
EDASStompTopicListenerSettingsInMemoryAdapter class >> accepts: anEDAApplication [
	^ true
]

{ #category : #testing }
EDASStompTopicListenerSettingsInMemoryAdapter class >> description [

	^ 'Stomp topic listener'
]

{ #category : #accessing }
EDASStompTopicListenerSettingsInMemoryAdapter class >> priority [
	^ 0
]

{ #category : #accessing }
EDASStompTopicListenerSettingsInMemoryAdapter >> ack [

	^ ack ifNil: [ #auto ]
]

{ #category : #accessing }
EDASStompTopicListenerSettingsInMemoryAdapter >> ack: val [
	self assert: (#(#auto #client #'client-individual') includes: val).
	ack := val
]

{ #category : #accessing }
EDASStompTopicListenerSettingsInMemoryAdapter >> destination [
	^ '/amq/queue/' , self queue
]

{ #category : #initialization }
EDASStompTopicListenerSettingsInMemoryAdapter >> doInitialize [
	super doInitialize.
	self queue: nil.
	self prefetchCount: nil.
	self durable: true.
	self ack: #'client-individual'
]

{ #category : #initialization }
EDASStompTopicListenerSettingsInMemoryAdapter >> initialize [
	super initialize.
	self doInitialize
]

{ #category : #accessing }
EDASStompTopicListenerSettingsInMemoryAdapter >> prefetchCount [

	^ prefetchCount ifNil: [ 1 ]
]

{ #category : #accessing }
EDASStompTopicListenerSettingsInMemoryAdapter >> prefetchCount: val [
	prefetchCount := val
]

{ #category : #accessing }
EDASStompTopicListenerSettingsInMemoryAdapter >> queue [

	^ queue ifNil: [ '' ]
]

{ #category : #accessing }
EDASStompTopicListenerSettingsInMemoryAdapter >> queue: val [
	queue := val
]

{ #category : #accessing }
EDASStompTopicListenerSettingsInMemoryAdapter >> restartOnCommandConsumingErrors [
	^ restartOnCommandConsumingErrors
]

{ #category : #accessing }
EDASStompTopicListenerSettingsInMemoryAdapter >> restartOnCommandConsumingErrors: aBoolean [
	restartOnCommandConsumingErrors := aBoolean
]

{ #category : #accessing }
EDASStompTopicListenerSettingsInMemoryAdapter >> strategy [
	^ strategy
]

{ #category : #accessing }
EDASStompTopicListenerSettingsInMemoryAdapter >> strategy: aStrategy [
	strategy := aStrategy
]

{ #category : #accessing }
EDASStompTopicListenerSettingsInMemoryAdapter >> topicListener [

	^ topicListener ifNil: [ self topicListener: (EDAACommandStompTopicListener withConfig: self). topicListener  ]
]

{ #category : #accessing }
EDASStompTopicListenerSettingsInMemoryAdapter >> topicListener: anObject [

	topicListener := anObject
]
