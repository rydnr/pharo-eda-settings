Class {
	#name : #EDASPortResolverTest,
	#superclass : #TestCase,
	#category : #'EDAS-Settings-Ports-Tests'
}

{ #category : #tests }
EDASPortResolverTest >> testAvailableAdaptersFor [

	| sut |
	sut := EDASPortResolver new.
	self
		assert: (sut availableAdaptersFor: #environment)
		equals:
		(OrderedCollection withAll: (sut availableAdaptersForPort: EDASEnvironmentSettingsPort))
]

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
		assert: (sut portDescription: #environment)
		equals: 'Environment'
]
