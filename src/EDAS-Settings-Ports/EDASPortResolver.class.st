Class {
	#name : #EDASPortResolver,
	#superclass : #Object,
	#traits : 'EDASTPortResolver',
	#classTraits : 'EDASTPortResolver classTrait',
	#instVars : [
		'environmentSettingsAdapterClass'
	],
	#category : #'EDAS-Settings-Ports'
}

{ #category : #accessing }
EDASPortResolver >> environmentSettingsAdapterClass [
	^ environmentSettingsAdapterClass
]

{ #category : #accessing }
EDASPortResolver >> environmentSettingsAdapterClass: aClass [
	environmentSettingsAdapterClass := aClass
]

{ #category : #logic }
EDASPortResolver >> resolveSettingsPort: aPort [

	| candidates candidate |
	candidates := (self availableAdapters: aPort) sorted.
	candidate := candidates
		             ifEmpty: [ nil ]
		             ifNotEmpty: [ :col | col first ].
	^ candidate ifNil: [ nil ] ifNotNil: [ :c | c new ]
]
