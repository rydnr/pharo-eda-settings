Trait {
	#name : #EDASTPortResolver,
	#category : #'EDAS-Settings-Ports'
}

{ #category : #logic }
EDASTPortResolver >> availableAdaptersFor: aSymbol [

	^ ((Pragma allNamed: #edaPort:as:)
		   select: [ :p | p arguments first = aSymbol ]
		   thenCollect: [ :p | p methodClass ]) asOrderedCollection ifEmpty: [ OrderedCollection new ] ifNotEmpty: [ :c | self availableAdaptersForPort: c first ]
]

{ #category : #logic }
EDASTPortResolver >> availableAdaptersForPort: aPort [

	^ (aPort traitUsers select: [ :cls | cls accepts: aPort ]) sorted asOrderedCollection 
]

{ #category : #logic }
EDASTPortResolver >> availableCommandListenerSettingsAdapters [

	^ self availableAdaptersForPort:
		  EDASCommandListenerSettingsPort
]

{ #category : #logic }
EDASTPortResolver >> availableEnvironmentSettingsAdapters [
	^ self availableAdaptersForPort: EDASEnvironmentSettingsPort
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

	^ ((Pragma allNamed: #edaPort:as:)
		   select: [ :p | p arguments first = aSymbol ]
		   thenCollect: [ :p | p arguments second ]) asOrderedCollection ifEmpty: [ nil ] ifNotEmpty: [ :c | c first ] 
]

{ #category : #accessing }
EDASTPortResolver >> resolveCommandListenerSettingsPort [

	^ self resolvePort: EDASCommandListenerSettingsPort
]

{ #category : #accessing }
EDASTPortResolver >> resolveEnvironmentSettingsPort [
	^ self resolvePort: EDASEnvironmentSettingsPort
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
