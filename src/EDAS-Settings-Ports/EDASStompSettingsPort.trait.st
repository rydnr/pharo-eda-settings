Trait {
	#name : #EDASStompSettingsPort,
	#traits : 'EDASSettingsPort',
	#classTraits : 'EDASSettingsPort classTrait',
	#category : #'EDAS-Settings-Ports'
}

{ #category : #resolving }
EDASStompSettingsPort classSide >> availableErrorStrategies [

	^ EDAEErrorHandlingStrategy subclasses collect: [ :s | s name ]
]

{ #category : #resolving }
EDASStompSettingsPort >> availableErrorStrategies [

	^ self class availableErrorStrategies
]

{ #category : #settings }
EDASStompSettingsPort >> descriptionFor: aString [ 
	^ aString
]

{ #category : #settings }
EDASStompSettingsPort >> labelFor: aString [ 
	^ aString
]

{ #category : #resolving }
EDASStompSettingsPort >> values: aSymbol [

	aSymbol = #errorStrategyName
		ifTrue: [ ^ self availableErrorStrategies ]
		ifFalse: [ ^ OrderedCollection new ]
]
