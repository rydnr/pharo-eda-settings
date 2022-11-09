Class {
	#name : #EDASStompTopicListenerSettingsJsonAdapterTest,
	#superclass : #TestCase,
	#category : #'EDAS-Settings-Adapters-Json-Tests'
}

{ #category : #helpers }
EDASStompTopicListenerSettingsJsonAdapterTest >> defaultCommandListener [

	| result stomp |
	result := Dictionary new.
	stomp := Dictionary new.
	stomp
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
	result at: 'stomp' put: stomp.
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
	(commandListener at: 'stomp') at: 'ack' put: 'auto'.
	dict := Dictionary new.
	dict at: 'commandListener' put: commandListener.
	json := String streamContents: [ :stream | 
		        (NeoJSONWriter on: stream)
			        asciiOnly: true;
			        nextPut: dict ].
	tempFile writeStreamDo: [ :s | s nextPutAll: json ].
	self
		assert: (EDASStompCommandListenerSettingsJsonAdapter
				 fromFile: tempFile
				 withApp: nil) ack = ((commandListener at: 'stomp') at: 'ack')
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
	(commandListener at: 'stomp') at: 'debug' put: false.
	dict := Dictionary new.
	dict at: 'commandListener' put: commandListener.
	json := String streamContents: [ :stream | 
		        (NeoJSONWriter on: stream)
			        asciiOnly: true;
			        nextPut: dict ].
	tempFile writeStreamDo: [ :s | s nextPutAll: json ].
	self
		assert: (EDASStompCommandListenerSettingsJsonAdapter
				 fromFile: tempFile
				 withApp: nil) debug = ((commandListener at: 'stomp') at: 'debug')
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
	(commandListener at: 'stomp')
		at: 'durable'
		put: ((commandListener at: 'stomp') at: 'durable') not.
	dict := Dictionary new.
	dict at: 'commandListener' put: commandListener.
	json := String streamContents: [ :stream | 
		        (NeoJSONWriter on: stream)
			        asciiOnly: true;
			        nextPut: dict ].
	tempFile writeStreamDo: [ :s | s nextPutAll: json ].
	self
		assert: (EDASStompCommandListenerSettingsJsonAdapter
				 fromFile: tempFile
				 withApp: nil) durable
			= ((commandListener at: 'stomp') at: 'durable')
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
	(commandListener at: 'stomp') at: 'host' put: '127.0.0.1'.
	dict := Dictionary new.
	dict at: 'commandListener' put: commandListener.
	json := String streamContents: [ :stream | 
		        (NeoJSONWriter on: stream)
			        asciiOnly: true;
			        nextPut: dict ].
	tempFile writeStreamDo: [ :s | s nextPutAll: json ].
	self
		assert: (EDASStompCommandListenerSettingsJsonAdapter
				 fromFile: tempFile
				 withApp: nil) host = '127.0.0.1'
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
	(commandListener at: 'stomp') at: 'host' put: 'localhost'.
	dict := Dictionary new.
	dict at: 'commandListener' put: commandListener.
	json := String streamContents: [ :stream | 
		        (NeoJSONWriter on: stream)
			        asciiOnly: true;
			        nextPut: dict ].
	tempFile writeStreamDo: [ :s | s nextPutAll: json ].
	self
		assert: (EDASStompCommandListenerSettingsJsonAdapter
				 fromFile: tempFile
				 withApp: nil) host = 'localhost'
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
	(commandListener at: 'stomp') at: 'password' put: 'whatever'.
	dict := Dictionary new.
	dict at: 'commandListener' put: commandListener.
	json := String streamContents: [ :stream | 
		        (NeoJSONWriter on: stream)
			        asciiOnly: true;
			        nextPut: dict ].
	tempFile writeStreamDo: [ :s | s nextPutAll: json ].
	self
		assert: (EDASStompCommandListenerSettingsJsonAdapter
				 fromFile: tempFile
				 withApp: nil) password = ((commandListener at: 'stomp') at: 'password')
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
	(commandListener at: 'stomp') at: 'port' put: 61614.
	dict := Dictionary new.
	dict at: 'commandListener' put: commandListener.
	json := String streamContents: [ :stream | 
		        (NeoJSONWriter on: stream)
			        asciiOnly: true;
			        nextPut: dict ].
	tempFile writeStreamDo: [ :s | s nextPutAll: json ].
	self
		assert: (EDASStompCommandListenerSettingsJsonAdapter
				 fromFile: tempFile
				 withApp: nil) port = 61614
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
	(commandListener at: 'stomp') at: 'prefetchCount' put: 11.
	dict := Dictionary new.
	dict at: 'commandListener' put: commandListener.
	json := String streamContents: [ :stream | 
		        (NeoJSONWriter on: stream)
			        asciiOnly: true;
			        nextPut: dict ].
	tempFile writeStreamDo: [ :s | s nextPutAll: json ].
	self
		assert: (EDASStompCommandListenerSettingsJsonAdapter
				 fromFile: tempFile
				 withApp: nil) prefetchCount
			= ((commandListener at: 'stomp') at: 'prefetchCount')
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
	(commandListener at: 'stomp') at: 'queue' put: 'myQueue'.
	dict := Dictionary new.
	dict at: 'commandListener' put: commandListener.
	json := String streamContents: [ :stream | 
		        (NeoJSONWriter on: stream)
			        asciiOnly: true;
			        nextPut: dict ].
	tempFile writeStreamDo: [ :s | s nextPutAll: json ].
	self
		assert: (EDASStompCommandListenerSettingsJsonAdapter
				 fromFile: tempFile
				 withApp: nil) queue = ((commandListener at: 'stomp') at: 'queue')
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
	(commandListener at: 'stomp')
		at: 'restartOnErrors'
		put: ((commandListener at: 'stomp') at: 'restartOnErrors') not.
	dict := Dictionary new.
	dict at: 'commandListener' put: commandListener.
	json := String streamContents: [ :stream | 
		        (NeoJSONWriter on: stream)
			        asciiOnly: true;
			        nextPut: dict ].
	tempFile writeStreamDo: [ :s | s nextPutAll: json ].
	self
		assert: (EDASStompCommandListenerSettingsJsonAdapter
				 fromFile: tempFile
				 withApp: nil) restartOnErrors
			= ((commandListener at: 'stomp') at: 'restartOnErrors')
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
	(commandListener at: 'stomp') at: 'timeout' put: 33.
	dict := Dictionary new.
	dict at: 'commandListener' put: commandListener.
	json := String streamContents: [ :stream | 
		        (NeoJSONWriter on: stream)
			        asciiOnly: true;
			        nextPut: dict ].
	tempFile writeStreamDo: [ :s | s nextPutAll: json ].
	self
		assert: (EDASStompCommandListenerSettingsJsonAdapter
				 fromFile: tempFile
				 withApp: nil) timeout = ((commandListener at: 'stomp') at: 'timeout')
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
	(commandListener at: 'stomp') at: 'user' put: 'johnsmith'.
	dict := Dictionary new.
	dict at: 'commandListener' put: commandListener.
	json := String streamContents: [ :stream | 
		        (NeoJSONWriter on: stream)
			        asciiOnly: true;
			        nextPut: dict ].
	tempFile writeStreamDo: [ :s | s nextPutAll: json ].
	self
		assert: (EDASStompCommandListenerSettingsJsonAdapter
				 fromFile: tempFile
				 withApp: nil) user = ((commandListener at: 'stomp') at: 'user')
		description: 'User parsing failed'
		resumable: true.
	tempFile delete
]
