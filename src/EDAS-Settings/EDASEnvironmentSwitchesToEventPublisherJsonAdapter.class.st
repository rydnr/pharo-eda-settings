Class {
	#name : #EDASEnvironmentSwitchesToEventPublisherJsonAdapter,
	#superclass : #Object,
	#traits : 'EDASSettingsChangedListener + EDASEnvironmentSwitchesToJsonAdapter',
	#classTraits : 'EDASSettingsChangedListener classTrait + EDASEnvironmentSwitchesToJsonAdapter classTrait',
	#category : #'EDAS-Settings'
}

{ #category : #'as yet unclassified' }
EDASEnvironmentSwitchesToEventPublisherJsonAdapter class >> handleEnvironmentChangedEvent: anEvent [

	^ self
		  handleEnvironmentChangedEvent: anEvent
		  forPort: EDASStompEventPublisherSettingsJsonAdapter
		  orElse: EDASStompEventPublisherSettingsInMemoryAdapter
]
