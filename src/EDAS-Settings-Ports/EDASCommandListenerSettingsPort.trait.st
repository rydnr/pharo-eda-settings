Trait {
	#name : #EDASCommandListenerSettingsPort,
	#traits : 'EDASSettingsPort',
	#classTraits : 'EDASSettingsPort classTrait',
	#category : #'EDAS-Settings-Ports'
}

{ #category : #resolving }
EDASCommandListenerSettingsPort >> availableErrorStrategies [

	self shouldBeImplemented
]

{ #category : #testing }
EDASCommandListenerSettingsPort >> errorStrategy [

	self subclassResponsibility
]

{ #category : #testing }
EDASCommandListenerSettingsPort >> restartOnErrors [

	self subclassResponsibility
]
