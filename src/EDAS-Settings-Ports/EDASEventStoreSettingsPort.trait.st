Trait {
	#name : #EDASEventStoreSettingsPort,
	#traits : 'EDASSettingsPort',
	#classTraits : 'EDASSettingsPort classTrait',
	#category : #'EDAS-Settings-Ports'
}

{ #category : #accessing }
EDASEventStoreSettingsPort classSide >> adapterAccessor [

	^ #eventStoreSettings
]

{ #category : #accessing }
EDASEventStoreSettingsPort classSide >> adapterClassAccessor [

	^ #eventStoreSettingsAdapterClass
]

{ #category : #accessing }
EDASEventStoreSettingsPort classSide >> changedEventName [

	^ EDASEventStoreSettingsChanged
]

{ #category : #metadata }
EDASEventStoreSettingsPort classSide >> edaPort [

	<edaPort: #'pharoeda.settings.ports.event_store.label'
	withDescription:
	#'pharoeda.settings.ports.event_store.description' icon:
	#eventstore atPosition: 3>
	^ self
]

{ #category : #accessing }
EDASEventStoreSettingsPort classSide >> portChangedEventName [

	^ EDASEventStoreSettingsPortChanged
]

{ #category : #testing }
EDASEventStoreSettingsPort classSide >> selector [

	"Event store settings is not a single setting, but a collection of them"

	^ nil
]
