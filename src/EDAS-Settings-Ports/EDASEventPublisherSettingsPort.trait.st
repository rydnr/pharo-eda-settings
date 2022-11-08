Trait {
	#name : #EDASEventPublisherSettingsPort,
	#traits : 'EDASSettingsPort',
	#classTraits : 'EDASSettingsPort classTrait',
	#category : #'EDAS-Settings-Ports'
}

{ #category : #accessing }
EDASEventPublisherSettingsPort classSide >> adapterClassAccessor [

	^ #eventPublisherSettingsAdapterClass
]

{ #category : #testing }
EDASEventPublisherSettingsPort classSide >> edaPort [

	<edaPort: #'pharoeda.settings.ports.event_publisher.label'
	withDescription:
	#'pharoeda.settings.ports.event_publisher.description' icon:
	#eventpublisher atPosition: 3>
	^ self
]

{ #category : #accessing }
EDASEventPublisherSettingsPort classSide >> selector [

	"Command listener settings is not a single setting, but a collection of them"

	^ nil
]
