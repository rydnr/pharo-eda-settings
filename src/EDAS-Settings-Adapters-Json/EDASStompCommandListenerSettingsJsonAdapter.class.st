Class {
	#name : #EDASStompCommandListenerSettingsJsonAdapter,
	#superclass : #Object,
	#traits : 'EDASSettingsPort + EDASStompSettingsJsonAdapter + EDASCommandListenerSettingsPort + EDASStompSettingsPort',
	#classTraits : 'EDASSettingsPort classTrait + EDASStompSettingsJsonAdapter classTrait + EDASCommandListenerSettingsPort classTrait + EDASStompSettingsPort classTrait',
	#instVars : [
		'host',
		'port',
		'user',
		'password',
		'timeout',
		'debug',
		'durable',
		'restartOnErrors',
		'errorStrategyName',
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

{ #category : #'instance creation' }
EDASStompCommandListenerSettingsJsonAdapter class >> fromFile: aFileReference withApp: anEDAApplication [

	^ self
		  fromFile: aFileReference
		  under: 'commandListener'
		  withApp: anEDAApplication
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

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> debug [

	<edaSettings: #'pharoeda.settings.adapters.stomp.debug.label'
	withDescription:
	#'pharoeda.settings.adapters.stomp.debug.description' icon: #debug
	atPosition: 9 readOnly: false multiple: false>
	^ debug
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> debug: anObject [

	debug := anObject
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> durable [

	<edaSettings: #'pharoeda.settings.adapters.stomp.durable.label'
	withDescription:
	#'pharoeda.settings.adapters.stomp.durable.description' icon:
	#durable atPosition: 8 readOnly: false multiple: false>
	^ durable
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> durable: anObject [

	durable := anObject
]

{ #category : #metadata }
EDASStompCommandListenerSettingsJsonAdapter >> edaPort [
	
	"This is used by the settings framework to be able to select the STOMP adapter in the available ports.
	This adapter is not selectable (#accepts: returns false). It's only used when the environment value matches any of the json files.
	Take a look at EDASEnvironmentSwitchesToCommandListenerJsonAdapter"
	^ EDASStompCommandListenerSettingsInMemoryAdapter
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> errorStrategyName [

	<edaSettings:
	#'pharoeda.settings.adapters.stomp.errorStrategyName.label'
	withDescription:
	#'pharoeda.settings.adapters.stomp.errorStrategyName.description'
	icon: #errorstrategy atPosition: 11 readOnly: false multiple: true>
	^ errorStrategyName
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> errorStrategyName: anObject [

	errorStrategyName := anObject
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> host [

	<edaSettings: #'pharoeda.settings.adapters.stomp.host.label'
	withDescription: #'pharoeda.settings.adapters.stomp.host.description'
	icon: #host atPosition: 1 readOnly: false multiple: false>
	^ host
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> host: anObject [

	host := anObject
]

{ #category : #testing }
EDASStompCommandListenerSettingsJsonAdapter >> isReadOnly: aString [

	^ true
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> password [

	<edaSettings: #'pharoeda.settings.adapters.stomp.password.label'
	withDescription:
	#'pharoeda.settings.adapters.stomp.password.description' icon:
	#password atPosition: 4 readOnly: false multiple: false>
	^ password
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> password: anObject [

	password := anObject
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> port [

	<edaSettings: #'pharoeda.settings.adapters.stomp.port.label'
	withDescription: #'pharoeda.settings.adapters.stomp.port.description'
	icon: #port atPosition: 2 readOnly: false multiple: false>
	^ port
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> port: anObject [

	port := anObject
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

{ #category : #ambiguous }
EDASStompCommandListenerSettingsJsonAdapter >> restartOnErrors [

	<edaSettings:
	#'pharoeda.settings.adapters.stomp.restartOnErrors.label'
	withDescription:
	#'pharoeda.settings.adapters.stomp.restartOnErrors.description' icon:
	#restartonerrors atPosition: 10 readOnly: false multiple: false>
	^ restartOnErrors
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> restartOnErrors: anObject [

	restartOnErrors := anObject
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> timeout [

	<edaSettings: #'pharoeda.settings.adapters.stomp.timeout.label'
	withDescription:
	#'pharoeda.settings.adapters.stomp.timeout.description' icon:
	#timeout atPosition: 6 readOnly: false multiple: false>
	^ timeout
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> timeout: anObject [

	timeout := anObject
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> user [

	<edaSettings: #'pharoeda.settings.adapters.stomp.user.label'
	withDescription: #'pharoeda.settings.adapters.stomp.user.description'
	icon: #user atPosition: 3 readOnly: false multiple: false>
	^ user
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> user: anObject [

	user := anObject
]

{ #category : #testing }
EDASStompCommandListenerSettingsJsonAdapter >> values: aSymbol [

	aSymbol = #errorStrategyName
		ifTrue: [ ^ self availableErrorStrategies ]
		ifFalse: [ ^ OrderedCollection new ]
]
