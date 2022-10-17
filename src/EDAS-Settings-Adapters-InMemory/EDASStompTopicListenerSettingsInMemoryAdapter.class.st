Class {
	#name : #EDASStompTopicListenerSettingsInMemoryAdapter,
	#superclass : #EDASStompSettingsInMemoryAdapter,
	#traits : 'EDASCommandListenerSettingsPort',
	#classTraits : 'EDASCommandListenerSettingsPort classTrait',
	#instVars : [
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

{ #category : #accessing }
EDASStompTopicListenerSettingsInMemoryAdapter class >> priority [
	^ 0
]

{ #category : #accessing }
EDASStompTopicListenerSettingsInMemoryAdapter >> ack [
	^ ack
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
	^ prefetchCount
]

{ #category : #accessing }
EDASStompTopicListenerSettingsInMemoryAdapter >> prefetchCount: val [
	prefetchCount := val
]

{ #category : #accessing }
EDASStompTopicListenerSettingsInMemoryAdapter >> queue [
	^ queue
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
