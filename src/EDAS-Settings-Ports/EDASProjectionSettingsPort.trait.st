Trait {
	#name : #EDASProjectionSettingsPort,
	#traits : 'EDASSettingsPort',
	#classTraits : 'EDASSettingsPort classTrait',
	#category : #'EDAS-Settings-Ports'
}

{ #category : #accessing }
EDASProjectionSettingsPort >> concurrentSynchronization [ 
	self subclassResponsibility
]

{ #category : #accessing }
EDASProjectionSettingsPort >> enableSynchronization [
	self subclassResponsibility
]

{ #category : #accessing }
EDASProjectionSettingsPort >> headlessMode [
	self subclassResponsibility
]

{ #category : #accessing }
EDASProjectionSettingsPort >> strategy [
	self subclassResponsibility
]
