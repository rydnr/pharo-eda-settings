Trait {
	#name : #EDASEventPublisherSettingsPort,
	#traits : 'EDASSettingsPort + EDASErrorStrategySettingsAdapter',
	#classTraits : 'EDASSettingsPort classTrait + EDASErrorStrategySettingsAdapter classTrait',
	#category : #'EDAS-Settings-Ports'
}

{ #category : #accessing }
EDASEventPublisherSettingsPort classSide >> adapterAccessor [

	^ #eventPublisherSettings
]

{ #category : #accessing }
EDASEventPublisherSettingsPort classSide >> adapterClassAccessor [

	^ #eventPublisherSettingsAdapterClass
]

{ #category : #accessing }
EDASEventPublisherSettingsPort classSide >> changedEventName [

	^ EDASEventPublisherSettingsChanged
]

{ #category : #testing }
EDASEventPublisherSettingsPort classSide >> edaPort [

	<edaPort: #'pharoeda.settings.ports.eventPublisher.label'
	withDescription:
	#'pharoeda.settings.ports.eventPublisher.description' icon:
	#eventpublisher atPosition: 3>
	^ self
]

{ #category : #accessing }
EDASEventPublisherSettingsPort classSide >> portChangedEventName [

	^ EDASEventPublisherSettingsPortChanged
]

{ #category : #accessing }
EDASEventPublisherSettingsPort classSide >> selector [

	"event publisher settings is not a single setting, but a collection of them"

	^ nil
]
