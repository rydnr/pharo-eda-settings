Trait {
	#name : #EDATLoggingSettingsPort,
	#traits : 'EDATSettingsPort',
	#classTraits : 'EDATSettingsPort classTrait',
	#category : #'EDAS-Settings-Ports'
}

{ #category : #testing }
EDATLoggingSettingsPort >> loggingLevel [
	self subclassResponsibility
]
