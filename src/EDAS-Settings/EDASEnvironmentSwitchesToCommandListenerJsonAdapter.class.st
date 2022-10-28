Class {
	#name : #EDASEnvironmentSwitchesToCommandListenerJsonAdapter,
	#superclass : #Object,
	#traits : 'EDASSettingsChangedListener',
	#classTraits : 'EDASSettingsChangedListener classTrait',
	#category : #'EDAS-Settings'
}

{ #category : #helper }
EDASEnvironmentSwitchesToCommandListenerJsonAdapter class >> subscribeToSettingsChangedEventsIn: anEDASettingsAnnouncer [

	anEDASettingsAnnouncer when: EDASEnvironmentChanged do: [ :event | 
		(EDASStompTopicListenerSettingsJsonAdapter supportsEnvironment:
			 event newValue)
			ifTrue: [ 
				event edaApplication portSettings commandListenerSettings:
					(EDASStompTopicListenerSettingsJsonAdapter
						 forEnvironment: event newValue
						 withApp: event edaApplication) ]
			ifFalse: [ 
				event edaApplication portSettings commandListenerSettings:
					(EDASStompTopicListenerSettingsInMemoryAdapter withApp: event edaApplication) ] ]
]
