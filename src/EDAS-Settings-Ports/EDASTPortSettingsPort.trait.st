Trait {
	#name : #EDASTPortSettingsPort,
	#traits : 'EDASSettingsPort',
	#classTraits : 'EDASSettingsPort classTrait',
	#category : #'EDAS-Settings-Ports'
}

{ #category : #accessing }
EDASTPortSettingsPort >> edaApplication [
	self subclassResponsibility
]

{ #category : #accessing }
EDASTPortSettingsPort >> edaApplication: anEDAApplication [
	self subclassResponsibility
]

{ #category : #testing }
EDASTPortSettingsPort >> isReadOnly: aSymbol [
	^ false
]

{ #category : #testing }
EDASTPortSettingsPort >> supportsMultiple: aSymbol [
	^ false
]
