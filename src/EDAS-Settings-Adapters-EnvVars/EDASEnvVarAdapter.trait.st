Trait {
	#name : #EDASEnvVarAdapter,
	#category : #'EDAS-Settings-Adapters-EnvVars'
}

{ #category : #'environment-variables' }
EDASEnvVarAdapter >> getValueFor: envVarName orElse: defaultValue [
	^ OSPlatform current environment
		at: envVarName
		ifAbsent: defaultValue
]

{ #category : #testing }
EDASEnvVarAdapter >> isReadOnly: aSymbol [
	^ true
]

{ #category : #testing }
EDASEnvVarAdapter >> supportsMultiple: aSymbol [
	^ false
]
