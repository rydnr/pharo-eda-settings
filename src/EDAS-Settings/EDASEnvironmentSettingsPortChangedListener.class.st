Class {
	#name : #EDASEnvironmentSettingsPortChangedListener,
	#superclass : #Object,
	#traits : 'EDASSettingsChangedListener',
	#classTraits : 'EDASSettingsChangedListener classTrait',
	#category : #'EDAS-Settings'
}

{ #category : #helper }
EDASEnvironmentSettingsPortChangedListener class >> handleEnvironmentSettingsPortChangedEvent: anEvent [

			anEvent newValue = EDASEnvironmentSettingsInMemoryAdapter ifTrue: [ 
				anEvent edaApplication portSettings commandListenerSettings:
					(EDASStompTopicListenerSettingsInMemoryAdapter withApp:
						 anEvent edaApplication) ]
]

{ #category : #helper }
EDASEnvironmentSettingsPortChangedListener class >> subscribeToSettingsChangedEventsIn: anEDASettingsAnnouncer [

	anEDASettingsAnnouncer
		when: EDASEnvironmentSettingsPortChanged
		do: [ :event |
			self handleEnvironmentSettingsPortChangedEvent: event ]
]
