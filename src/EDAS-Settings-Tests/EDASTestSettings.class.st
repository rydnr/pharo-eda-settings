"
Class: EDATestSettings 

Adds some explicit configuration settings for integration tests.

Responsibility:

Creates a new menu to explicitly configure test-specific settings.
"
Class {
	#name : #EDASTestSettings,
	#superclass : #EDASSettings,
	#category : #'EDAS-Settings-Tests'
}

{ #category : #settings }
EDASTestSettings class >> commandPublisherSettingsOn: aBuilder [
	(aBuilder group: #testCommandPublisher)
		label: 'Command Publisher' translated;
		description: 'Command Publisher (for integration tests)' translated;
		parent: #edatests.

	^ self stompPublisherSettingsOn: aBuilder withConfig: EDACommandStompTopicPublisher under: #testCommandPublisher populatedWithValuesFrom: 'testCommandPublisher'
		
]

{ #category : #initialization }
EDASTestSettings class >> doInitialize [
	self duEnvironmentClass: EDATestDUEnvironment
]

{ #category : #settings }
EDASTestSettings class >> edaTestSettingsOn: aBuilder [
	"<systemsettings>"
	(aBuilder group: #edatests)
		label: 'EDA Tests' translated;
		description: 'EDA tests';
		noOrdering;
		parent: #eda.
	self commandPublisherSettingsOn: aBuilder.
	self eventListenerSettingsOn: aBuilder.
	self queueCleaningSettingsOn: aBuilder
]

{ #category : #settings }
EDASTestSettings class >> eventListenerSettingsOn: aBuilder [
	(aBuilder group: #testEventListener)
		label: 'Event Listener' translated;
		description: 'Event Listener (for integration tests)' translated;
		parent: #edatests.
	^ self
		stompListenerSettingsOn: aBuilder
		withConfig: EDATestEventStompTopicListener
		under: #testEventListener
		populatedWithValuesFrom: 'testEventListener'
]

{ #category : #initialization }
EDASTestSettings class >> initialize [
	self doInitialize 
]

{ #category : #settings }
EDASTestSettings class >> queueCleanerSettingsOn: aBuilder withConfig: container under: parent populatedWithValuesFrom: config [
	(aBuilder setting: #host)
		parent: parent;
		target: container;
		label: 'RabbitMQ host' translated;
		description: 'RabbitMQ host address';
		order: 1;
		default: (config at: 'host' ifAbsent: 'localhost').
	(aBuilder setting: #port)
		parent: parent;
		target: container;
		label: 'RabbitMQ HTTP port' translated;
		description: 'RabbitMQ HTTP port';
		default: (config at: 'httpPort' ifAbsent: 15672).
	(aBuilder setting: #username)
		parent: parent;
		target: container;
		label: 'RabbitMQ user' translated;
		description: 'RabbitMQ admin username';
		default: (config at: 'user' ifAbsent: 'admin').
	(aBuilder setting: #password)
		parent: parent;
		target: container;
		label: 'RabbitMQ password' translated;
		description: 'RabbitMQ admin password';
		default: (config at: 'password' ifAbsent: 'secret')
]

{ #category : #settings }
EDASTestSettings class >> queueCleaningSettingsOn: aBuilder [
	| extSettings |
	(aBuilder group: #testQueueCleaning)
		label: 'Queue cleaning' translated;
		description: 'Queue cleaning (for integration tests)' translated;
		parent: #edatests.
	extSettings := self retrieveSettingAsDict: 'queueCleaner'.
	^ self
		queueCleanerSettingsOn: aBuilder
		withConfig: EDAQueueCleaner
		under: #testQueueCleaning
		populatedWithValuesFrom: extSettings
]
