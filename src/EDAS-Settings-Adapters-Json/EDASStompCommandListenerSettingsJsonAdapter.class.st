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

	^ EDASStompCommandListenerSettingsInMemoryAdapter description
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

	^ EDASStompCommandListenerSettingsInMemoryAdapter icon
]

{ #category : #testing }
EDASStompCommandListenerSettingsJsonAdapter class >> label [

	^ EDASStompCommandListenerSettingsInMemoryAdapter label
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

	<edaSettings:
	#'pharoeda.settings.adapters.commandListener.stomp.ack.label'
	withDescription:
	#'pharoeda.settings.adapters.commandListener.stomp.ack.description'
	icon: #ack atPosition: 12 readOnly: false multiple: true>
	^ ack ifNil: [ (self values: #ack) first ]
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
	^ debug ifNil: [ true ]
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> durable [

	<edaSettings: #'pharoeda.settings.adapters.stomp.durable.label'
	withDescription:
	#'pharoeda.settings.adapters.stomp.durable.description' icon:
	#durable atPosition: 8 readOnly: false multiple: false>
	^ durable ifNil: [ true ]
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
	^ errorStrategyName ifNil: [ 
		  self errorStrategyName: EDASStompCommandListenerSettingsInMemoryAdapter new
			  errorStrategyName.
			errorStrategyName ]
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> host [

	<edaSettings: #'pharoeda.settings.adapters.stomp.host.label'
	withDescription: #'pharoeda.settings.adapters.stomp.host.description'
	icon: #host atPosition: 1 readOnly: false multiple: false>
	^ host ifNil: [ 'localhost' ]
]

{ #category : #initialization }
EDASStompCommandListenerSettingsJsonAdapter >> initialize [

	super initialize.
	self initErrorStrategies
]

{ #category : #testing }
EDASStompCommandListenerSettingsJsonAdapter >> isReadOnly: aString [

	^ aString ~= 'errorStrategyName'
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> keyIn: aSymbol forValue: aValue [

	^ EDASStompCommandListenerSettingsInMemoryAdapter new keyIn: aSymbol forValue: aValue
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> password [

	<edaSettings: #'pharoeda.settings.adapters.stomp.password.label'
	withDescription:
	#'pharoeda.settings.adapters.stomp.password.description' icon:
	#password atPosition: 4 readOnly: false multiple: false>
	^ password ifNil: [ '' ]
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> port [

	<edaSettings: #'pharoeda.settings.adapters.stomp.port.label'
	withDescription: #'pharoeda.settings.adapters.stomp.port.description'
	icon: #port atPosition: 2 readOnly: false multiple: false>
	^ port ifNil: [ 61613 ]
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> prefetchCount [

	<edaSettings:
	#'pharoeda.settings.adapters.commandListener.stomp.prefetchCount.label'
	withDescription:
	#'pharoeda.settings.adapters.commandListener.stomp.prefetchCount.description'
	icon: #prefetchcount atPosition: 7 readOnly: false multiple: false>
	^ prefetchCount ifNil: [ 1 ]
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> queue [

	<edaSettings:
	#'pharoeda.settings.adapters.commandListener.stomp.queue.label'
	withDescription:
	#'pharoeda.settings.adapters.commandListener.stomp.queue.description'
	icon: #queue atPosition: 5 readOnly: false multiple: false>
	^ queue ifNil: [ '' ]
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
	^ restartOnErrors ifNil: [ self restartOnErrors: true. restartOnErrors ]
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> timeout [

	<edaSettings: #'pharoeda.settings.adapters.stomp.timeout.label'
	withDescription:
	#'pharoeda.settings.adapters.stomp.timeout.description' icon:
	#timeout atPosition: 6 readOnly: false multiple: false>
	^ timeout ifNil: [ 60 ]
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> user [

	<edaSettings: #'pharoeda.settings.adapters.stomp.user.label'
	withDescription: #'pharoeda.settings.adapters.stomp.user.description'
	icon: #user atPosition: 3 readOnly: false multiple: false>
	^ user ifNil: [ '' ]
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> values: aSymbol [

	^ EDASStompCommandListenerSettingsInMemoryAdapter new values: aSymbol
]
