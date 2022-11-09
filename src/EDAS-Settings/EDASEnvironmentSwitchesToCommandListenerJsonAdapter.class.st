Class {
	#name : #EDASEnvironmentSwitchesToCommandListenerJsonAdapter,
	#superclass : #Object,
	#traits : 'EDASEnvironmentSwitchesToJsonAdapter + EDASSettingsChangedListener',
	#classTraits : 'EDASEnvironmentSwitchesToJsonAdapter classTrait + EDASSettingsChangedListener classTrait',
	#category : #'EDAS-Settings'
}

{ #category : #'event handling - private' }
EDASEnvironmentSwitchesToCommandListenerJsonAdapter class >> handleEnvironmentChangedEvent: anEvent [

	| englishValue |
	englishValue := Locale current isoLanguage = 'en'
		                ifTrue: [ anEvent newValue ]
		                ifFalse: [ 
		                self translateToEnglish: anEvent newValue ].
	(EDASStompCommandListenerSettingsJsonAdapter supportsEnvironment: englishValue)
		ifTrue: [ 
			anEvent edaApplication portSettings commandListenerSettings:
				(EDASStompCommandListenerSettingsJsonAdapter
					 forEnvironment: englishValue
					 withApp: anEvent edaApplication) ]
		ifFalse: [ 
			anEvent edaApplication portSettings commandListenerSettings:
				(EDASStompCommandListenerSettingsInMemoryAdapter withApp: anEvent edaApplication) ]
]

{ #category : #'as yet unclassified' }
EDASEnvironmentSwitchesToCommandListenerJsonAdapter class >> subscribeToSettingsChangedEventsIn: anEDASettingsAnnouncer [

	anEDASettingsAnnouncer
		when: EDASEnvironmentChanged
		do: [ :event | self handleEnvironmentChangedEvent: event ]
]
