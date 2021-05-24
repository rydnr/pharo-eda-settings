Trait {
	#name : #EDATEnvVarAdapter,
	#category : #'EDAS-Settings-Adapters-EnvVars'
}

{ #category : #'environment-variables' }
EDATEnvVarAdapter >> getValueFor: envVarName orElse: defaultValue [
	^ OSPlatform current environment
		at: envVarName
		ifAbsent: defaultValue
]

{ #category : #testing }
EDATEnvVarAdapter >> isReadOnly: aSymbol [
	^ true
]

{ #category : #testing }
EDATEnvVarAdapter >> supportsMultiple: aSymbol [
	^ false
]
