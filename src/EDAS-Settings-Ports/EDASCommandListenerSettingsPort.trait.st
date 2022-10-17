Trait {
	#name : #EDASCommandListenerSettingsPort,
	#traits : 'EDASSettingsPort',
	#classTraits : 'EDASSettingsPort classTrait',
	#category : #'EDAS-Settings-Ports'
}

{ #category : #testing }
EDASCommandListenerSettingsPort >> restartOnCommandConsumingErrors [
	self subclassResponsibility
]

{ #category : #testing }
EDASCommandListenerSettingsPort >> strategy [
	self subclassResponsibility
]
