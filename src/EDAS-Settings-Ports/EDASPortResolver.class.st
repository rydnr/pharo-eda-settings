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
