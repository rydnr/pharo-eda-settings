Class {
	#name : #EDASEnvironmentSwitchesToEventPublisherJsonAdapter,
	#superclass : #Object,
	#traits : 'EDASEnvironmentSwitchesToJsonAdapter + EDASSettingsChangedListener',
	#classTraits : 'EDASEnvironmentSwitchesToJsonAdapter classTrait + EDASSettingsChangedListener classTrait',
	#category : #'EDAS-Settings'
}

{ #category : #'as yet unclassified' }
EDASEnvironmentSwitchesToEventPublisherJsonAdapter class >> handleEnvironmentChangedEvent: anEvent [

	^ self
		  handleEnvironmentChangedEvent: anEvent
		  forPort: EDASStompEventPublisherSettingsJsonAdapter
		  orElse: EDASStompEventPublisherSettingsInMemoryAdapter
]

{ #category : #'as yet unclassified' }
EDASEnvironmentSwitchesToEventPublisherJsonAdapter class >> subscribeToSettingsChangedEventsIn: anEDASettingsAnnouncer [

	anEDASettingsAnnouncer
		when: EDASEnvironmentChanged
		do: [ :event | self handleEnvironmentChangedEvent: event ]
]
