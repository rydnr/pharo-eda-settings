Trait {
	#name : #EDASLoggingSettingsPort,
	#traits : 'EDASSettingsPort',
	#classTraits : 'EDASSettingsPort classTrait',
	#category : #'EDAS-Settings-Ports'
}

{ #category : #accessing }
EDASLoggingSettingsPort classSide >> adapterAccessor [

	^ #loggingSettings
]

{ #category : #accessing }
EDASLoggingSettingsPort classSide >> adapterClassAccessor [

	^ #loggingSettingsAdapterClass
]

{ #category : #accessing }
EDASLoggingSettingsPort classSide >> changedEventName [

	^ EDASLoggingSettingsChanged
]

{ #category : #metadata }
EDASLoggingSettingsPort classSide >> edaPort [

	<edaPort: #'pharoeda.settings.ports.logging.label'
	withDescription:
	#'pharoeda.settings.ports.logging.description' icon:
	#logging atPosition: 6>
	^ self
]

{ #category : #accessing }
EDASLoggingSettingsPort classSide >> portChangedEventName [

	^ EDASLoggingSettingsPortChanged
]

{ #category : #metadata }
EDASLoggingSettingsPort classSide >> selector [

	"Logging settings is not a single setting, but a collection of them"

	^ nil
]

{ #category : #testing }
EDASLoggingSettingsPort >> loggingLevel [
	self subclassResponsibility
]
