Class {
	#name : #EDASPredefinedECommandListenerErrorStrategyInMemoryAdapter,
	#superclass : #Object,
	#traits : 'EDASCommandListenerSettingsErrorStrategyPort',
	#classTraits : 'EDASCommandListenerSettingsErrorStrategyPort classTrait',
	#instVars : [
		'strategy'
	],
	#category : #'EDAS-Settings-Adapters-InMemory'
}

{ #category : #testing }
EDASPredefinedECommandListenerErrorStrategyInMemoryAdapter class >> accepts: aPortResolver [
	^ true
]

{ #category : #resolving }
EDASPredefinedECommandListenerErrorStrategyInMemoryAdapter class >> availableStrategies [
	^ EDAErrorHandlingStrategy subclasses
]

{ #category : #testing }
EDASPredefinedECommandListenerErrorStrategyInMemoryAdapter class >> description [
	^ 'Predefined list'
]

{ #category : #resolving }
EDASPredefinedECommandListenerErrorStrategyInMemoryAdapter >> availableStrategies [
	^ self class availableStrategies 
]

{ #category : #accessing }
EDASPredefinedECommandListenerErrorStrategyInMemoryAdapter >> strategy [
	^ strategy ifNil: [ self strategy: self availableStrategies first. strategy ]
]

{ #category : #accessing }
EDASPredefinedECommandListenerErrorStrategyInMemoryAdapter >> strategy: anObject [
	strategy := anObject
]
