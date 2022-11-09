Class {
	#name : #EDASEnvironmentSwitchesToCommandListenerJsonAdapter,
	#superclass : #Object,
	#traits : 'EDASSettingsChangedListener + EDASEnvironmentSwitchesToJsonAdapter',
	#classTraits : 'EDASSettingsChangedListener classTrait + EDASEnvironmentSwitchesToJsonAdapter classTrait',
	#category : #'EDAS-Settings'
}

{ #category : #'as yet unclassified' }
EDASEnvironmentSwitchesToCommandListenerJsonAdapter class >> handleEnvironmentChangedEvent: anEvent [

	^ self handleEnvironmentChangedEvent: anEvent forPort: EDASStompCommandListenerSettingsJsonAdapter orElse: EDASStompCommandListenerSettingsInMemoryAdapter
]
