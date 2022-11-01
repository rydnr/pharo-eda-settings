Class {
	#name : #EDASPredefinedCommandListenerErrorStrategyInMemoryAdapter,
	#superclass : #Object,
	#traits : 'EDASCommandListenerErrorStrategySettingsPort',
	#classTraits : 'EDASCommandListenerErrorStrategySettingsPort classTrait',
	#instVars : [
		'strategyName',
		'edaApplication'
	],
	#category : #'EDAS-Settings-Adapters-InMemory'
}

{ #category : #testing }
EDASPredefinedCommandListenerErrorStrategyInMemoryAdapter class >> accepts: aPort [

	^ aPort = EDASCommandListenerErrorStrategySettingsPort 
]

{ #category : #resolving }
EDASPredefinedCommandListenerErrorStrategyInMemoryAdapter class >> availableStrategies [

	^ EDAEErrorHandlingStrategy subclasses collect: [ :s | s name ]
]

{ #category : #testing }
EDASPredefinedCommandListenerErrorStrategyInMemoryAdapter class >> description [

	^ 'Predefined list or error handling strategies for incoming commands'
]

{ #category : #resolving }
EDASPredefinedCommandListenerErrorStrategyInMemoryAdapter >> availableStrategies [
	^ self class availableStrategies 
]

{ #category : #accessing }
EDASPredefinedCommandListenerErrorStrategyInMemoryAdapter >> edaApplication [

	^ edaApplication
]

{ #category : #accessing }
EDASPredefinedCommandListenerErrorStrategyInMemoryAdapter >> edaApplication: anObject [

	edaApplication := anObject
]

{ #category : #accessing }
EDASPredefinedCommandListenerErrorStrategyInMemoryAdapter >> strategy [

	^ Smalltalk at: self strategyName asSymbol
]

{ #category : #accessing }
EDASPredefinedCommandListenerErrorStrategyInMemoryAdapter >> strategyName [

	^ strategyName
]

{ #category : #accessing }
EDASPredefinedCommandListenerErrorStrategyInMemoryAdapter >> strategyName: anObject [

	strategyName := anObject
]
