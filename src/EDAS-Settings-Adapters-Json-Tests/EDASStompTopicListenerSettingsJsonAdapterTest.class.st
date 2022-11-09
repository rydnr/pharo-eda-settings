Class {
	#name : #EDASStompTopicListenerSettingsJsonAdapterTest,
	#superclass : #TestCase,
	#category : #'EDAS-Settings-Adapters-Json-Tests'
}

{ #category : #helpers }
EDASStompTopicListenerSettingsJsonAdapterTest >> defaultCommandListener [

	| result |
	result := Dictionary new.
	result
		at: 'host' put: 'localhost';
		at: 'port' put: 61613;
		at: 'user' put: 'user1';
		at: 'password' put: 'secret';
		at: 'queue' put: 'pharoeda';
		at: 'durable' put: true;
		at: 'ack' put: 'client-individual';
		at: 'prefetchCount' put: 1;
		at: 'timeout' put: 60;
		at: 'debug' put: true;
		at: 'restartOnErrors' put: true;
		at: 'errorStrategyName' put: 'EDAEJustLogErrorStrategy'.
	^ result
]

{ #category : #tests }
EDASStompTopicListenerSettingsJsonAdapterTest >> testAck [

	| json dict tempFile commandListener |
	tempFile := FileReference
		            newTempFilePrefix:
		            'EDASStompTopicListenerSettingsJsonAdapterTest'
		            suffix: '.json'.
	commandListener := self defaultCommandListener.
	commandListener at: 'ack' put: 'auto'.
	dict := Dictionary new.
	dict at: 'commandListener' put: commandListener.
	json := String streamContents: [ :stream | 
		        (NeoJSONWriter on: stream)
			        asciiOnly: true;
			        nextPut: dict ].
	tempFile writeStreamDo: [ :s | s nextPutAll: json ].
	self
		assert:
			(EDASStompCommandListenerSettingsJsonAdapter fromFile: tempFile withApp: nil) ack
			= (commandListener at: 'ack')
		description: 'Ack parsing failed'
		resumable: true.
	tempFile delete
]

{ #category : #tests }
EDASStompTopicListenerSettingsJsonAdapterTest >> testDebug [

	| json dict tempFile commandListener |
	tempFile := FileReference
		            newTempFilePrefix:
		            'EDASStompTopicListenerSettingsJsonAdapterTest'
		            suffix: '.json'.
	commandListener := self defaultCommandListener.
	commandListener at: 'debug' put: false.
	dict := Dictionary new.
	dict at: 'commandListener' put: commandListener.
	json := String streamContents: [ :stream | 
		        (NeoJSONWriter on: stream)
			        asciiOnly: true;
			        nextPut: dict ].
	tempFile writeStreamDo: [ :s | s nextPutAll: json ].
	self
		assert:
			(EDASStompCommandListenerSettingsJsonAdapter fromFile: tempFile withApp: nil)
				debug = (commandListener at: 'debug')
		description: 'Debug parsing failed'
		resumable: true.
	tempFile delete
]

{ #category : #tests }
EDASStompTopicListenerSettingsJsonAdapterTest >> testDurable [

	| json dict tempFile commandListener |
	tempFile := FileReference
		            newTempFilePrefix:
		            'EDASStompTopicListenerSettingsJsonAdapterTest'
		            suffix: '.json'.
	commandListener := self defaultCommandListener.
	commandListener
		at: 'durable'
		put: (commandListener at: 'durable') not.
	dict := Dictionary new.
	dict at: 'commandListener' put: commandListener.
	json := String streamContents: [ :stream | 
		        (NeoJSONWriter on: stream)
			        asciiOnly: true;
			        nextPut: dict ].
	tempFile writeStreamDo: [ :s | s nextPutAll: json ].
	self
		assert:
			(EDASStompCommandListenerSettingsJsonAdapter fromFile: tempFile withApp: nil)
				durable = (commandListener at: 'durable')
		description: 'Durable parsing failed'
		resumable: true.
	tempFile delete
]

{ #category : #tests }
EDASStompTopicListenerSettingsJsonAdapterTest >> testHost_127_0_0_1 [

	| json dict tempFile commandListener |
	tempFile := FileReference
		            newTempFilePrefix:
		            'EDASStompTopicListenerSettingsJsonAdapterTest'
		            suffix: '.json'.
	commandListener := self defaultCommandListener.
	commandListener at: 'host' put: '127.0.0.1'.
	dict := Dictionary new.
	dict at: 'commandListener' put: commandListener.
	json := String streamContents: [ :stream | 
		        (NeoJSONWriter on: stream)
			        asciiOnly: true;
			        nextPut: dict ].
	tempFile writeStreamDo: [ :s | s nextPutAll: json ].
	self
		assert:
			(EDASStompCommandListenerSettingsJsonAdapter fromFile: tempFile withApp: nil) host
			= '127.0.0.1'
		description: 'Host parsing failed'
		resumable: true.
	tempFile delete
]

{ #category : #tests }
EDASStompTopicListenerSettingsJsonAdapterTest >> testHost_localhost [

	| json dict tempFile commandListener |
	tempFile := FileReference
		            newTempFilePrefix:
		            'EDASStompTopicListenerSettingsJsonAdapterTest'
		            suffix: '.json'.
	commandListener := self defaultCommandListener.
	commandListener at: 'host' put: 'localhost'.
	dict := Dictionary new.
	dict at: 'commandListener' put: commandListener.
	json := String streamContents: [ :stream | 
		        (NeoJSONWriter on: stream)
			        asciiOnly: true;
			        nextPut: dict ].
	tempFile writeStreamDo: [ :s | s nextPutAll: json ].
	self
		assert:
			(EDASStompCommandListenerSettingsJsonAdapter fromFile: tempFile withApp: nil) host
			= 'localhost'
		description: 'Host parsing failed'
		resumable: true.
	tempFile delete
]

{ #category : #tests }
EDASStompTopicListenerSettingsJsonAdapterTest >> testPassword [

	| json dict tempFile commandListener |
	tempFile := FileReference
		            newTempFilePrefix:
		            'EDASStompTopicListenerSettingsJsonAdapterTest'
		            suffix: '.json'.
	commandListener := self defaultCommandListener.
	commandListener at: 'password' put: 'whatever'.
	dict := Dictionary new.
	dict at: 'commandListener' put: commandListener.
	json := String streamContents: [ :stream | 
		        (NeoJSONWriter on: stream)
			        asciiOnly: true;
			        nextPut: dict ].
	tempFile writeStreamDo: [ :s | s nextPutAll: json ].
	self
		assert:
			(EDASStompCommandListenerSettingsJsonAdapter fromFile: tempFile withApp: nil)
				password = (commandListener at: 'password')
		description: 'Password parsing failed'
		resumable: true.
	tempFile delete
]

{ #category : #tests }
EDASStompTopicListenerSettingsJsonAdapterTest >> testPort [

	| json dict tempFile commandListener |
	tempFile := FileReference
		            newTempFilePrefix:
		            'EDASStompTopicListenerSettingsJsonAdapterTest'
		            suffix: '.json'.
	commandListener := self defaultCommandListener.
	commandListener at: 'port' put: 61614.
	dict := Dictionary new.
	dict at: 'commandListener' put: commandListener.
	json := String streamContents: [ :stream | 
		        (NeoJSONWriter on: stream)
			        asciiOnly: true;
			        nextPut: dict ].
	tempFile writeStreamDo: [ :s | s nextPutAll: json ].
	self
		assert:
			(EDASStompCommandListenerSettingsJsonAdapter fromFile: tempFile withApp: nil) port
			= 61614
		description: 'Port parsing failed'
		resumable: true.
	tempFile delete
]

{ #category : #tests }
EDASStompTopicListenerSettingsJsonAdapterTest >> testPrefetchCount [

	| json dict tempFile commandListener |
	tempFile := FileReference
		            newTempFilePrefix:
		            'EDASStompTopicListenerSettingsJsonAdapterTest'
		            suffix: '.json'.
	commandListener := self defaultCommandListener.
	commandListener at: 'prefetchCount' put: 11.
	dict := Dictionary new.
	dict at: 'commandListener' put: commandListener.
	json := String streamContents: [ :stream | 
		        (NeoJSONWriter on: stream)
			        asciiOnly: true;
			        nextPut: dict ].
	tempFile writeStreamDo: [ :s | s nextPutAll: json ].
	self
		assert:
			(EDASStompCommandListenerSettingsJsonAdapter fromFile: tempFile withApp: nil)
				prefetchCount = (commandListener at: 'prefetchCount')
		description: 'PrefetchCount parsing failed'
		resumable: true.
	tempFile delete
]

{ #category : #tests }
EDASStompTopicListenerSettingsJsonAdapterTest >> testQueue [

	| json dict tempFile commandListener |
	tempFile := FileReference
		            newTempFilePrefix:
		            'EDASStompTopicListenerSettingsJsonAdapterTest'
		            suffix: '.json'.
	commandListener := self defaultCommandListener.
	commandListener at: 'queue' put: 'myQueue'.
	dict := Dictionary new.
	dict at: 'commandListener' put: commandListener.
	json := String streamContents: [ :stream | 
		        (NeoJSONWriter on: stream)
			        asciiOnly: true;
			        nextPut: dict ].
	tempFile writeStreamDo: [ :s | s nextPutAll: json ].
	self
		assert:
			(EDASStompCommandListenerSettingsJsonAdapter fromFile: tempFile withApp: nil)
				queue = (commandListener at: 'queue')
		description: 'Queue parsing failed'
		resumable: true.
	tempFile delete
]

{ #category : #tests }
EDASStompTopicListenerSettingsJsonAdapterTest >> testRestartOnErrors [

	| json dict tempFile commandListener |
	tempFile := FileReference
		            newTempFilePrefix:
		            'EDASStompTopicListenerSettingsJsonAdapterTest'
		            suffix: '.json'.
	commandListener := self defaultCommandListener.
	commandListener
		at: 'restartOnErrors'
		put: (commandListener at: 'restartOnErrors') not.
	dict := Dictionary new.
	dict at: 'commandListener' put: commandListener.
	json := String streamContents: [ :stream | 
		        (NeoJSONWriter on: stream)
			        asciiOnly: true;
			        nextPut: dict ].
	tempFile writeStreamDo: [ :s | s nextPutAll: json ].
	self
		assert:
			(EDASStompCommandListenerSettingsJsonAdapter fromFile: tempFile withApp: nil)
				restartOnErrors = (commandListener at: 'restartOnErrors')
		description: 'RestartOnErrors parsing failed'
		resumable: true.
	tempFile delete
]

{ #category : #tests }
EDASStompTopicListenerSettingsJsonAdapterTest >> testTimeout [

	| json dict tempFile commandListener |
	tempFile := FileReference
		            newTempFilePrefix:
		            'EDASStompTopicListenerSettingsJsonAdapterTest'
		            suffix: '.json'.
	commandListener := self defaultCommandListener.
	commandListener at: 'timeout' put: 33.
	dict := Dictionary new.
	dict at: 'commandListener' put: commandListener.
	json := String streamContents: [ :stream | 
		        (NeoJSONWriter on: stream)
			        asciiOnly: true;
			        nextPut: dict ].
	tempFile writeStreamDo: [ :s | s nextPutAll: json ].
	self
		assert:
			(EDASStompCommandListenerSettingsJsonAdapter fromFile: tempFile withApp: nil)
				timeout = (commandListener at: 'timeout')
		description: 'Timeout parsing failed'
		resumable: true.
	tempFile delete
]

{ #category : #tests }
EDASStompTopicListenerSettingsJsonAdapterTest >> testUser [

	| json dict tempFile commandListener |
	tempFile := FileReference
		            newTempFilePrefix:
		            'EDASStompTopicListenerSettingsJsonAdapterTest'
		            suffix: '.json'.
	commandListener := self defaultCommandListener.
	commandListener at: 'user' put: 'johnsmith'.
	dict := Dictionary new.
	dict at: 'commandListener' put: commandListener.
	json := String streamContents: [ :stream | 
		        (NeoJSONWriter on: stream)
			        asciiOnly: true;
			        nextPut: dict ].
	tempFile writeStreamDo: [ :s | s nextPutAll: json ].
	self
		assert:
			(EDASStompCommandListenerSettingsJsonAdapter fromFile: tempFile withApp: nil) user
			= (commandListener at: 'user')
		description: 'User parsing failed'
		resumable: true.
	tempFile delete
]
