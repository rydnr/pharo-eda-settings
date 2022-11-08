Trait {
	#name : #EDASStompSettingsPort,
	#category : #'EDAS-Settings-Ports'
}

{ #category : #resolving }
EDASStompSettingsPort classSide >> availableErrorStrategies [

	^ EDAEErrorHandlingStrategy subclasses collect: [ :s | 
		  s description translated -> s name ]
]

{ #category : #resolving }
EDASStompSettingsPort >> availableErrorStrategies [

	^ self class availableErrorStrategies
]

{ #category : #resolving }
EDASStompSettingsPort >> debug [

	<edaSettings:
	#'pharoeda.settings.adapters.stomp.debug.label'
	withDescription:
	#'pharoeda.settings.adapters.stomp.debug.description'
	icon: #debug atPosition: 9 readOnly: false multiple: false>
	self shouldBeImplemented
]

{ #category : #resolving }
EDASStompSettingsPort >> durable [

	<edaSettings:
	#'pharoeda.settings.adapters.stomp.durable.label'
	withDescription:
	#'pharoeda.settings.adapters.stomp.durable.description'
	icon: #durable atPosition: 8 readOnly: false multiple: false>
	self shouldBeImplemented
]

{ #category : #resolving }
EDASStompSettingsPort >> errorStrategyName [

	<edaSettings:
	#'pharoeda.settings.adapters.command_listener.stomp.errorStrategyName.label'
	withDescription:
	#'pharoeda.settings.adapters.command_listener.stomp.errorStrategyName.description'
	icon: #errorstrategy atPosition: 11 readOnly: false multiple: true>
	self shouldBeImplemented
]

{ #category : #resolving }
EDASStompSettingsPort >> host [

	<edaSettings:
	#'pharoeda.settings.adapters.stomp.host.label'
	withDescription:
	#'pharoeda.settings.adapters.stomp.host.description'
	icon: #host atPosition: 1 readOnly: false multiple: false>
	self shouldBeImplemented
]

{ #category : #resolving }
EDASStompSettingsPort >> password [

	<edaSettings:
	#'pharoeda.settings.adapters.stomp.password.label'
	withDescription:
	#'pharoeda.settings.adapters.stomp.password.description'
	icon: #password atPosition: 4 readOnly: false multiple: false>
	self shouldBeImplemented
]

{ #category : #resolving }
EDASStompSettingsPort >> port [

	<edaSettings:
	#'pharoeda.settings.adapters.stomp.port.label'
	withDescription:
	#'pharoeda.settings.adapters.stomp.port.description'
	icon: #port atPosition: 2 readOnly: false multiple: false>
	self shouldBeImplemented
]

{ #category : #resolving }
EDASStompSettingsPort >> restartOnErrors [

	<edaSettings:
	#'pharoeda.settings.adapters.stomp.restartOnErrors.label'
	withDescription:
	#'pharoeda.settings.adapters.stomp.restartOnErrors.description'
	icon: #restartonerrors atPosition: 10 readOnly: false multiple: false>
	self shouldBeImplemented
]

{ #category : #resolving }
EDASStompSettingsPort >> timeout [

	<edaSettings: #'pharoeda.settings.adapters.stomp.timeout.label'
	withDescription:
	#'pharoeda.settings.adapters.stomp.timeout.description' icon:
	#timeout atPosition: 6 readOnly: false multiple: false>
	self shouldBeImplemented
]

{ #category : #resolving }
EDASStompSettingsPort >> user [

	<edaSettings:
	#'pharoeda.settings.adapters.stomp.user.label'
	withDescription:
	#'pharoeda.settings.adapters.stomp.user.description'
	icon: #user atPosition: 3 readOnly: false multiple: false>
	self shouldBeImplemented
]

{ #category : #resolving }
EDASStompSettingsPort >> values: aSymbol [

	^ aSymbol = #errorStrategyName
		ifTrue: [ self availableErrorStrategies ]
		ifFalse: [ OrderedCollection new ]
]
