Class {
	#name : #EDASEnvironmentSettingsAdapterClassChangedListener,
	#superclass : #Object,
	#traits : 'EDASSettingsChangedListener',
	#classTraits : 'EDASSettingsChangedListener classTrait',
	#category : #'EDAS-Settings'
}

{ #category : #helper }
EDASEnvironmentSettingsAdapterClassChangedListener class >> subscribeToSettingsChangedEventsIn: anEDASettingsAnnouncer [

	anEDASettingsAnnouncer
		when: EDASEnvironmentChanged
		do: [ :event | 
			event edaApplication environmentSettings: event newValue new.
			self halt.
			event newValue = EDASEnvironmentSettingsInMemoryAdapter ifTrue: [ 
				event edaApplication commandListenerSettings:
					EDASStompTopicListenerSettingsInMemoryAdapter new ] ]
]
