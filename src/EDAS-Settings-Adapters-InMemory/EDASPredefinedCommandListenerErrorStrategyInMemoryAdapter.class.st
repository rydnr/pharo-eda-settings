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

{ #category : #'as yet unclassified' }
EDASPredefinedCommandListenerErrorStrategyInMemoryAdapter class >> accepts: aPort inApp: anEDAApplication [

	^ aPort = EDASCommandListenerErrorStrategySettingsPort
]

{ #category : #resolving }
EDASPredefinedCommandListenerErrorStrategyInMemoryAdapter class >> availableStrategies [

	^ EDAEErrorHandlingStrategy subclasses collect: [ :s | s name ]
]

{ #category : #testing }
EDASPredefinedCommandListenerErrorStrategyInMemoryAdapter class >> description [

	^ #'pharoeda.settings.ports.commandListener.errorStrategy.predefined.description'
]

{ #category : #testing }
EDASPredefinedCommandListenerErrorStrategyInMemoryAdapter class >> label [

	^ #'pharoeda.settings.ports.commandListener.errorStrategy.predefined.label'
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
