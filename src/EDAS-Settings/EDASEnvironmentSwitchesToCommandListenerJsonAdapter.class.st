Class {
	#name : #EDASEnvironmentSwitchesToCommandListenerJsonAdapter,
	#superclass : #Object,
	#traits : 'EDASSettingsChangedListener',
	#classTraits : 'EDASSettingsChangedListener classTrait',
	#category : #'EDAS-Settings'
}

{ #category : #'event handling - private' }
EDASEnvironmentSwitchesToCommandListenerJsonAdapter class >> handleEnvironmentChangedEvent: anEvent [

	| englishValue |
	englishValue := Locale current isoLanguage = 'en'
		                ifTrue: [ anEvent newValue ]
		                ifFalse: [ 
		                self translateToEnglish: anEvent newValue ].
	(EDASStompTopicListenerSettingsJsonAdapter supportsEnvironment:
		 englishValue)
		ifTrue: [ 
			anEvent edaApplication portSettings commandListenerSettings:
				(EDASStompTopicListenerSettingsJsonAdapter
					 forEnvironment: englishValue
					 withApp: anEvent edaApplication) ]
		ifFalse: [ 
			anEvent edaApplication portSettings commandListenerSettings:
				(EDASStompTopicListenerSettingsInMemoryAdapter withApp:
					 anEvent edaApplication) ]
]

{ #category : #helper }
EDASEnvironmentSwitchesToCommandListenerJsonAdapter class >> subscribeToSettingsChangedEventsIn: anEDASettingsAnnouncer [

	anEDASettingsAnnouncer
		when: EDASEnvironmentChanged
		do: [ :event | self handleEnvironmentChangedEvent: event ]
]

{ #category : #'event handling - private' }
EDASEnvironmentSwitchesToCommandListenerJsonAdapter class >> translateToEnglish: anEnvironment [

	| entry aux |
	entry := ('pharoeda.settings.ports.environment.predefined.translations.en.', anEnvironment) asSymbol.
	aux := entry translated.
	^ aux = entry ifTrue: [ anEnvironment ] ifFalse: [ aux ]

	
]
