Class {
	#name : #EDASStompTopicListenerSettingsJsonAdapter,
	#superclass : #Object,
	#traits : 'EDASSettingsPort + EDASStompSettingsPort + EDASCommandListenerSettingsPort',
	#classTraits : 'EDASSettingsPort classTrait + EDASStompSettingsPort classTrait + EDASCommandListenerSettingsPort classTrait',
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

	| helper folder |
	helper := EDACSourceCodeHelperStub new.
	folder := FileSystem workingDirectory / 'config'.
	folder exists ifTrue: [ folder isDirectory ifFalse: [ folder delete. folder createDirectory  ] ] ifFalse: [ folder createDirectory  ].
	^ ((folder files select: [ :f | 
		    f pathString endsWithSubCollection: '.json' ]) collect: [ :f | 
		   helper replace: '.json' with: '' inString: f asPath basename ])
		  reverse
]

{ #category : #testing }
EDASStompTopicListenerSettingsJsonAdapter class >> description [

	^ #'pharoeda.settings.adapters.command_listener.stomp.json.description'
]

{ #category : #testing }
EDASStompTopicListenerSettingsJsonAdapter class >> edaPort [

	"This gets called in EDASSettings when selecting the port, so it gets selected correctly"

	^ EDASStompTopicListenerSettingsInMemoryAdapter
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

{ #category : #testing }
EDASStompTopicListenerSettingsJsonAdapter class >> icon [

	^ EDACIconProvider new iconNamed: #commandlistener orElse: #comments
]

{ #category : #testing }
EDASStompTopicListenerSettingsJsonAdapter class >> label [

	^ #'pharoeda.settings.adapters.command_listener.stomp.label'
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


	^ debug
]

{ #category : #accessing }
EDASStompTopicListenerSettingsJsonAdapter >> debug: anObject [

	debug := anObject
]

{ #category : #accessing }
EDASStompTopicListenerSettingsJsonAdapter >> durable [
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

{ #category : #metadata }
EDASStompTopicListenerSettingsJsonAdapter >> edaPort [
	
	"This is used by the settings framework to be able to select the STOMP adapter in the available ports.
	This adapter is not selectable (#accepts: returns false). It's only used when the environment value matches any of the json files.
	Take a look at EDASEnvironmentSwitchesToCommandListenerJsonAdapter"
	^ EDASStompTopicListenerSettingsInMemoryAdapter
]

{ #category : #accessing }
EDASStompTopicListenerSettingsJsonAdapter >> errorStrategyName [


	^ errorStrategyName
]

{ #category : #accessing }
EDASStompTopicListenerSettingsJsonAdapter >> errorStrategyName: anObject [

	errorStrategyName := anObject
]

{ #category : #accessing }
EDASStompTopicListenerSettingsJsonAdapter >> host [


	^ host
]

{ #category : #accessing }
EDASStompTopicListenerSettingsJsonAdapter >> host: anObject [

	host := anObject
]

{ #category : #testing }
EDASStompTopicListenerSettingsJsonAdapter >> isReadOnly: aString [

	^ true
]

{ #category : #accessing }
EDASStompTopicListenerSettingsJsonAdapter >> password [

	^ password
]

{ #category : #accessing }
EDASStompTopicListenerSettingsJsonAdapter >> password: anObject [

	password := anObject
]

{ #category : #accessing }
EDASStompTopicListenerSettingsJsonAdapter >> port [

	^ port
]

{ #category : #accessing }
EDASStompTopicListenerSettingsJsonAdapter >> port: anObject [

	port := anObject
]

{ #category : #accessing }
EDASStompTopicListenerSettingsJsonAdapter >> prefetchCount [

	^ prefetchCount
]

{ #category : #accessing }
EDASStompTopicListenerSettingsJsonAdapter >> prefetchCount: anObject [

	prefetchCount := anObject
]

{ #category : #accessing }
EDASStompTopicListenerSettingsJsonAdapter >> queue [

	^ queue
]

{ #category : #accessing }
EDASStompTopicListenerSettingsJsonAdapter >> queue: anObject [

	queue := anObject
]

{ #category : #accessing }
EDASStompTopicListenerSettingsJsonAdapter >> restartOnErrors [

	^ restartOnErrors ifNil: [ true ]
]

{ #category : #accessing }
EDASStompTopicListenerSettingsJsonAdapter >> restartOnErrors: anObject [

	restartOnErrors := anObject
]

{ #category : #accessing }
EDASStompTopicListenerSettingsJsonAdapter >> timeout [

	^ timeout
]

{ #category : #accessing }
EDASStompTopicListenerSettingsJsonAdapter >> timeout: anObject [

	timeout := anObject
]

{ #category : #accessing }
EDASStompTopicListenerSettingsJsonAdapter >> user [

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
