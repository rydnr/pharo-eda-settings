Trait {
	#name : #EDASSettingsJsonAdapter,
	#category : #'EDAS-Settings-Adapters-Json'
}

{ #category : #resolving }
EDASSettingsJsonAdapter classSide >> availableEnvironments: anEDAApplication [

	| helper folder result |
	helper := EDACSourceCodeHelperStub new.
	folder := anEDAApplication configFolder.
	folder exists
		ifTrue: [ 
			folder isDirectory ifFalse: [ 
				folder delete.
				folder createDirectory ] ]
		ifFalse: [ folder createDirectory ].
	result := self sortEnvironments: ((folder files select: [ :f | 
			            f pathString endsWithSubCollection: '.json' ]) 
			           collect: [ :f | 
				           (helper
					            replace: '.json'
					            with: ''
					            inString: f asPath basename)
				           -> (self isDefaultEnvironment: f) ]) asOrderedCollection.
	^ result collect: [ :e | e key ]
]

{ #category : #'instance creation' }
EDASSettingsJsonAdapter classSide >> forEnvironment: anEnvironment withApp: anEDAApplication [

	^ self
		  fromFile:
		  anEDAApplication configFolder / (anEnvironment , '.json')
		  withApp: anEDAApplication
]

{ #category : #'instance creation' }
EDASSettingsJsonAdapter classSide >> fromFile: aFileReference do: aBlock [

	^ aBlock value: (NeoJSONReader on: aFileReference readStream) next
]

{ #category : #'instance creation' }
EDASSettingsJsonAdapter classSide >> fromFile: aFileReference under: aLabel for: aString withApp: anEDAApplication [

	^ self fromFile: aFileReference under: aLabel for: aString withApp: anEDAApplication do: [ :entries :result | 
	entries keysAndValuesDo: [ :k :v | result instVarNamed: k put: v ] ]
]

{ #category : #'instance creation' }
EDASSettingsJsonAdapter classSide >> fromFile: aFileReference under: aLabel for: aString withApp: anEDAApplication do: aBlock [

	^ self fromFile: aFileReference do: [ :json | 
		  | result entries |
		  result := self withApp: anEDAApplication.
		  entries := (json at: aLabel) at: aString.
		  aBlock value: entries value: result.
		  result ]
]

{ #category : #resolving }
EDASSettingsJsonAdapter classSide >> isDefaultEnvironment: aFileReference [

	^ self fromFile: aFileReference do: [ :json | json at: 'default' ifAbsent: [ false ] ]
]

{ #category : #resolving }
EDASSettingsJsonAdapter classSide >> sortEnvironments: aCollection [

	| result defaultEnvironment |
	defaultEnvironment := (aCollection select: [ :e | e value ]) ifEmpty: [ aCollection first ] ifNotEmpty: [ :c | c first ].
	result := OrderedCollection with: defaultEnvironment.
	result addAll: (aCollection copy remove: defaultEnvironment; yourself).
	^ result
]

{ #category : #resolving }
EDASSettingsJsonAdapter classSide >> supportsEnvironment: anEnvironment forApp: anEDAApplication [

	^ (anEDAApplication configFolder / (anEnvironment , '.json'))
		  exists
]
