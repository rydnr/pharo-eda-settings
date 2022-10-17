Trait {
	#name : #EDASEnvironmentSettingsPortResolver,
	#traits : 'EDASTPortResolver',
	#classTraits : 'EDASTPortResolver classTrait',
	#category : #'EDAS-Settings-Ports'
}

{ #category : #api }
EDASEnvironmentSettingsPortResolver >> resolvePort [
	^ self resolveSettingsPort: EDASEnvironmentSettingsPort
]
