Class {
	#name : #EDASEnvironmentSwitchesToLoggingJsonAdapter,
	#superclass : #Object,
	#traits : 'EDASEnvironmentSwitchesToJsonAdapter + EDASSettingsChangedListener',
	#classTraits : 'EDASEnvironmentSwitchesToJsonAdapter classTrait + EDASSettingsChangedListener classTrait',
	#category : #'EDAS-Settings'
}

{ #category : #helper }
EDASEnvironmentSwitchesToLoggingJsonAdapter class >> handleEnvironmentChangedEvent: anEvent [

	| englishValue |
	englishValue := Locale current isoLanguage = 'en'
		                ifTrue: [ anEvent newValue ]
		                ifFalse: [ 
		                self translateToEnglish: anEvent newValue ].
	(EDASLoggingSettingsJsonAdapter supportsEnvironment: englishValue forApp: anEvent edaApplication)
		ifTrue: [ 
			anEvent edaApplication portSettings loggingSettings:
				(EDASLoggingSettingsJsonAdapter
					 forEnvironment: englishValue
					 withApp: anEvent edaApplication) ]
		ifFalse: [ 
			anEvent edaApplication portSettings loggingSettings:
				(EDASLoggingSettingsInMemoryAdapter withApp:
					 anEvent edaApplication) ]
]

{ #category : #helper }
EDASEnvironmentSwitchesToLoggingJsonAdapter class >> subscribeToSettingsChangedEventsIn: anEDASettingsAnnouncer [

	anEDASettingsAnnouncer
		when: EDASEnvironmentChanged
		do: [ :event | self handleEnvironmentChangedEvent: event ]
]
