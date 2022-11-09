Class {
	#name : #EDASEnvironmentSwitchesToEventPublisherJsonAdapter,
	#superclass : #Object,
	#traits : 'EDASEnvironmentSwitchesToJsonAdapter',
	#classTraits : 'EDASEnvironmentSwitchesToJsonAdapter classTrait',
	#category : #'EDAS-Settings'
}

{ #category : #'event handling - private' }
EDASEnvironmentSwitchesToEventPublisherJsonAdapter class >> handleEnvironmentChangedEvent: anEvent [

	^ self
		  handleEnvironmentChangedEvent: anEvent
		  forPort: EDASStompEventPublisherSettingsJsonAdapter
		  orElse: EDASStompEventPublisherSettingsInMemoryAdapter
]
