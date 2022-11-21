Class {
	#name : #EDASEnvironmentSwitchesToProjectionsJsonAdapter,
	#superclass : #Object,
	#traits : 'EDASEnvironmentSwitchesToJsonAdapter + EDASSettingsChangedListener',
	#classTraits : 'EDASEnvironmentSwitchesToJsonAdapter classTrait + EDASSettingsChangedListener classTrait',
	#category : #'EDAS-Settings'
}

{ #category : #'event handling - private' }
EDASEnvironmentSwitchesToProjectionsJsonAdapter class >> handleEnvironmentChangedEvent: anEvent [

	| englishValue |
	englishValue := Locale current isoLanguage = 'en'
		                ifTrue: [ anEvent newValue ]
		                ifFalse: [ 
		                self translateToEnglish: anEvent newValue ].
	(EDASMongodbProjectionsSettingsJsonAdapter supportsEnvironment:
		 englishValue forApp: anEvent edaApplication)
		ifTrue: [ 
			anEvent edaApplication portSettings projectionsSettings:
				(EDASMongodbProjectionsSettingsJsonAdapter
					 forEnvironment: englishValue
					 withApp: anEvent edaApplication) ]
		ifFalse: [ 
			anEvent edaApplication portSettings projectionsSettings:
				(EDASMongodbProjectionsSettingsInMemoryAdapter withApp:
					 anEvent edaApplication) ]
]

{ #category : #'event handling - private' }
EDASEnvironmentSwitchesToProjectionsJsonAdapter class >> subscribeToSettingsChangedEventsIn: anEDASettingsAnnouncer [

	anEDASettingsAnnouncer
		when: EDASEnvironmentChanged
		do: [ :event | self handleEnvironmentChangedEvent: event ]
]
