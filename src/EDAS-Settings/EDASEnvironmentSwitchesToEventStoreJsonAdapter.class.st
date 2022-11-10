Class {
	#name : #EDASEnvironmentSwitchesToEventStoreJsonAdapter,
	#superclass : #Object,
	#traits : 'EDASEnvironmentSwitchesToJsonAdapter + EDASSettingsChangedListener',
	#classTraits : 'EDASEnvironmentSwitchesToJsonAdapter classTrait + EDASSettingsChangedListener classTrait',
	#category : #'EDAS-Settings'
}

{ #category : #helper }
EDASEnvironmentSwitchesToEventStoreJsonAdapter class >> handleEnvironmentChangedEvent: anEvent [

	| englishValue |
	englishValue := Locale current isoLanguage = 'en'
		                ifTrue: [ anEvent newValue ]
		                ifFalse: [ 
		                self translateToEnglish: anEvent newValue ].
	(EDASMongodbEventStoreSettingsJsonAdapter supportsEnvironment:
		 englishValue)
		ifTrue: [ 
			anEvent edaApplication portSettings eventStoreSettings:
				(EDASMongodbEventStoreSettingsJsonAdapter
					 forEnvironment: englishValue
					 withApp: anEvent edaApplication) ]
		ifFalse: [ 
			anEvent edaApplication portSettings eventStoreSettings:
				(EDASMongodbEventStoreSettingsInMemoryAdapter withApp:
					 anEvent edaApplication) ]
]

{ #category : #helper }
EDASEnvironmentSwitchesToEventStoreJsonAdapter class >> subscribeToSettingsChangedEventsIn: anEDASettingsAnnouncer [

	anEDASettingsAnnouncer
		when: EDASEnvironmentChanged
		do: [ :event | self handleEnvironmentChangedEvent: event ]
]
