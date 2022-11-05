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
	icon: #glamorousBug atPosition: 9 readOnly: false multiple: false>
	self shouldBeImplemented
]

{ #category : #resolving }
EDASStompSettingsPort >> durable [

	<edaSettings: 'Durable' withDescription:
	'Whether the topic is durable' icon: #glamorousAccept atPosition: 8
	readOnly: false multiple: false>
	self shouldBeImplemented
]

{ #category : #resolving }
EDASStompSettingsPort >> errorStrategyName [

	<edaSettings: 'Error strategy' withDescription:
	'The strategy to use in case of errors' icon: #flag atPosition: 11
	readOnly: false multiple: true>
	self shouldBeImplemented
]

{ #category : #resolving }
EDASStompSettingsPort >> host [

	<edaSettings: 'Host' withDescription: 'The host' icon: #home
	atPosition: 1 readOnly: false multiple: false>
	self shouldBeImplemented
]

{ #category : #resolving }
EDASStompSettingsPort >> password [

	<edaSettings: 'Password' withDescription: 'The password' icon:
	#glamorousExample atPosition: 4 readOnly: false multiple: false>
	self shouldBeImplemented
]

{ #category : #resolving }
EDASStompSettingsPort >> port [

	<edaSettings: 'Port' withDescription: 'The port' icon: #configLoaded
	atPosition: 2 readOnly: false multiple: false>
	self shouldBeImplemented
]

{ #category : #resolving }
EDASStompSettingsPort >> restartOnErrors [

	<edaSettings: 'Restart on errors' withDescription:
	'Whether to restart on errors' icon: #exception atPosition: 10
	readOnly: false multiple: false>
	self shouldBeImplemented
]

{ #category : #resolving }
EDASStompSettingsPort >> timeout [

	<edaSettings: 'Timeout' withDescription: 'The timeout' icon: #smallProfile atPosition: 6>
	self shouldBeImplemented 
	
]

{ #category : #resolving }
EDASStompSettingsPort >> user [

	<edaSettings: 'user' withDescription: 'The user' icon: #user
	atPosition: 3 readOnly: false multiple: false>
	self shouldBeImplemented
]

{ #category : #resolving }
EDASStompSettingsPort >> values: aSymbol [

	^ aSymbol = #errorStrategyName
		ifTrue: [ self availableErrorStrategies ]
		ifFalse: [ OrderedCollection new ]
]
