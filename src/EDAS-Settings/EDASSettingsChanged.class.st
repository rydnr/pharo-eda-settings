Class {
	#name : #EDASSettingsChanged,
	#superclass : #Announcement,
	#instVars : [
		'oldValue',
		'newValue',
		'edaApplication'
	],
	#category : #'EDAS-Settings'
}

{ #category : #'instance creation' }
EDASSettingsChanged class >> old: anOldValue new: aNewValue on: anEDAApplication [
	^ self new
		oldValue: anOldValue;
		newValue: aNewValue;
		edaApplication: anEDAApplication;
		yourself
]

{ #category : #accessing }
EDASSettingsChanged >> edaApplication [
	^ edaApplication
]

{ #category : #accessing }
EDASSettingsChanged >> edaApplication: anEDAApplication [
	edaApplication := anEDAApplication 
]

{ #category : #accessing }
EDASSettingsChanged >> newValue [
	^ newValue
]

{ #category : #accessing }
EDASSettingsChanged >> newValue: anObject [
	newValue := anObject
]

{ #category : #accessing }
EDASSettingsChanged >> oldValue [
	^ oldValue
]

{ #category : #accessing }
EDASSettingsChanged >> oldValue: anObject [
	oldValue := anObject
]
