Trait {
	#name : #EDASCommandListenerSettingsPort,
	#traits : 'EDASSettingsPort',
	#classTraits : 'EDASSettingsPort classTrait',
	#category : #'EDAS-Settings-Ports'
}

{ #category : #testing }
EDASCommandListenerSettingsPort classSide >> description [
	^ 'Command listener'
]

{ #category : #testing }
EDASCommandListenerSettingsPort classSide >> label [

	^ 'Command listener'
]

{ #category : #metadata }
EDASCommandListenerSettingsPort classSide >> selector [
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
