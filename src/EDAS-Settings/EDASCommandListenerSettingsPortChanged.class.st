Class {
	#name : #EDASCommandListenerSettingsPortChanged,
	#superclass : #EDASSettingsChanged,
	#category : #'EDAS-Settings'
}

{ #category : #accessing }
EDASCommandListenerSettingsPortChanged >> newAdapter [

	^ self newValue
]

{ #category : #accessing }
EDASCommandListenerSettingsPortChanged >> newAdapter: anObject [

	self newValue: anObject
]

{ #category : #accessing }
EDASCommandListenerSettingsPortChanged >> oldAdapter [

	^ self oldValue
]

{ #category : #accessing }
EDASCommandListenerSettingsPortChanged >> oldAdapter: anObject [

	self oldValue: anObject
]
