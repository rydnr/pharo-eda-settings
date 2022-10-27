Class {
	#name : #EDASStompTopicListenerSettingsJsonAdapter,
	#superclass : #Object,
	#traits : 'EDASSettingsPort',
	#classTraits : 'EDASSettingsPort classTrait',
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

	^ restartOnErrors
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
