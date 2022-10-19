Class {
	#name : #EDASStompTopicListenerSettingsInMemoryAdapter,
	#superclass : #EDASStompSettingsInMemoryAdapter,
	#traits : 'EDASCommandListenerSettingsPort',
	#classTraits : 'EDASCommandListenerSettingsPort classTrait',
	#instVars : [
		'topicListener',
		'prefetchCount',
		'ack',
		'queue',
		'errorStrategy'
	],
	#category : #'EDAS-Settings-Adapters-InMemory'
}

{ #category : #testing }
EDASStompTopicListenerSettingsInMemoryAdapter class >> accepts: anEDAApplication [
	^ true
]

{ #category : #testing }
EDASStompTopicListenerSettingsInMemoryAdapter class >> description [

	^ 'Stomp'
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

{ #category : #resolving }
EDASStompTopicListenerSettingsInMemoryAdapter >> availableErrorStrategies [

	^ super availableErrorStrategies
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

{ #category : #accessing }
EDASStompTopicListenerSettingsInMemoryAdapter >> errorStrategy [

	^ super errorStrategy
]

{ #category : #initialization }
EDASStompTopicListenerSettingsInMemoryAdapter >> initialize [
	super initialize.
	self doInitialize
]

{ #category : #testing }
EDASStompTopicListenerSettingsInMemoryAdapter >> isReadOnly: aSymbol [

	^ false
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

{ #category : #testing }
EDASStompTopicListenerSettingsInMemoryAdapter >> restartOnError [

	^ super restartOnError
]

{ #category : #testing }
EDASStompTopicListenerSettingsInMemoryAdapter >> supportsMultiple: aSymbol [

	^ aSymbol = #errorStrategyName
]

{ #category : #accessing }
EDASStompTopicListenerSettingsInMemoryAdapter >> topicListener [

	^ topicListener ifNil: [ self topicListener: (EDAACommandStompTopicListener withConfig: self). topicListener  ]
]

{ #category : #accessing }
EDASStompTopicListenerSettingsInMemoryAdapter >> topicListener: anObject [

	topicListener := anObject
]
