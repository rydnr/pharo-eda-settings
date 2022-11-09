Class {
	#name : #EDASStompCommandListenerSettingsJsonAdapter,
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
EDASStompCommandListenerSettingsJsonAdapter class >> availableEnvironments [

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
EDASStompCommandListenerSettingsJsonAdapter class >> description [

	^ #'pharoeda.settings.adapters.command_listener.stomp.json.description'
]

{ #category : #testing }
EDASStompCommandListenerSettingsJsonAdapter class >> edaPort [

	"This gets called in EDASSettings when selecting the port, so it gets selected correctly"

	^ EDASStompCommandListenerSettingsInMemoryAdapter
]

{ #category : #'instance creation' }
EDASStompCommandListenerSettingsJsonAdapter class >> forEnvironment: anEnvironment withApp: anEDAApplication [

	^ self fromFile:
		  FileSystem workingDirectory / 'config' / (anEnvironment , '.json') withApp: anEDAApplication 
]

{ #category : #'instance creation' }
EDASStompCommandListenerSettingsJsonAdapter class >> fromFile: aFileReference withApp: anEDAApplication [

	| result json commandListener |
	result := self withApp: anEDAApplication.
	json := (NeoJSONReader on: aFileReference readStream) next.
	commandListener := json at: 'commandListener'.
	commandListener keysAndValuesDo: [ :k :v | 
		result instVarNamed: k put: v ].
	^ result
]

{ #category : #testing }
EDASStompCommandListenerSettingsJsonAdapter class >> icon [

	^ EDACIconProvider new iconNamed: #commandlistener orElse: #comments
]

{ #category : #testing }
EDASStompCommandListenerSettingsJsonAdapter class >> label [

	^ #'pharoeda.settings.adapters.command_listener.stomp.label'
]

{ #category : #'instance creation' }
EDASStompCommandListenerSettingsJsonAdapter class >> supportsEnvironment: anEnvironment [

	^ 
		(FileSystem workingDirectory / 'config' / (anEnvironment , '.json')) exists

]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> ack [

	^ ack
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> ack: anObject [

	ack := anObject
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> debug [


	^ debug
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> debug: anObject [

	debug := anObject
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> durable [
	^ durable
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> durable: anObject [

	durable := anObject
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> edaApplication [

	^ edaApplication
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> edaApplication: anObject [

	edaApplication := anObject
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


	^ errorStrategyName
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> errorStrategyName: anObject [

	errorStrategyName := anObject
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> host [


	^ host
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> host: anObject [

	host := anObject
]

{ #category : #testing }
EDASStompCommandListenerSettingsJsonAdapter >> isReadOnly: aString [

	^ true
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> password [

	^ password
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> password: anObject [

	password := anObject
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> port [

	^ port
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> port: anObject [

	port := anObject
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> prefetchCount [

	^ prefetchCount
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> prefetchCount: anObject [

	prefetchCount := anObject
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> queue [

	^ queue
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> queue: anObject [

	queue := anObject
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> restartOnErrors [

	^ restartOnErrors ifNil: [ true ]
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> restartOnErrors: anObject [

	restartOnErrors := anObject
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> timeout [

	^ timeout
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> timeout: anObject [

	timeout := anObject
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> user [

	^ user
]

{ #category : #accessing }
EDASStompCommandListenerSettingsJsonAdapter >> user: anObject [

	user := anObject
]

{ #category : #testing }
EDASStompCommandListenerSettingsJsonAdapter >> values: aSymbol [

	aSymbol = #errorStrategyName
		ifTrue: [ ^ self availableErrorStrategies ]
		ifFalse: [ ^ OrderedCollection new ]
]
