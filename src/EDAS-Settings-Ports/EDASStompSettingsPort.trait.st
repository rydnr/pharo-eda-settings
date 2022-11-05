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

	<edaSettings: 'Debug' withDescription: 'Whether to enable debug mode'
	atPosition: 9 readOnly: false multiple: false>
	self shouldBeImplemented
]

{ #category : #resolving }
EDASStompSettingsPort >> durable [

	<edaSettings: 'Durable' withDescription:
	'Whether the topic is durable' atPosition: 8 readOnly: false multiple: false>
	self shouldBeImplemented
]

{ #category : #resolving }
EDASStompSettingsPort >> errorStrategyName [

	<edaSettings: 'Error strategy' withDescription:
	'The strategy to use in case of errors' atPosition: 11 readOnly: false multiple: true>
	self shouldBeImplemented
]

{ #category : #resolving }
EDASStompSettingsPort >> host [

	<edaSettings: 'Host' withDescription: 'The host' atPosition: 1
	readOnly: false multiple: false>
	self shouldBeImplemented
]

{ #category : #resolving }
EDASStompSettingsPort >> password [

	<edaSettings: 'Password' withDescription: 'The password' atPosition:
	4 readOnly: false multiple: false>
	self shouldBeImplemented
]

{ #category : #resolving }
EDASStompSettingsPort >> port [

	<edaSettings: 'Port' withDescription: 'The port' atPosition: 2
	readOnly: false multiple: false>
	self shouldBeImplemented
]

{ #category : #resolving }
EDASStompSettingsPort >> restartOnErrors [

	<edaSettings: 'Restart on errors' withDescription:
	'Whether to restart on errors' atPosition: 10>
	self shouldBeImplemented 
	
]

{ #category : #resolving }
EDASStompSettingsPort >> timeout [

	<edaSettings: 'Timeout' withDescription: 'The timeout' atPosition: 6>
	self shouldBeImplemented 
	
]

{ #category : #resolving }
EDASStompSettingsPort >> user [

	<edaSettings: 'user' withDescription: 'The user' atPosition: 3>
	self shouldBeImplemented 
	
]

{ #category : #resolving }
EDASStompSettingsPort >> values: aSymbol [

	^ aSymbol = #errorStrategyName
		ifTrue: [ self availableErrorStrategies ]
		ifFalse: [ OrderedCollection new ]
]
