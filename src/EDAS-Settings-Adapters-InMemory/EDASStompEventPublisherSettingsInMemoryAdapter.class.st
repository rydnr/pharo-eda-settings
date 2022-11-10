Class {
	#name : #EDASStompEventPublisherSettingsInMemoryAdapter,
	#superclass : #EDASStompSettingsInMemoryAdapter,
	#traits : 'EDASEventPublisherSettingsPort',
	#classTraits : 'EDASEventPublisherSettingsPort classTrait',
	#instVars : [
		'errorExchange',
		'errorRoutingKey',
		'exchange',
		'routingKey'
	],
	#category : #'EDAS-Settings-Adapters-InMemory'
}

{ #category : #testing }
EDASStompEventPublisherSettingsInMemoryAdapter class >> accepts: aPort [

	^ true
]

{ #category : #accessing }
EDASStompEventPublisherSettingsInMemoryAdapter class >> description [

	^ #'pharoeda.settings.adapters.eventPublisher.stomp.description'
]

{ #category : #testing }
EDASStompEventPublisherSettingsInMemoryAdapter class >> label [

	^ #'pharoeda.settings.adapters.eventPublisher.stomp.label'
]

{ #category : #metadata }
EDASStompEventPublisherSettingsInMemoryAdapter class >> portLabel [

	^ #'pharoeda.settings.ports.eventPublisher.stomp.label'
]

{ #category : #accessing }
EDASStompEventPublisherSettingsInMemoryAdapter class >> priority [
	^ 0
]

{ #category : #accessing }
EDASStompEventPublisherSettingsInMemoryAdapter >> debug [

	<edaSettings: #'pharoeda.settings.adapters.stomp.debug.label'
	withDescription:
	#'pharoeda.settings.adapters.stomp.debug.description' icon: #debug
	atPosition: 9 readOnly: false multiple: false>
	^ super debug
]

{ #category : #'class initialization' }
EDASStompEventPublisherSettingsInMemoryAdapter >> doInitialize [
	super doInitialize.
	self exchange: nil.
	self routingKey: nil.
	self durable: true
]

{ #category : #accessing }
EDASStompEventPublisherSettingsInMemoryAdapter >> durable [

	<edaSettings: #'pharoeda.settings.adapters.stomp.durable.label'
	withDescription:
	#'pharoeda.settings.adapters.stomp.durable.description' icon:
	#durable atPosition: 8 readOnly: false multiple: false>
	^ super durable
]

{ #category : #accessing }
EDASStompEventPublisherSettingsInMemoryAdapter >> errorExchange [

	<edaSettings:
	#'pharoeda.settings.adapters.eventPublisher.stomp.errorExchange.label'
	withDescription:
	#'pharoeda.settings.adapters.eventPublisher.stomp.errorExchange.description'
	icon: #errorexchange atPosition: 12 readOnly: false multiple: false>
	^ errorExchange ifNil: [ '' ]
]

{ #category : #accessing }
EDASStompEventPublisherSettingsInMemoryAdapter >> errorExchange: aString [
	errorExchange := aString
]

{ #category : #accessing }
EDASStompEventPublisherSettingsInMemoryAdapter >> errorRoutingKey [

	<edaSettings:
	#'pharoeda.settings.adapters.eventPublisher.stomp.errorRoutingKey.label'
	withDescription:
	#'pharoeda.settings.adapters.eventPublisher.stomp.errorRoutingKey.description'
	icon: #errorroutingkey atPosition: 13 readOnly: false multiple: false>
	^ errorRoutingKey ifNil: [ '#' ]
]

{ #category : #accessing }
EDASStompEventPublisherSettingsInMemoryAdapter >> errorRoutingKey: val [
	errorRoutingKey := val
]

{ #category : #accessing }
EDASStompEventPublisherSettingsInMemoryAdapter >> errorStrategy [

	^ super errorStrategy
]

{ #category : #accessing }
EDASStompEventPublisherSettingsInMemoryAdapter >> errorStrategyName [

	<edaSettings:
	#'pharoeda.settings.adapters.stomp.errorStrategyName.label'
	withDescription:
	#'pharoeda.settings.adapters.stomp.errorStrategyName.description'
	icon: #errorstrategy atPosition: 11 readOnly: false multiple: true>
	^ super errorStrategyName
]

{ #category : #accessing }
EDASStompEventPublisherSettingsInMemoryAdapter >> exchange [

	<edaSettings:
	
		#'pharoeda.settings.adapters.eventPublisher.stomp.exchange.label'
	withDescription:
	#'pharoeda.settings.adapters.eventPublisher.stomp.exchange.description'

	icon: #exchange atPosition: 5 readOnly: false multiple: false>
	^ exchange ifNil: [ '' ]
]

{ #category : #accessing }
EDASStompEventPublisherSettingsInMemoryAdapter >> exchange: val [
	exchange := val
]

{ #category : #accessing }
EDASStompEventPublisherSettingsInMemoryAdapter >> host [

	<edaSettings: #'pharoeda.settings.adapters.stomp.host.label'
	withDescription: #'pharoeda.settings.adapters.stomp.host.description'
	icon: #host atPosition: 1 readOnly: false multiple: false>
	^ super host
]

{ #category : #accessing }
EDASStompEventPublisherSettingsInMemoryAdapter >> password [

	<edaSettings: #'pharoeda.settings.adapters.stomp.password.label'
	withDescription:
	#'pharoeda.settings.adapters.stomp.password.description' icon:
	#password atPosition: 4 readOnly: false multiple: false>
	^ super password
]

{ #category : #accessing }
EDASStompEventPublisherSettingsInMemoryAdapter >> port [

	<edaSettings: #'pharoeda.settings.adapters.stomp.port.label'
	withDescription: #'pharoeda.settings.adapters.stomp.port.description'
	icon: #port atPosition: 2 readOnly: false multiple: false>
	^ super port
]

{ #category : #accessing }
EDASStompEventPublisherSettingsInMemoryAdapter >> restartOnErrors [

	<edaSettings:
	#'pharoeda.settings.adapters.stomp.restartOnErrors.label'
	withDescription:
	#'pharoeda.settings.adapters.stomp.restartOnErrors.description' icon:
	#restartonerrors atPosition: 10 readOnly: false multiple: false>
	^ super restartOnErrors
]

{ #category : #accessing }
EDASStompEventPublisherSettingsInMemoryAdapter >> routingKey [

	<edaSettings:
	#'pharoeda.settings.adapters.eventPublisher.stomp.routingKey.label'
	withDescription:
	#'pharoeda.settings.adapters.eventPublisher.stomp.routingKey.description'
	icon: #routingkey atPosition: 6 readOnly: false multiple: false>
	^ routingKey ifNil: [ '#' ]
]

{ #category : #accessing }
EDASStompEventPublisherSettingsInMemoryAdapter >> routingKey: val [
	routingKey := val
]

{ #category : #accessing }
EDASStompEventPublisherSettingsInMemoryAdapter >> timeout [

	<edaSettings: #'pharoeda.settings.adapters.stomp.timeout.label'
	withDescription:
	#'pharoeda.settings.adapters.stomp.timeout.description' icon:
	#timeout atPosition: 6 readOnly: false multiple: false>
	^ super timeout
]

{ #category : #accessing }
EDASStompEventPublisherSettingsInMemoryAdapter >> user [

	<edaSettings: #'pharoeda.settings.adapters.stomp.user.label'
	withDescription: #'pharoeda.settings.adapters.stomp.user.description'
	icon: #user atPosition: 3 readOnly: false multiple: false>
	^ super user
]
