Trait {
	#name : #EDASSettingsJsonAdapter,
	#category : #'EDAS-Settings-Adapters-Json'
}

{ #category : #resolving }
EDASSettingsJsonAdapter classSide >> availableEnvironments [

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
EDASSettingsJsonAdapter classSide >> forEnvironment: anEnvironment withApp: anEDAApplication [

	^ self
		  fromFile:
		  FileSystem workingDirectory / 'config' / (anEnvironment , '.json')
		  withApp: anEDAApplication
]

{ #category : #'instance creation' }
EDASSettingsJsonAdapter classSide >> fromFile: aFileReference under: aLabel for: aString withApp: anEDAApplication [

	| result json entries |
	result := self withApp: anEDAApplication.
	json := (NeoJSONReader on: aFileReference readStream) next.
	entries := (json at: aLabel) at: aString.
	entries keysAndValuesDo: [ :k :v | result instVarNamed: k put: v ].
	^ result
]

{ #category : #resolving }
EDASSettingsJsonAdapter classSide >> supportsEnvironment: anEnvironment [

	^ (FileSystem workingDirectory / 'config' / (anEnvironment , '.json'))
		  exists
]
