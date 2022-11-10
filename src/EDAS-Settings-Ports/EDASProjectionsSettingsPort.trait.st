Trait {
	#name : #EDASProjectionsSettingsPort,
	#traits : 'EDASSettingsPort',
	#classTraits : 'EDASSettingsPort classTrait',
	#category : #'EDAS-Settings-Ports'
}

{ #category : #accessing }
EDASProjectionsSettingsPort classSide >> adapterAccessor [

	^ #projectionSettings
]

{ #category : #accessing }
EDASProjectionsSettingsPort classSide >> adapterClassAccessor [

	^ #projectionsSettingsAdapterClass
]

{ #category : #accessing }
EDASProjectionsSettingsPort classSide >> changedEventName [

	^ EDASProjectionsSettingsChanged
]

{ #category : #metadata }
EDASProjectionsSettingsPort classSide >> edaPort [

	<edaPort: #'pharoeda.settings.ports.projections.label'
	withDescription:
	#'pharoeda.settings.ports.projections.description' icon:
	#projections atPosition: 5>
	^ self
]

{ #category : #accessing }
EDASProjectionsSettingsPort classSide >> portChangedEventName [

	^ EDASProjectionsSettingsPortChanged
]

{ #category : #testing }
EDASProjectionsSettingsPort classSide >> selector [

	"Projections settings is not a single setting, but a collection of them"

	^ nil
]
