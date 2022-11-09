Trait {
	#name : #EDASEnvironmentSwitchesToJsonAdapter,
	#category : #'EDAS-Settings'
}

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
