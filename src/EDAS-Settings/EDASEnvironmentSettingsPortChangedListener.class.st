Class {
	#name : #EDASEnvironmentSettingsPortChangedListener,
	#superclass : #Object,
	#traits : 'EDASSettingsChangedListener',
	#classTraits : 'EDASSettingsChangedListener classTrait',
	#category : #'EDAS-Settings'
}

{ #category : #helper }
EDASEnvironmentSettingsPortChangedListener class >> subscribeToSettingsChangedEventsIn: anEDASettingsAnnouncer [

	anEDASettingsAnnouncer
		when: EDASEnvironmentSettingsPortChanged
		do: [ :event | 
			event newValue = EDASEnvironmentSettingsInMemoryAdapter ifTrue: [ 
				event edaApplication portSettings commandListenerSettings:
					EDASStompTopicListenerSettingsInMemoryAdapter new ] ]
]
