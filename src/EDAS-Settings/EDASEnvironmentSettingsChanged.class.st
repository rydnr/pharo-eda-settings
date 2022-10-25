Class {
	#name : #EDASEnvironmentSettingsChanged,
	#superclass : #EDASSettingsChanged,
	#category : #'EDAS-Settings'
}

{ #category : #accessing }
EDASEnvironmentSettingsChanged >> newAdapter [

	^ self newValue
]

{ #category : #accessing }
EDASEnvironmentSettingsChanged >> newAdapter: anObject [

	self newValue: anObject
]

{ #category : #accessing }
EDASEnvironmentSettingsChanged >> oldAdapter [

	^ self oldValue
]

{ #category : #accessing }
EDASEnvironmentSettingsChanged >> oldAdapter: anObject [

	self oldValue: anObject
]
