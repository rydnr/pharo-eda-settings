Trait {
	#name : #EDASEnvironmentSettingsPort,
	#traits : 'EDASSettingsPort',
	#classTraits : 'EDASSettingsPort classTrait',
	#category : #'EDAS-Settings-Ports'
}

{ #category : #accessing }
EDASEnvironmentSettingsPort classSide >> adapterAccessor [

	^ #environmentSettings
]

{ #category : #accessing }
EDASEnvironmentSettingsPort classSide >> adapterClassAccessor [

	^ #environmentSettingsAdapterClass
]

{ #category : #accessing }
EDASEnvironmentSettingsPort classSide >> changedEventName [

	^ EDASEnvironmentSettingsChanged
]

{ #category : #testing }
EDASEnvironmentSettingsPort classSide >> edaPort [

	<edaPort: #'pharoeda.settings.ports.environment.label'
	withDescription: #'pharoeda.settings.ports.environment.description'
	icon: #environment atPosition: 1>
	^ self
]

{ #category : #accessing }
EDASEnvironmentSettingsPort classSide >> portChangedEventName [

	^ EDASEnvironmentSettingsPortChanged
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
EDASEnvironmentSettingsPort >> availableEnvironments: anEDAApplication [

	self subclassResponsibility
]

{ #category : #testing }
EDASEnvironmentSettingsPort >> values: aSymbol [

	^ self availableEnvironments: self edaApplication
]
