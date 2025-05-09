Trait {
	#name : #EDASStompSettingsJsonAdapter,
	#instVars : [
		'host',
		'port',
		'user',
		'password',
		'timeout',
		'debug',
		'durable',
		'restartOnErrors'
	],
	#traits : 'EDASSettingsJsonAdapter',
	#classTraits : 'EDASSettingsJsonAdapter classTrait',
	#category : #'EDAS-Settings-Adapters-Json'
}

{ #category : #'instance creation' }
EDASStompSettingsJsonAdapter classSide >> fromFile: aFileReference under: aLabel withApp: anEDAApplication [

	^ self fromFile: aFileReference under: aLabel for: 'stomp' withApp: anEDAApplication
]

{ #category : #accessing }
EDASStompSettingsJsonAdapter >> debug: anObject [

	debug := anObject
]

{ #category : #accessing }
EDASStompSettingsJsonAdapter >> durable: anObject [

	durable := anObject
]

{ #category : #accessing }
EDASStompSettingsJsonAdapter >> host: anObject [

	host := anObject
]

{ #category : #accessing }
EDASStompSettingsJsonAdapter >> keyIn: aSymbol forValue: value [

	^ EDASStompSettingsInMemoryAdapter new keyIn: aSymbol forValue: value
]

{ #category : #accessing }
EDASStompSettingsJsonAdapter >> password: anObject [

	password := anObject
]

{ #category : #accessing }
EDASStompSettingsJsonAdapter >> port: anObject [

	port := anObject
]

{ #category : #accessing }
EDASStompSettingsJsonAdapter >> restartOnErrors: anObject [

	restartOnErrors := anObject
]

{ #category : #accessing }
EDASStompSettingsJsonAdapter >> timeout: anObject [

	timeout := anObject
]

{ #category : #accessing }
EDASStompSettingsJsonAdapter >> user: anObject [

	user := anObject
]

{ #category : #accessing }
EDASStompSettingsJsonAdapter >> values: aSymbol [

	^ EDASStompSettingsInMemoryAdapter new values: aSymbol
]
