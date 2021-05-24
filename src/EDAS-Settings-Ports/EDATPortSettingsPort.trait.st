Trait {
	#name : #EDATPortSettingsPort,
	#traits : 'EDATSettingsPort',
	#classTraits : 'EDATSettingsPort classTrait',
	#category : #'EDAS-Settings-Ports'
}

{ #category : #accessing }
EDATPortSettingsPort >> edaApplication [
	self subclassResponsibility
]

{ #category : #accessing }
EDATPortSettingsPort >> edaApplication: anEDAApplication [
	self subclassResponsibility
]

{ #category : #testing }
EDATPortSettingsPort >> isReadOnly: aSymbol [
	^ false
]

{ #category : #testing }
EDATPortSettingsPort >> supportsMultiple: aSymbol [
	^ false
]
