Class {
	#name : #EDASStompTopicListenerSettingsJsonAdapter,
	#superclass : #Object,
	#traits : 'EDASSettingsPort + EDASStompSettingsPort',
	#classTraits : 'EDASSettingsPort classTrait + EDASStompSettingsPort classTrait',
	#instVars : [
		'host',
		'port',
		'user',
		'password',
		'timeout',
		'queue',
		'prefetchCount',
		'ack',
		'debug',
		'durable',
		'restartOnErrors',
		'errorStrategyName',
		'edaApplication'
	],
	#category : #'EDAS-Settings-Adapters-Json'
}

{ #category : #'instance creation' }
EDASStompTopicListenerSettingsJsonAdapter class >> availableEnvironments [

	| helper |
	helper := EDACSourceCodeHelperStub new.
	^ ((FileSystem workingDirectory / 'config') files
		   select: [ :f | f pathString endsWith: '.json' ]
		   thenCollect: [ :f | 
		   helper replace: '.json' with: '' inString: f asPath basename ])
		  reversed
]

{ #category : #'instance creation' }
EDASStompTopicListenerSettingsJsonAdapter class >> forEnvironment: anEnvironment withApp: anEDAApplication [

	^ self fromFile:
		  FileSystem workingDirectory / 'config' / (anEnvironment , '.json') withApp: anEDAApplication 
]

{ #category : #'instance creation' }
EDASStompTopicListenerSettingsJsonAdapter class >> fromFile: aFileReference withApp: anEDAApplication [

	| result json commandListener |
	result := self withApp: anEDAApplication.
	json := (NeoJSONReader on: aFileReference readStream) next.
	commandListener := json at: 'commandListener'.
	commandListener keysAndValuesDo: [ :k :v | 
		result instVarNamed: k put: v ].
	^ result
]

{ #category : #'instance creation' }
EDASStompTopicListenerSettingsJsonAdapter class >> supportsEnvironment: anEnvironment [

	^ 
		(FileSystem workingDirectory / 'config' / (anEnvironment , '.json')) exists

]

{ #category : #accessing }
EDASStompTopicListenerSettingsJsonAdapter >> ack [

	^ ack
]

{ #category : #accessing }
EDASStompTopicListenerSettingsJsonAdapter >> ack: anObject [

	ack := anObject
]

{ #category : #accessing }
EDASStompTopicListenerSettingsJsonAdapter >> debug [

	<edaSettings: 'Debug' withDescription:'Whether to enable debug mode' atPosition: 9>

	^ debug
]

{ #category : #accessing }
EDASStompTopicListenerSettingsJsonAdapter >> debug: anObject [

	debug := anObject
]

{ #category : #accessing }
EDASStompTopicListenerSettingsJsonAdapter >> durable [

	<edaSettings: 'Durable' withDescription: 'Whether the topic is durable' atPosition: 8>
	^ durable
]

{ #category : #accessing }
EDASStompTopicListenerSettingsJsonAdapter >> durable: anObject [

	durable := anObject
]

{ #category : #accessing }
EDASStompTopicListenerSettingsJsonAdapter >> edaApplication [

	^ edaApplication
]

{ #category : #accessing }
EDASStompTopicListenerSettingsJsonAdapter >> edaApplication: anObject [

	edaApplication := anObject
]

{ #category : #accessing }
EDASStompTopicListenerSettingsJsonAdapter >> errorStrategyName [

	<edaSettings: 'Error strategy' withDescription: 'The strategy to use in case of errors' atPosition:
	11>
	^ errorStrategyName
]

{ #category : #accessing }
EDASStompTopicListenerSettingsJsonAdapter >> errorStrategyName: anObject [

	errorStrategyName := anObject
]

{ #category : #accessing }
EDASStompTopicListenerSettingsJsonAdapter >> host [

	<edaSettings: 'host' withDescription: 'The host' atPosition: 1>
	^ host
]

{ #category : #accessing }
EDASStompTopicListenerSettingsJsonAdapter >> host: anObject [

	host := anObject
]

{ #category : #testing }
EDASStompTopicListenerSettingsJsonAdapter >> isReadOnly: aSymbol [

	^ true
]

{ #category : #accessing }
EDASStompTopicListenerSettingsJsonAdapter >> password [

	<edaSettings: 'password' withDescription: 'The password' atPosition: 4>
	^ password
]

{ #category : #accessing }
EDASStompTopicListenerSettingsJsonAdapter >> password: anObject [

	password := anObject
]

{ #category : #accessing }
EDASStompTopicListenerSettingsJsonAdapter >> port [

	<edaSettings: 'port' withDescription: 'The port' atPosition: 2>
	^ port
]

{ #category : #accessing }
EDASStompTopicListenerSettingsJsonAdapter >> port: anObject [

	port := anObject
]

{ #category : #accessing }
EDASStompTopicListenerSettingsJsonAdapter >> prefetchCount [

	<edaSettings: 'Prefetch count' withDescription: 'The number of messages to prefetch'
	atPosition: 7>
	^ prefetchCount
]

{ #category : #accessing }
EDASStompTopicListenerSettingsJsonAdapter >> prefetchCount: anObject [

	prefetchCount := anObject
]

{ #category : #accessing }
EDASStompTopicListenerSettingsJsonAdapter >> queue [

	<edaSettings: 'queue' withDescription: 'The queue' atPosition: 5>
	^ queue
]

{ #category : #accessing }
EDASStompTopicListenerSettingsJsonAdapter >> queue: anObject [

	queue := anObject
]

{ #category : #accessing }
EDASStompTopicListenerSettingsJsonAdapter >> restartOnErrors [

	<edaSettings: 'Restart on errors' withDescription: 'Whether to restart on errors'
	atPosition: 10>
	^ restartOnErrors ifNil: [ true ]
]

{ #category : #accessing }
EDASStompTopicListenerSettingsJsonAdapter >> restartOnErrors: anObject [

	restartOnErrors := anObject
]

{ #category : #testing }
EDASStompTopicListenerSettingsJsonAdapter >> supportsMultiple: aSymbol [

	^ aSymbol = #errorStrategyName
]

{ #category : #accessing }
EDASStompTopicListenerSettingsJsonAdapter >> timeout [

	<edaSettings: 'Timeout' withDescription: 'The timeout' atPosition: 6>
	^ timeout
]

{ #category : #accessing }
EDASStompTopicListenerSettingsJsonAdapter >> timeout: anObject [

	timeout := anObject
]

{ #category : #accessing }
EDASStompTopicListenerSettingsJsonAdapter >> user [

	<edaSettings: 'user' withDescription: 'The user' atPosition: 3>
	^ user
]

{ #category : #accessing }
EDASStompTopicListenerSettingsJsonAdapter >> user: anObject [

	user := anObject
]

{ #category : #testing }
EDASStompTopicListenerSettingsJsonAdapter >> values: aSymbol [

	aSymbol = #errorStrategyName
		ifTrue: [ ^ self availableErrorStrategies ]
		ifFalse: [ ^ OrderedCollection new ]
]
