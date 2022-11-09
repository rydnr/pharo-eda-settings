Class {
	#name : #EDASStompCommandListenerSettingsJsonAdapter,
	#superclass : #Object,
	#traits : 'EDASSettingsPort + EDASStompSettingsJsonAdapter + EDASCommandListenerSettingsPort',
	#classTraits : 'EDASSettingsPort classTrait + EDASStompSettingsJsonAdapter classTrait + EDASCommandListenerSettingsPort classTrait',
	#instVars : [
		'queue',
		'prefetchCount',
		'ack'
	],
	#category : #'EDAS-Settings-Adapters-Json'
}

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter class >> changedEventName [

	^ EDASStompCommandListenerSettingsInMemoryAdapter
		  changedEventName
]

{ #category : #testing }
EDASStompCommandListenerSettingsJsonAdapter class >> description [

	^ #'pharoeda.settings.adapters.command_listener.stomp.json.description'
]

{ #category : #testing }
EDASStompCommandListenerSettingsJsonAdapter class >> edaPort [

	"This gets called in EDASSettings when selecting the port, so it gets selected correctly"

	^ EDASStompCommandListenerSettingsInMemoryAdapter
]

{ #category : #testing }
EDASStompCommandListenerSettingsJsonAdapter class >> icon [

	^ EDACIconProvider new iconNamed: #commandlistener orElse: #comments
]

{ #category : #testing }
EDASStompCommandListenerSettingsJsonAdapter class >> label [

	^ #'pharoeda.settings.adapters.command_listener.stomp.label'
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter class >> portChangedEventName [

	^ EDASStompCommandListenerSettingsInMemoryAdapter portChangedEventName
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter class >> portLabel [

	^ EDASStompCommandListenerSettingsInMemoryAdapter
		  portLabel
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> ack [

	^ ack
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> ack: anObject [

	ack := anObject
]

{ #category : #metadata }
EDASStompCommandListenerSettingsJsonAdapter >> edaPort [
	
	"This is used by the settings framework to be able to select the STOMP adapter in the available ports.
	This adapter is not selectable (#accepts: returns false). It's only used when the environment value matches any of the json files.
	Take a look at EDASEnvironmentSwitchesToCommandListenerJsonAdapter"
	^ EDASStompCommandListenerSettingsInMemoryAdapter
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> prefetchCount [

	^ prefetchCount
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> prefetchCount: anObject [

	prefetchCount := anObject
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> queue [

	^ queue
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> queue: anObject [

	queue := anObject
]

{ #category : #testing }
EDASStompCommandListenerSettingsJsonAdapter >> values: aSymbol [

	aSymbol = #errorStrategyName
		ifTrue: [ ^ self availableErrorStrategies ]
		ifFalse: [ ^ OrderedCollection new ]
]
