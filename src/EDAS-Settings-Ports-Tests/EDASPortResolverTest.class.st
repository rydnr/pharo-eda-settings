Class {
	#name : #EDASPortResolverTest,
	#superclass : #TestCase,
	#category : #'EDAS-Settings-Ports-Tests'
}

{ #category : #tests }
EDASPortResolverTest >> testPortAdapterClassSymbol [

	| sut |
	sut := EDASPortResolver new.
	self
		assert: (sut portAdapterClassSymbol: #environment)
		equals: #environmentSettingsAdapterClass
]

{ #category : #tests }
EDASPortResolverTest >> testPortDescription [

	| sut |
	sut := EDASPortResolver new.
	self
		assert: (sut portDescription: EDASEnvironmentSettingsPort class)
		equals: #'pharoeda.settings.ports.environment.description'
]
