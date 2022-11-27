Trait {
	#name : #EDASErrorStrategySettingsAdapter,
	#instVars : [
		'errorStrategyName',
		'errorStrategiesDict',
		'errorStrategiesReverseDict'
	],
	#traits : 'EDACReflectionHelper',
	#classTraits : 'EDACReflectionHelper classTrait',
	#category : #'EDAS-Settings-Ports'
}

{ #category : #accessing }
EDASErrorStrategySettingsAdapter >> errorStrategy [

	^ self classOrTraitNamed: self errorStrategyName
]

{ #category : #accessing }
EDASErrorStrategySettingsAdapter >> errorStrategyName [

	^ errorStrategyName ifNil: [ 
		  self errorStrategyName: errorStrategiesDict associations first value.
		errorStrategyName ]
]

{ #category : #accessing }
EDASErrorStrategySettingsAdapter >> errorStrategyName: anObject [

	errorStrategyName := anObject
]

{ #category : #initialization }
EDASErrorStrategySettingsAdapter >> initErrorStrategies [

	errorStrategiesDict := (EDAEErrorHandlingStrategy subclasses 
		                        collect: [ :s | s description -> s name ])
		                       asDictionary.
	errorStrategiesReverseDict := Dictionary new.
	errorStrategiesDict keysAndValuesDo: [ :k :v | 
		errorStrategiesReverseDict at: v put: k ]
]
