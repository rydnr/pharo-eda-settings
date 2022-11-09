Trait {
	#name : #EDASEnvironmentSwitchesToJsonAdapter,
	#category : #'EDAS-Settings'
}

{ #category : #'event handling - private' }
EDASEnvironmentSwitchesToJsonAdapter classSide >> handleEnvironmentChangedEvent: anEvent forPort: aClass orElse: anotherClass [

	| englishValue |
	englishValue := Locale current isoLanguage = 'en'
		                ifTrue: [ anEvent newValue ]
		                ifFalse: [ 
		                self translateToEnglish: anEvent newValue ].
	(aClass supportsEnvironment: englishValue)
		ifTrue: [ 
			anEvent edaApplication portSettings commandListenerSettings:
				(aClass
					 forEnvironment: englishValue
					 withApp: anEvent edaApplication) ]
		ifFalse: [ 
			anEvent edaApplication portSettings commandListenerSettings:
				(anotherClass withApp: anEvent edaApplication) ]
]

{ #category : #'event handling - private' }
EDASEnvironmentSwitchesToJsonAdapter classSide >> translateToEnglish: anEnvironment [

	| entry aux |
	entry := ('pharoeda.settings.ports.environment.predefined.translations.en.'
	          , anEnvironment) asSymbol.
	aux := entry translated.
	^ aux = entry
		  ifTrue: [ anEnvironment ]
		  ifFalse: [ aux ]
]
