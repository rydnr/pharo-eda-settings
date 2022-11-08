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
EDASStompTopicListenerSettingsInMemoryAdapter class >> accepts: aPort [

	^ aPort = EDASCommandListenerSettingsPort
]

{ #category : #metadata }
EDASStompTopicListenerSettingsInMemoryAdapter class >> description [

	^ #'pharoeda.settings.adapters.command_listener.stomp.description'
]

{ #category : #metadata }
EDASStompTopicListenerSettingsInMemoryAdapter class >> label [

	^ #'pharoeda.settings.adapters.command_listener.stomp.label'
]

{ #category : #metadata }
EDASStompTopicListenerSettingsInMemoryAdapter class >> portLabel [

	^ #'pharoeda.settings.ports.command_listener.stomp.label'
]

{ #category : #accessing }
EDASStompTopicListenerSettingsInMemoryAdapter class >> priority [
	^ 0
]

{ #category : #accessing }
EDASStompTopicListenerSettingsInMemoryAdapter >> ack [

	<edaSettings:
	#'pharoeda.settings.adapters.command_listener.stomp.ack.label'
	withDescription:
	#'pharoeda.settings.adapters.command_listener.stomp.ack.description'
	icon: #ack atPosition: 12 readOnly: false multiple: true>
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
EDASStompTopicListenerSettingsInMemoryAdapter >> commandListener [

	^ self
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

{ #category : #accessing }
EDASStompTopicListenerSettingsInMemoryAdapter >> port [

	^ super port
]

{ #category : #accessing }
EDASStompTopicListenerSettingsInMemoryAdapter >> prefetchCount [

	<edaSettings:
	#'pharoeda.settings.adapters.command_listener.stomp.prefetchCount.label'
	withDescription:
	#'pharoeda.settings.adapters.command_listener.stomp.prefetchCount.description'
	icon: #prefetchcount atPosition: 7 readOnly: false multiple: false>
	^ prefetchCount ifNil: [ 1 ]
]

{ #category : #accessing }
EDASStompTopicListenerSettingsInMemoryAdapter >> prefetchCount: val [
	prefetchCount := val
]

{ #category : #accessing }
EDASStompTopicListenerSettingsInMemoryAdapter >> queue [

	<edaSettings:
	#'pharoeda.settings.adapters.command_listener.stomp.queue.label'
	withDescription:
	#'pharoeda.settings.adapters.command_listener.stomp.queue.description'
	icon: #queue atPosition: 5 readOnly: false multiple: false>
	^ queue ifNil: [ '' ]
]

{ #category : #accessing }
EDASStompTopicListenerSettingsInMemoryAdapter >> queue: val [
	queue := val
]

{ #category : #accessing }
EDASStompTopicListenerSettingsInMemoryAdapter >> restartOnErrors [

	^ super restartOnErrors
]

{ #category : #accessing }
EDASStompTopicListenerSettingsInMemoryAdapter >> topicListener [

	^ topicListener ifNil: [ self topicListener: (EDAACommandStompTopicListener withConfig: self). topicListener  ]
]

{ #category : #accessing }
EDASStompTopicListenerSettingsInMemoryAdapter >> topicListener: anObject [

	topicListener := anObject
]

{ #category : #resolving }
EDASStompTopicListenerSettingsInMemoryAdapter >> values: aSymbol [

	^ aSymbol = #ack
		  ifTrue: [ 
			  Dictionary new
				  at:
					  #'pharoeda.settings.adapters.command_listener.stomp.ack.client-individual'
						  translated
				  put: #'client-individual';
				  at:
					  #'pharoeda.settings.adapters.command_listener.stomp.ack.client'
						  translated
				  put: #client;
				  at: 
					  #'pharoeda.settings.adapters.command_listener.stomp.ack.auto'
						  translated
		
				put: #auto;
				  associations ]
		  ifFalse: [ super values: aSymbol ]
]
