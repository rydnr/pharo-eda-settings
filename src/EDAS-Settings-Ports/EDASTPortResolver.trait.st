Trait {
	#name : #EDASTPortResolver,
	#category : #'EDAS-Settings-Ports'
}

{ #category : #logic }
EDASTPortResolver >> availableAdapters: aPort [
	^ (aPort traitUsers select: [ :cls | cls accepts: aPort ]) sorted
]

{ #category : #logic }
EDASTPortResolver >> availableCommandListenerSettingsAdapters [

	^ self availableAdapters:
		  EDASCommandListenerSettingsPort
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
	candidates := (self availableAdapters: aPort) sorted.
	candidate := candidates
		             ifEmpty: [ nil ]
		             ifNotEmpty: [ :col | col first ].
	^ candidate ifNil: [ nil ] ifNotNil: [ :c | c withApp: app ]
]
