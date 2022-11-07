Trait {
	#name : #EDASStompSettingsPort,
	#category : #'EDAS-Settings-Ports'
}

{ #category : #resolving }
EDASStompSettingsPort classSide >> availableErrorStrategies [

	^ EDAEErrorHandlingStrategy subclasses collect: [ :s | s description -> s name]
]

{ #category : #resolving }
EDASStompSettingsPort >> availableErrorStrategies [

	^ self class availableErrorStrategies
]

{ #category : #resolving }
EDASStompSettingsPort >> debug [

	<edaSettings:
	#'pharoeda.settings.adapters.command_listener.stomp.debug.label'
	withDescription:
	#'pharoeda.settings.adapters.command_listener.stomp.debug.description'
	icon: #debug atPosition: 9 readOnly: false multiple: false>
	self shouldBeImplemented
]

{ #category : #resolving }
EDASStompSettingsPort >> durable [

	<edaSettings:
	#'pharoeda.settings.adapters.command_listener.stomp.durable.label'
	withDescription:
	#'pharoeda.settings.adapters.command_listener.stomp.durable.description'
	icon: #durable atPosition: 8 readOnly: false multiple: false>
	self shouldBeImplemented
]

{ #category : #resolving }
EDASStompSettingsPort >> errorStrategyName [

	<edaSettings:
	#'pharoeda.settings.adapters.command_listener.stomp.errorStrategyName.label'
	withDescription:
	#'pharoeda.settings.adapters.command_listener.stomp.errorStrategyName.description'
	icon: #errorStrategy atPosition: 11 readOnly: false multiple: true>
	self shouldBeImplemented
]

{ #category : #resolving }
EDASStompSettingsPort >> host [

	<edaSettings:
	#'pharoeda.settings.adapters.command_listener.stomp.host.label'
	withDescription:
	#'pharoeda.settings.adapters.command_listener.stomp.host.description' icon:
	#host atPosition: 1 readOnly: false multiple: false>
	self shouldBeImplemented
]

{ #category : #resolving }
EDASStompSettingsPort >> password [

	<edaSettings: #'pharoeda.settings.adapters.command_listener.stomp.password.label' withDescription: #'pharoeda.settings.adapters.command_listener.stomp.password.description' icon:
	#password atPosition: 4 readOnly: false multiple: false>
	self shouldBeImplemented
]

{ #category : #resolving }
EDASStompSettingsPort >> port [

	<edaSettings: #'pharoeda.settings.adapters.command_listener.stomp.port.label' withDescription: #'pharoeda.settings.adapters.command_listener.stomp.port.description' icon: #port
	atPosition: 2 readOnly: false multiple: false>
	self shouldBeImplemented
]

{ #category : #resolving }
EDASStompSettingsPort >> restartOnErrors [

	<edaSettings:
	#'pharoeda.settings.adapters.command_listener.stomp.restartOnErrors.label'
	  withDescription:
	#'pharoeda.settings.adapters.command_listener.stomp.restartOnErrors.description'
 icon: #restartOnErrors atPosition: 10
	readOnly: false multiple: false>
	self shouldBeImplemented
]

{ #category : #resolving }
EDASStompSettingsPort >> timeout [

	<edaSettings:
	#'pharoeda.settings.adapters.command_listener.stomp.timeout.label'	
	  withDescription: 
	#'pharoeda.settings.adapters.command_listener.stomp.timeout.description'	
	icon: #timeout atPosition: 6>
	self shouldBeImplemented
]

{ #category : #resolving }
EDASStompSettingsPort >> user [

	<edaSettings: 
	#'pharoeda.settings.adapters.command_listener.stomp.user.label'	
	 withDescription: 
	#'pharoeda.settings.adapters.command_listener.stomp.user.description'	
	icon: #user
	atPosition: 3 readOnly: false multiple: false>
	self shouldBeImplemented
]

{ #category : #resolving }
EDASStompSettingsPort >> values: aSymbol [

	^ aSymbol = #errorStrategyName
		ifTrue: [ self availableErrorStrategies ]
		ifFalse: [ OrderedCollection new ]
]
