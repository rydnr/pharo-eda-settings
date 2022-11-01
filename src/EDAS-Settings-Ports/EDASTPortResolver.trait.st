Trait {
	#name : #EDASTPortResolver,
	#category : #'EDAS-Settings-Ports'
}

{ #category : #logic }
EDASTPortResolver >> availableAdaptersFor: aSymbol [

	^ ((Pragma allNamed: #edaPort:as:atPosition:)
		   select: [ :p | p arguments first = aSymbol ]
		   thenCollect: [ :p | p methodClass ]) asOrderedCollection
		  ifEmpty: [ OrderedCollection new ]
		  ifNotEmpty: [ :c | self availableAdaptersForPort: c first ]
]

{ #category : #logic }
EDASTPortResolver >> availableAdaptersForPort: aPort [

	^ (aPort traitUsers select: [ :cls | cls accepts: aPort ]) sorted asOrderedCollection 
]

{ #category : #helpers }
EDASTPortResolver >> availablePorts [

	^ (((Pragma allNamed: #edaPort:as:atPosition:) sorted: [ :a :b | 
		   (a argumentAt: 3) < (b argumentAt: 3) ]) collect: [ :p | 
		    p method methodClass ]) asOrderedCollection
]

{ #category : #accessing }
EDASTPortResolver >> environmentSettingsPort [
	^ self resolveEnvironmentSettingsPort
]

{ #category : #helpers }
EDASTPortResolver >> portAdapterClassSymbol: aString [

	^ (aString , 'SettingsAdapterClass') asSymbol
]

{ #category : #helpers }
EDASTPortResolver >> portDescription: aSymbol [

	^ ((Pragma allNamed: #edaPort:as:atPosition:)
		   select: [ :p | p arguments first = aSymbol ]
		   thenCollect: [ :p | p arguments second ]) asOrderedCollection
		  ifEmpty: [ nil ]
		  ifNotEmpty: [ :c | c first ]
]

{ #category : #api }
EDASTPortResolver >> resolvePort: aPort forApp: app [

	| candidates candidate |
	candidates := (self availableAdaptersForPort: aPort) sorted.
	candidate := candidates
		             ifEmpty: [ nil ]
		             ifNotEmpty: [ :col | col first ].
	^ candidate ifNil: [ nil ] ifNotNil: [ :c | c withApp: app ]
]
