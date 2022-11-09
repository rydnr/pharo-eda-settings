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
EDASStompCommandListenerSettingsInMemoryAdapter >> debug [

	<edaSettings: #'pharoeda.settings.adapters.stomp.debug.label'
	withDescription:
	#'pharoeda.settings.adapters.stomp.debug.description' icon: #debug
	atPosition: 9 readOnly: false multiple: false>
	^ super debug
]

{ #category : #accessing }
EDASStompCommandListenerSettingsInMemoryAdapter >> destination [
	^ '/amq/queue/' , self queue
]

{ #category : #'class initialization' }
EDASStompCommandListenerSettingsInMemoryAdapter >> doInitialize [
	super doInitialize.
	self queue: nil.
	self prefetchCount: nil.
	self durable: true.
	self ack: #'client-individual'
]

{ #category : #accessing }
EDASStompCommandListenerSettingsInMemoryAdapter >> durable [

	<edaSettings: #'pharoeda.settings.adapters.stomp.durable.label'
	withDescription:
	#'pharoeda.settings.adapters.stomp.durable.description' icon:
	#durable atPosition: 8 readOnly: false multiple: false>
	^ super durable
]

{ #category : #accessing }
EDASStompCommandListenerSettingsInMemoryAdapter >> errorStrategy [

	^ super errorStrategy
]

{ #category : #accessing }
EDASStompCommandListenerSettingsInMemoryAdapter >> errorStrategyName [

	<edaSettings:
	#'pharoeda.settings.adapters.stomp.errorStrategyName.label'
	withDescription:
	#'pharoeda.settings.adapters.stomp.errorStrategyName.description'
	icon: #errorstrategy atPosition: 11 readOnly: false multiple: true>
	^ super errorStrategyName
]

{ #category : #accessing }
EDASStompCommandListenerSettingsInMemoryAdapter >> host [

	<edaSettings: #'pharoeda.settings.adapters.stomp.host.label'
	withDescription: #'pharoeda.settings.adapters.stomp.host.description'
	icon: #host atPosition: 1 readOnly: false multiple: false>
	^ super host
]

{ #category : #'class initialization' }
EDASStompCommandListenerSettingsInMemoryAdapter >> initialize [
	super initialize.
	self doInitialize
]

{ #category : #accessing }
EDASStompCommandListenerSettingsInMemoryAdapter >> password [

	<edaSettings: #'pharoeda.settings.adapters.stomp.password.label'
	withDescription:
	#'pharoeda.settings.adapters.stomp.password.description' icon:
	#password atPosition: 4 readOnly: false multiple: false>
	^ super password
]

{ #category : #accessing }
EDASStompCommandListenerSettingsInMemoryAdapter >> port [

	<edaSettings: #'pharoeda.settings.adapters.stomp.port.label'
	withDescription: #'pharoeda.settings.adapters.stomp.port.description'
	icon: #port atPosition: 2 readOnly: false multiple: false>
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

	<edaSettings:
	#'pharoeda.settings.adapters.stomp.restartOnErrors.label'
	withDescription:
	#'pharoeda.settings.adapters.stomp.restartOnErrors.description' icon:
	#restartonerrors atPosition: 10 readOnly: false multiple: false>
	^ super restartOnErrors
]

{ #category : #accessing }
EDASStompCommandListenerSettingsInMemoryAdapter >> timeout [

	<edaSettings: #'pharoeda.settings.adapters.stomp.timeout.label'
	withDescription:
	#'pharoeda.settings.adapters.stomp.timeout.description' icon:
	#timeout atPosition: 6 readOnly: false multiple: false>
	^ super timeout
]

{ #category : #accessing }
EDASStompCommandListenerSettingsInMemoryAdapter >> topicListener [

	^ topicListener ifNil: [ self topicListener: (EDAACommandStompTopicListener withConfig: self). topicListener  ]
]

{ #category : #accessing }
EDASStompCommandListenerSettingsInMemoryAdapter >> topicListener: anObject [

	topicListener := anObject
]

{ #category : #accessing }
EDASStompCommandListenerSettingsInMemoryAdapter >> user [

	<edaSettings: #'pharoeda.settings.adapters.stomp.user.label'
	withDescription: #'pharoeda.settings.adapters.stomp.user.description'
	icon: #user atPosition: 3 readOnly: false multiple: false>
	^ super user
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
