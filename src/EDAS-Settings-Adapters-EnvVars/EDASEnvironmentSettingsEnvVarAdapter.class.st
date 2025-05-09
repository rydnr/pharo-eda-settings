Class {
	#name : #EDASEnvironmentSettingsEnvVarAdapter,
	#superclass : #Object,
	#traits : 'EDASEnvironmentSettingsPort + EDASEnvVarAdapter',
	#classTraits : 'EDASEnvironmentSettingsPort classTrait + EDASEnvVarAdapter classTrait',
	#instVars : [
		'edaApplication'
	],
	#category : #'EDAS-Settings-Adapters-EnvVars'
}

{ #category : #testing }
EDASEnvironmentSettingsEnvVarAdapter class >> accepts: aPort inApp: anEDAApplication [

	^ aPort = EDASEnvironmentSettingsPort and: [ 
		  (self getValueFor: self environmentVariableName orElse: nil)
			  ifNil: [ false ]
			  ifNotNil: [ :arg | true ] ]
]

{ #category : #metadata }
EDASEnvironmentSettingsEnvVarAdapter class >> description [
	^ self environmentVariableName , ' environment variable'
]

{ #category : #testing }
EDASEnvironmentSettingsEnvVarAdapter class >> environmentVariableName [
	^ 'EDA_ENV'
]

{ #category : #accessing }
EDASEnvironmentSettingsEnvVarAdapter class >> priority [
	^ 50
]

{ #category : #'as yet unclassified' }
EDASEnvironmentSettingsEnvVarAdapter >> availableEnvironments [ 
	^ OrderedCollection with: (self currentEnvironment)
]

{ #category : #testing }
EDASEnvironmentSettingsEnvVarAdapter >> currentEnvironment [
	^ self getValueFor: self environmentVariableName orElse: '(' , self environmentVariableName , ' not set)'
]

{ #category : #testing }
EDASEnvironmentSettingsEnvVarAdapter >> description [
	^ self environmentVariableName , ' environment variable'
]

{ #category : #accessing }
EDASEnvironmentSettingsEnvVarAdapter >> edaApplication [
	^ edaApplication
]

{ #category : #accessing }
EDASEnvironmentSettingsEnvVarAdapter >> edaApplication: anEDAApplication [
	edaApplication := anEDAApplication
]

{ #category : #testing }
EDASEnvironmentSettingsEnvVarAdapter >> environmentVariableName [
	^ self class environmentVariableName
]

{ #category : #testing }
EDASEnvironmentSettingsEnvVarAdapter >> values: aSymbol [

	^ false
]
