Trait {
	#name : #EDASEnvironmentSettingsPort,
	#traits : 'EDASSettingsPort',
	#classTraits : 'EDASSettingsPort classTrait',
	#category : #'EDAS-Settings-Ports'
}

{ #category : #testing }
EDASEnvironmentSettingsPort classSide >> description [

	^ 'Environment'
]

{ #category : #accessing }
EDASEnvironmentSettingsPort classSide >> label [

	^ 'Environment'
]

{ #category : #accessing }
EDASEnvironmentSettingsPort classSide >> selector [
	^ #currentEnvironment
]

{ #category : #testing }
EDASEnvironmentSettingsPort classSide >> settingsBlock [
	^ [ :app |  app
		notifyEnvironmentChangedFrom: nil
		to: app environmentSettings currentEnvironment ]
]

{ #category : #testing }
EDASEnvironmentSettingsPort >> availableEnvironments [
	self subclassResponsibility
]

{ #category : #testing }
EDASEnvironmentSettingsPort >> values: aSymbol [

	<edaPort: #environment as: 'Environment'>
	^ self availableEnvironments
]
