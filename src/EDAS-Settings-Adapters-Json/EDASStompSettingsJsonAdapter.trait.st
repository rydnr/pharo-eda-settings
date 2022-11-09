Trait {
	#name : #EDASStompSettingsJsonAdapter,
	#category : #'EDAS-Settings-Adapters-Json'
}

{ #category : #resolving }
EDASStompSettingsJsonAdapter classSide >> availableEnvironments [

	| helper folder |
	helper := EDACSourceCodeHelperStub new.
	folder := FileSystem workingDirectory / 'config'.
	folder exists
		ifTrue: [ 
			folder isDirectory ifFalse: [ 
				folder delete.
				folder createDirectory ] ]
		ifFalse: [ folder createDirectory ].
	^ ((folder files select: [ :f | 
		    f pathString endsWithSubCollection: '.json' ]) collect: [ :f | 
		   helper replace: '.json' with: '' inString: f asPath basename ])
		  reverse
]

{ #category : #'instance creation' }
EDASStompSettingsJsonAdapter classSide >> forEnvironment: anEnvironment withApp: anEDAApplication [

	^ self
		  fromFile:
		  FileSystem workingDirectory / 'config' / (anEnvironment , '.json')
		  withApp: anEDAApplication
]

{ #category : #'instance creation' }
EDASStompSettingsJsonAdapter classSide >> fromFile: aFileReference under: aLabel withApp: anEDAApplication [

	| result json stomp |
	result := self withApp: anEDAApplication.
	json := (NeoJSONReader on: aFileReference readStream) next.
	stomp := (json at: aLabel) at: 'stomp'.
	stomp keysAndValuesDo: [ :k :v | 
		result instVarNamed: k put: v ].
	^ result
]

{ #category : #resolving }
EDASStompSettingsJsonAdapter classSide >> supportsEnvironment: anEnvironment [

	^ (FileSystem workingDirectory / 'config' / (anEnvironment , '.json'))
		  exists
]
