Class {
	#name : #EDASEnvironmentChangedListener,
	#superclass : #Object,
	#traits : 'EDASSettingsChangedListener',
	#classTraits : 'EDASSettingsChangedListener classTrait',
	#category : #'EDAS-Settings'
}

{ #category : #helper }
EDASEnvironmentChangedListener class >> subscribeToSettingsChangedEventsIn: anEDASettingsAnnouncer [

	anEDASettingsAnnouncer when: EDASEnvironmentChanged do: [ :event | 
		event edaApplication portSettings commandListenerSettings:
			(EDASStompTopicListenerSettingsJsonAdapter forEnvironment: event newValue withApp:
				 event edaApplication) ]
]
