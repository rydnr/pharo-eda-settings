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
		when: EDASEnvironmentSettingsAdapterClassChanged
		do:
			[ :event | event edaApplication environmentSettingsPort: event newValue new ]
]
