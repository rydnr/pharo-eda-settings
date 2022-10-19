Trait {
	#name : #EDASCommandListenerErrorStrategySettingsPort,
	#traits : 'EDASSettingsPort',
	#classTraits : 'EDASSettingsPort classTrait',
	#category : #'EDAS-Settings-Ports'
}

{ #category : #accessing }
EDASCommandListenerErrorStrategySettingsPort >> availableStrategies [
	self shouldBeImplemented
]

{ #category : #testing }
EDASCommandListenerErrorStrategySettingsPort >> supportsMultiple: aSymbol [

	^ true
]

{ #category : #accessing }
EDASCommandListenerErrorStrategySettingsPort >> values: aSymbol [

	^ self availableStrategies
]
