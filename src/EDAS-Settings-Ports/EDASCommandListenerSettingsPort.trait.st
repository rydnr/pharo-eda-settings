Trait {
	#name : #EDASCommandListenerSettingsPort,
	#traits : 'EDASSettingsPort',
	#classTraits : 'EDASSettingsPort classTrait',
	#category : #'EDAS-Settings-Ports'
}

{ #category : #accessing }
EDASCommandListenerSettingsPort classSide >> adapterAccessor [

	^ #commandListenerSettings
]

{ #category : #accessing }
EDASCommandListenerSettingsPort classSide >> adapterClassAccessor [

	^ #commandListenerSettingsAdapterClass
]

{ #category : #testing }
EDASCommandListenerSettingsPort classSide >> edaPort [

	<edaPort: #'pharoeda.settings.ports.command_listener.label'
	withDescription:
	#'pharoeda.settings.ports.command_listener.description' icon:
	#commandlistener atPosition: 2>
	^ self
]

{ #category : #testing }
EDASCommandListenerSettingsPort classSide >> selector [

	"Command listener settings is not a single setting, but a collection of them"
	^ nil
]

{ #category : #resolving }
EDASCommandListenerSettingsPort >> availableErrorStrategies [

	<edaPort: #commandListener as: 'Command listener'>
	self subclassResponsibility
]

{ #category : #testing }
EDASCommandListenerSettingsPort >> errorStrategy [

	self subclassResponsibility
]

{ #category : #testing }
EDASCommandListenerSettingsPort >> restartOnErrors [

	self subclassResponsibility
]
