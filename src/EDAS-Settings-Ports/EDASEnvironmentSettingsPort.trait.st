Trait {
	#name : #EDASEnvironmentSettingsPort,
	#traits : 'EDASSettingsPort',
	#classTraits : 'EDASSettingsPort classTrait',
	#category : #'EDAS-Settings-Ports'
}

{ #category : #testing }
EDASEnvironmentSettingsPort >> availableEnvironments [
	self subclassResponsibility
]

{ #category : #testing }
EDASEnvironmentSettingsPort >> values: aSymbol [

	^ self availableEnvironments
]
