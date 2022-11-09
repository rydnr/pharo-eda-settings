Trait {
	#name : #EDASStompSettingsPort,
	#category : #'EDAS-Settings-Ports'
}

{ #category : #resolving }
EDASStompSettingsPort classSide >> availableErrorStrategies [

	^ EDAEErrorHandlingStrategy subclasses collect: [ :s | 
		  s description translated -> s name ]
]

{ #category : #resolving }
EDASStompSettingsPort >> availableErrorStrategies [

	^ self class availableErrorStrategies
]
