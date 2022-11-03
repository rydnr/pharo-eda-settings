Class {
	#name : #EDASEnvironmentSwitchesToCommandListenerJsonAdapter,
	#superclass : #Object,
	#traits : 'EDASSettingsChangedListener',
	#classTraits : 'EDASSettingsChangedListener classTrait',
	#category : #'EDAS-Settings'
}

{ #category : #'event handling - private' }
EDASEnvironmentSwitchesToCommandListenerJsonAdapter class >> handleSettingsChangedEvent: anEvent [
 
		(EDASStompTopicListenerSettingsJsonAdapter supportsEnvironment:
			 anEvent newValue)
			ifTrue: [ 
				anEvent edaApplication portSettings commandListenerSettings:
					(EDASStompTopicListenerSettingsJsonAdapter
						 forEnvironment: anEvent newValue
						 withApp: anEvent edaApplication) ]
			ifFalse: [ 
				anEvent edaApplication portSettings commandListenerSettings:
					(EDASStompTopicListenerSettingsInMemoryAdapter withApp:
						 anEvent edaApplication) ]
]

{ #category : #helper }
EDASEnvironmentSwitchesToCommandListenerJsonAdapter class >> subscribeToSettingsChangedEventsIn: anEDASettingsAnnouncer [

	anEDASettingsAnnouncer when: EDASEnvironmentChanged do: [ :event |
		self handleSettingsChangedEvent: event ]
]
