Class {
	#name : #EDASPortSettingsInMemoryAdapter,
	#superclass : #Object,
	#traits : 'EDASPortSettingsPort',
	#classTraits : 'EDASPortSettingsPort classTrait',
	#instVars : [
		'announcer',
		'environmentSettingsAdapterClass',
		'commandListenerSettingsAdapterClass',
		'edaApplication'
	],
	#category : #'EDAS-Settings-Adapters-InMemory'
}

{ #category : #'instance creation' }
EDASPortSettingsInMemoryAdapter class >> withAnnouncer: anEDASettingsAnnouncer [

	^ self new
		  announcer: anEDASettingsAnnouncer;
		edaApplication: anEDASettingsAnnouncer edaApplication;
		  yourself
]

{ #category : #accessing }
EDASPortSettingsInMemoryAdapter >> announcer [
	^ announcer
]

{ #category : #accessing }
EDASPortSettingsInMemoryAdapter >> announcer: anObject [
	announcer := anObject
]

{ #category : #accessing }
EDASPortSettingsInMemoryAdapter >> commandListenerSettingsAdapterClass [

	^ commandListenerSettingsAdapterClass ifNil: [ 
		  | t |
		  t := EDASPortResolver new resolvePort:
			       EDASCommandListenerSettingsPort forApp: self edaApplication.
		  self commandListenerSettingsAdapterClass: t.
		  t ]
]

{ #category : #accessing }
EDASPortSettingsInMemoryAdapter >> commandListenerSettingsAdapterClass: aClass [

	commandListenerSettingsAdapterClass := aClass
]

{ #category : #accessing }
EDASPortSettingsInMemoryAdapter >> edaApplication [

	^ edaApplication
]

{ #category : #accessing }
EDASPortSettingsInMemoryAdapter >> edaApplication: anObject [

	edaApplication := anObject
]

{ #category : #accessing }
EDASPortSettingsInMemoryAdapter >> environmentSettingsAdapterClass [

	^ environmentSettingsAdapterClass ifNil: [ 
		  | t |
		  t := EDASPortResolver new resolvePort:
			       EDASEnvironmentSettingsPort forApp: self edaApplication.
		  self environmentSettingsAdapterClass: t.
		  t ]
]

{ #category : #accessing }
EDASPortSettingsInMemoryAdapter >> environmentSettingsAdapterClass: newValue [
	| oldValue |
	oldValue := environmentSettingsAdapterClass.
	environmentSettingsAdapterClass := newValue.
	oldValue = newValue
		ifFalse: [ self announcer
				announce:
					(EDASEnvironmentChanged
						old: oldValue
						new: newValue
						on: self announcer edaApplication) ]
]
