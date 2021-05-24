Trait {
	#name : #EDATEnvironmentSettingsPort,
	#traits : 'EDATSettingsPort',
	#classTraits : 'EDATSettingsPort classTrait',
	#category : #'EDAS-Settings-Ports'
}

{ #category : #testing }
EDATEnvironmentSettingsPort >> availableEnvironments [
	self subclassResponsibility
]

{ #category : #testing }
EDATEnvironmentSettingsPort >> supportsMultiple: aSymbol [
	self subclassResponsibility
]
