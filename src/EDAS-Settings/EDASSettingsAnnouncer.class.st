Class {
	#name : #EDASSettingsAnnouncer,
	#superclass : #Announcer,
	#instVars : [
		'edaApplication'
	],
	#category : #'EDAS-Settings'
}

{ #category : #'instance creation' }
EDASSettingsAnnouncer class >> forApp: anEDAApplication [
	^ self new
		edaApplication: anEDAApplication;
		yourself
]

{ #category : #accessing }
EDASSettingsAnnouncer >> edaApplication [
	^ edaApplication
]

{ #category : #accessing }
EDASSettingsAnnouncer >> edaApplication: anObject [
	edaApplication := anObject
]

{ #category : #initialization }
EDASSettingsAnnouncer >> initialize [
	super initialize.
	self setupListeners
]

{ #category : #initialization }
EDASSettingsAnnouncer >> setupListeners [
	EDASTSettingsChangedListener traitUsers
		do: [ :l | l subscribeToSettingsChangedEventsIn: self ]
]
