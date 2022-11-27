Class {
	#name : #EDASStompCommandListenerSettingsInMemoryAdapter,
	#superclass : #EDASStompSettingsInMemoryAdapter,
	#traits : 'EDASCommandListenerSettingsPort',
	#classTraits : 'EDASCommandListenerSettingsPort classTrait',
	#instVars : [
		'topicListener',
		'prefetchCount',
		'ack',
		'queue',
		'ackDict',
		'ackReverseDict'
	],
	#category : #'EDAS-Settings-Adapters-InMemory'
}

{ #category : #helpers }
EDASStompCommandListenerSettingsInMemoryAdapter class >> accepts: aPort inApp: anEDAApplication [

	^ aPort = EDASCommandListenerSettingsPort
]

{ #category : #metadata }
EDASStompCommandListenerSettingsInMemoryAdapter class >> description [

	^ #'pharoeda.settings.adapters.commandListener.stomp.description'
]

{ #category : #metadata }
EDASStompCommandListenerSettingsInMemoryAdapter class >> icon [

	^ EDACIconProvider new iconNamed: #commandlistener orElse: #comments
]

{ #category : #metadata }
EDASStompCommandListenerSettingsInMemoryAdapter class >> label [

	^ #'pharoeda.settings.adapters.commandListener.stomp.label'
]

{ #category : #metadata }
EDASStompCommandListenerSettingsInMemoryAdapter class >> portLabel [

	^ #'pharoeda.settings.ports.commandListener.stomp.label'
]

{ #category : #accessing }
EDASStompCommandListenerSettingsInMemoryAdapter class >> priority [
	^ 0
]

{ #category : #accessing }
EDASStompCommandListenerSettingsInMemoryAdapter >> ack [

	<edaSettings:
	#'pharoeda.settings.adapters.commandListener.stomp.ack.label'
	withDescription:
	#'pharoeda.settings.adapters.commandListener.stomp.ack.description'
	icon: #ack atPosition: 12 readOnly: false multiple: true>
	^ ack ifNil: [ (self values: #ack) first value ]
]

{ #category : #accessing }
EDASStompCommandListenerSettingsInMemoryAdapter >> ack: val [
	self assert: (#(#auto #client #'client-individual') includes: val).
	ack := val
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
EDASStompCommandListenerSettingsInMemoryAdapter >> description [

	^ #'pharoeda.settings.adapters.commandListener.stomp.json.description'

]

{ #category : #accessing }
EDASStompCommandListenerSettingsInMemoryAdapter >> destination [
	^ '/amq/queue/' , self queue
]

{ #category : #'class initialization' }
EDASStompCommandListenerSettingsInMemoryAdapter >> doInitialize [

	super doInitialize.
	self queue: nil.
	self prefetchCount: 1.
	ackDict := Dictionary new.
	ackDict
		           at:
			           #'pharoeda.settings.adapters.commandListener.stomp.ack.client-individual'
		           put: #'client-individual';
		           at:
			           #'pharoeda.settings.adapters.commandListener.stomp.ack.client'
		           put: #client;
		           at:
			           #'pharoeda.settings.adapters.commandListener.stomp.ack.auto'
		           put: #auto.
	ackReverseDict := Dictionary new.
	ackDict keysAndValuesDo: [ :k :v | ackReverseDict at: v put: k ]
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
EDASStompCommandListenerSettingsInMemoryAdapter >> keyIn: aSymbol forValue: value [

	^ aSymbol = #ack
		  ifTrue: [ ackReverseDict at: value ]
		  ifFalse: [ super keyIn: aSymbol forValue: value ]
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
	#'pharoeda.settings.adapters.commandListener.stomp.prefetchCount.label'
	withDescription:
	#'pharoeda.settings.adapters.commandListener.stomp.prefetchCount.description'
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
	#'pharoeda.settings.adapters.commandListener.stomp.queue.label'
	withDescription:
	#'pharoeda.settings.adapters.commandListener.stomp.queue.description'
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

	^ topicListener ifNil: [ self topicListener: (EDAACommandStompTopicListener withConfig: self forApplication: self edaApplication). topicListener  ]
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

{ #category : #accessing }
EDASStompCommandListenerSettingsInMemoryAdapter >> values: aSymbol [

	^ aSymbol = #ack
		  ifTrue: [ ackDict associations collect: [ :e | e key translated -> e value ] ]
		  ifFalse: [ super values: aSymbol ]
]
