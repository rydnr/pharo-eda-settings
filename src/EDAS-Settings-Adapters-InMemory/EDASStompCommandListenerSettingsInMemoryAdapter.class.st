Class {
	#name : #EDASStompCommandListenerSettingsInMemoryAdapter,
	#superclass : #EDASStompSettingsInMemoryAdapter,
	#traits : 'EDASCommandListenerSettingsPort',
	#classTraits : 'EDASCommandListenerSettingsPort classTrait',
	#instVars : [
		'topicListener',
		'prefetchCount',
		'ack',
		'queue'
	],
	#category : #'EDAS-Settings-Adapters-InMemory'
}

{ #category : #testing }
EDASStompCommandListenerSettingsInMemoryAdapter class >> accepts: aPort [

	^ aPort = EDASCommandListenerSettingsPort
]

{ #category : #metadata }
EDASStompCommandListenerSettingsInMemoryAdapter class >> description [

	^ #'pharoeda.settings.adapters.command_listener.stomp.description'
]

{ #category : #metadata }
EDASStompCommandListenerSettingsInMemoryAdapter class >> label [

	^ #'pharoeda.settings.adapters.command_listener.stomp.label'
]

{ #category : #metadata }
EDASStompCommandListenerSettingsInMemoryAdapter class >> portLabel [

	^ #'pharoeda.settings.ports.command_listener.stomp.label'
]

{ #category : #accessing }
EDASStompCommandListenerSettingsInMemoryAdapter class >> priority [
	^ 0
]

{ #category : #accessing }
EDASStompCommandListenerSettingsInMemoryAdapter >> ack [

	<edaSettings:
	#'pharoeda.settings.adapters.command_listener.stomp.ack.label'
	withDescription:
	#'pharoeda.settings.adapters.command_listener.stomp.ack.description'
	icon: #ack atPosition: 12 readOnly: false multiple: true>
	^ ack ifNil: [ #auto ]
]

{ #category : #accessing }
EDASStompCommandListenerSettingsInMemoryAdapter >> ack: val [
	self assert: (#(#auto #client #'client-individual') includes: val).
	ack := val
]

{ #category : #resolving }
EDASStompCommandListenerSettingsInMemoryAdapter >> availableErrorStrategies [

	^ super availableErrorStrategies
]

{ #category : #accessing }
EDASStompCommandListenerSettingsInMemoryAdapter >> commandListener [

	^ self
]

{ #category : #accessing }
EDASStompCommandListenerSettingsInMemoryAdapter >> destination [
	^ '/amq/queue/' , self queue
]

{ #category : #accessing }
EDASStompCommandListenerSettingsInMemoryAdapter >> errorStrategy [

	^ super errorStrategy
]

{ #category : #accessing }
EDASStompCommandListenerSettingsInMemoryAdapter >> port [

	^ super port
]

{ #category : #accessing }
EDASStompCommandListenerSettingsInMemoryAdapter >> prefetchCount [

	<edaSettings:
	#'pharoeda.settings.adapters.command_listener.stomp.prefetchCount.label'
	withDescription:
	#'pharoeda.settings.adapters.command_listener.stomp.prefetchCount.description'
	icon: #prefetchcount atPosition: 7 readOnly: false multiple: false>
	^ prefetchCount ifNil: [ 1 ]
]

{ #category : #accessing }
EDASStompCommandListenerSettingsInMemoryAdapter >> prefetchCount: val [
	prefetchCount := val
]

{ #category : #accessing }
EDASStompCommandListenerSettingsInMemoryAdapter >> queue [

	<edaSettings:
	#'pharoeda.settings.adapters.command_listener.stomp.queue.label'
	withDescription:
	#'pharoeda.settings.adapters.command_listener.stomp.queue.description'
	icon: #queue atPosition: 5 readOnly: false multiple: false>
	^ queue ifNil: [ '' ]
]

{ #category : #accessing }
EDASStompCommandListenerSettingsInMemoryAdapter >> queue: val [
	queue := val
]

{ #category : #accessing }
EDASStompCommandListenerSettingsInMemoryAdapter >> restartOnErrors [

	^ super restartOnErrors
]

{ #category : #accessing }
EDASStompCommandListenerSettingsInMemoryAdapter >> topicListener [

	^ topicListener ifNil: [ self topicListener: (EDAACommandStompTopicListener withConfig: self). topicListener  ]
]

{ #category : #accessing }
EDASStompCommandListenerSettingsInMemoryAdapter >> topicListener: anObject [

	topicListener := anObject
]

{ #category : #resolving }
EDASStompCommandListenerSettingsInMemoryAdapter >> values: aSymbol [

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
