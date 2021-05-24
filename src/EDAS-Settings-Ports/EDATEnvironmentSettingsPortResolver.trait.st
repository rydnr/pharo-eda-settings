Trait {
	#name : #EDATEnvironmentSettingsPortResolver,
	#traits : 'EDATPortResolver',
	#classTraits : 'EDATPortResolver classTrait',
	#category : #'EDAS-Settings-Ports'
}

{ #category : #api }
EDATEnvironmentSettingsPortResolver >> resolvePort [
	^ self resolveSettingsPort: EDATEnvironmentSettingsPort
]
