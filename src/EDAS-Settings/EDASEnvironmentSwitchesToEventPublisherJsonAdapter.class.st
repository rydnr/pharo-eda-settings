Class {
	#name : #EDASEnvironmentSwitchesToEventPublisherJsonAdapter,
	#superclass : #Object,
	#traits : 'EDASEnvironmentSwitchesToJsonAdapter + EDASSettingsChangedListener',
	#classTraits : 'EDASEnvironmentSwitchesToJsonAdapter classTrait + EDASSettingsChangedListener classTrait',
	#category : #'EDAS-Settings'
}

{ #category : #'event handling - private' }
EDASEnvironmentSwitchesToEventPublisherJsonAdapter class >> handleEnvironmentChangedEvent: anEvent [

	| englishValue |
	englishValue := Locale current isoLanguage = 'en'
		                ifTrue: [ anEvent newValue ]
		                ifFalse: [ 
		                self translateToEnglish: anEvent newValue ].
	(EDASStompEventPublisherSettingsJsonAdapter supportsEnvironment:
		 englishValue forApp: anEvent edaApplication)
		ifTrue: [ 
			anEvent edaApplication portSettings eventPublisherSettings:
				(EDASStompEventPublisherSettingsJsonAdapter
					 forEnvironment: englishValue
					 withApp: anEvent edaApplication) ]
		ifFalse: [ 
			anEvent edaApplication portSettings eventPublisherSettings:
				(EDASStompEventPublisherSettingsInMemoryAdapter withApp:
					 anEvent edaApplication) ]
]

{ #category : #'event handling - private' }
EDASEnvironmentSwitchesToEventPublisherJsonAdapter class >> subscribeToSettingsChangedEventsIn: anEDASettingsAnnouncer [

	anEDASettingsAnnouncer
		when: EDASEnvironmentChanged
		do: [ :event | self handleEnvironmentChangedEvent: event ]
]
