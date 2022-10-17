Trait {
	#name : #EDASLoggingSettingsPort,
	#traits : 'EDASSettingsPort',
	#classTraits : 'EDASSettingsPort classTrait',
	#category : #'EDAS-Settings-Ports'
}

{ #category : #testing }
EDASLoggingSettingsPort >> loggingLevel [
	self subclassResponsibility
]
