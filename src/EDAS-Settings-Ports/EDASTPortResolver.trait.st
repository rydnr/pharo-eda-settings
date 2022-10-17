Trait {
	#name : #EDASTPortResolver,
	#category : #'EDAS-Settings-Ports'
}

{ #category : #logic }
EDASTPortResolver >> availableAdapters: aPort [
	^ (aPort traitUsers select: [ :cls | cls accepts: self ]) sorted
]

{ #category : #logic }
EDASTPortResolver >> availableCommandListenerSettingsErrorStrategyAdapters [
	^ self availableAdapters: EDASCommandListenerSettingsErrorStrategyPort
]

{ #category : #logic }
EDASTPortResolver >> availableEnvironmentSettingsAdapters [
	^ self availableAdapters: EDASEnvironmentSettingsPort
]

{ #category : #accessing }
EDASTPortResolver >> environmentSettingsPort [
	^ self resolveEnvironmentSettingsPort
]

{ #category : #accessing }
EDASTPortResolver >> resolveEnvironmentSettingsPort [
	^ self resolvePort: EDASEnvironmentSettingsPort
]

{ #category : #api }
EDASTPortResolver >> resolvePort: aPort [
	| candidates candidate |
	candidates := (self availableAdapters: aPort) sorted.
	candidate := candidates
		ifEmpty: [ nil ]
		ifNotEmpty: [ :col | col first ].
	^ candidate ifNil: [ nil ] ifNotNil: [ :c | c withApp: self ]
]
