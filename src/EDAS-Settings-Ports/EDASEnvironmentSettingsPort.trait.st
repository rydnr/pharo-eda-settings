Trait {
	#name : #EDASEnvironmentSettingsPort,
	#traits : 'EDASSettingsPort',
	#classTraits : 'EDASSettingsPort classTrait',
	#category : #'EDAS-Settings-Ports'
}

{ #category : #accessing }
EDASEnvironmentSettingsPort classSide >> adapterClassAccessor [

	^ #environmentSettingsAdapterClass
]

{ #category : #testing }
EDASEnvironmentSettingsPort classSide >> edaPort [

	<edaPort: 'Environment' withDescription: 'The adapter to specify the environment' icon: #environment atPosition: 1>
	^ self
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

	^ self availableEnvironments
]
