Trait {
	#name : #EDASStompSettingsPort,
	#traits : 'EDASSettingsPort',
	#classTraits : 'EDASSettingsPort classTrait',
	#category : #'EDAS-Settings-Ports'
}

{ #category : #resolving }
EDASStompSettingsPort classSide >> availableErrorStrategies [

	^ EDAEErrorHandlingStrategy subclasses collect: [ :s | s name ]
]

{ #category : #resolving }
EDASStompSettingsPort >> ack [

	<edaSettings: 'Ack' withDescription:
	'The ACK mode' atPosition: 12>
	self shouldBeImplemented
]

{ #category : #resolving }
EDASStompSettingsPort >> availableErrorStrategies [

	^ self class availableErrorStrategies
]

{ #category : #resolving }
EDASStompSettingsPort >> debug [

	<edaSettings: 'Debug' withDescription: 'Whether to enable debug mode'
	atPosition: 9>
	self shouldBeImplemented
]

{ #category : #resolving }
EDASStompSettingsPort >> durable [

	<edaSettings: 'Durable' withDescription:
	'Whether the topic is durable' atPosition: 8>
	self shouldBeImplemented
]

{ #category : #resolving }
EDASStompSettingsPort >> errorStrategyName [
	<edaSettings: 'Error strategy' withDescription:
	'The strategy to use in case of errors' atPosition: 11>
	self shouldBeImplemented
]

{ #category : #resolving }
EDASStompSettingsPort >> host [
	<edaSettings: 'host' withDescription: 'The host' atPosition: 1>
	self shouldBeImplemented
]

{ #category : #resolving }
EDASStompSettingsPort >> password [

	<edaSettings: 'password' withDescription: 'The password' atPosition:
	4>
	self shouldBeImplemented
]

{ #category : #resolving }
EDASStompSettingsPort >> port [

	<edaSettings: 'port' withDescription: 'The port' atPosition: 2>
	self shouldBeImplemented
]

{ #category : #resolving }
EDASStompSettingsPort >> prefetchCount [

	<edaSettings: 'Prefetch count' withDescription:
	'The number of messages to prefetch' atPosition: 7>
	self shouldBeImplemented 
	
]

{ #category : #resolving }
EDASStompSettingsPort >> queue [

	<edaSettings: 'queue' withDescription: 'The queue' atPosition: 5>
	self shouldBeImplemented 
	
]

{ #category : #resolving }
EDASStompSettingsPort >> restartOnErrors [

	<edaSettings: 'Restart on errors' withDescription:
	'Whether to restart on errors' atPosition: 10>
	self shouldBeImplemented 
	
]

{ #category : #testing }
EDASStompSettingsPort >> supportsMultiple: aSymbol [

	^ aSymbol = #errorStrategy or: [ aSymbol = #ack ]
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

	aSymbol = #errorStrategyName
		ifTrue: [ ^ self availableErrorStrategies ]
		ifFalse: [ aSymbol = #ack ifTrue: [ ^ OrderedCollection with: #'client-individual' with: #auto ] ifFalse: [ ^ OrderedCollection new ] ]
]
