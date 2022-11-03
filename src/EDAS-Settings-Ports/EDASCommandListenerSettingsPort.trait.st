Trait {
	#name : #EDASCommandListenerSettingsPort,
	#traits : 'EDASSettingsPort',
	#classTraits : 'EDASSettingsPort classTrait',
	#category : #'EDAS-Settings-Ports'
}

{ #category : #accessing }
EDASCommandListenerSettingsPort classSide >> adapterClassAccessor [

	^ #commandListenerSettingsAdapterClass
]

{ #category : #testing }
EDASCommandListenerSettingsPort classSide >> description [
	^ 'Command listener'
]

{ #category : #testing }
EDASCommandListenerSettingsPort classSide >> label [

	^ 'Command listener'
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

{ #category : #accessing }
EDASCommandListenerSettingsPort >> port [

	<edaPort: 'Command listener' atPosition: 2>
	^ self
]

{ #category : #testing }
EDASCommandListenerSettingsPort >> restartOnErrors [

	self subclassResponsibility
]
