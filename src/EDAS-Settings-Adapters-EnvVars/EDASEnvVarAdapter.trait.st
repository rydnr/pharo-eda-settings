Trait {
	#name : #EDASEnvVarAdapter,
	#category : #'EDAS-Settings-Adapters-EnvVars'
}

{ #category : #'environment-variables' }
EDASEnvVarAdapter classSide >> getValueFor: envVarName orElse: defaultValue [
	^ OSPlatform current environment
		at: envVarName
		ifAbsent: defaultValue
]

{ #category : #'environment-variables' }
EDASEnvVarAdapter >> getValueFor: envVarName orElse: defaultValue [
	^ self class getValueFor: envVarName orElse: defaultValue 
]
