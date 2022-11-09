Class {
	#name : #EDASEnvironmentSwitchesToCommandListenerJsonAdapter,
	#superclass : #Object,
	#traits : 'EDASEnvironmentSwitchesToJsonAdapter',
	#classTraits : 'EDASEnvironmentSwitchesToJsonAdapter classTrait',
	#category : #'EDAS-Settings'
}

{ #category : #'event handling - private' }
EDASEnvironmentSwitchesToCommandListenerJsonAdapter class >> handleEnvironmentChangedEvent: anEvent [

	^ self handleEnvironmentChangedEvent: anEvent forPort: EDASStompCommandListenerSettingsJsonAdapter orElse: EDASStompCommandListenerSettingsInMemoryAdapter
]
