Class {
	#name : #EDASEnvironmentSwitchesToCommandListenerJsonAdapter,
	#superclass : #Object,
	#traits : 'EDASEnvironmentSwitchesToJsonAdapter + EDASSettingsChangedListener',
	#classTraits : 'EDASEnvironmentSwitchesToJsonAdapter classTrait + EDASSettingsChangedListener classTrait',
	#category : #'EDAS-Settings'
}

{ #category : #'as yet unclassified' }
EDASEnvironmentSwitchesToCommandListenerJsonAdapter class >> handleEnvironmentChangedEvent: anEvent [

	^ self handleEnvironmentChangedEvent: anEvent forPort: EDASStompCommandListenerSettingsJsonAdapter orElse: EDASStompCommandListenerSettingsInMemoryAdapter
]

{ #category : #'as yet unclassified' }
EDASEnvironmentSwitchesToCommandListenerJsonAdapter class >> subscribeToSettingsChangedEventsIn: anEDASettingsAnnouncer [

	anEDASettingsAnnouncer
		when: EDASEnvironmentChanged
		do: [ :event | self handleEnvironmentChangedEvent: event ]
]
