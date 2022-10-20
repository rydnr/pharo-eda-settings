Class {
	#name : #EDASPortSettingsPort,
	#superclass : #Object,
	#instVars : [
		'announcer',
		'environmentSettings',
		'environmentSettingsAdapterClass',
		'commandListenerSettings',
		'commandListenerAdapterClass'
	],
	#category : #'EDAS-Settings-Ports'
}

{ #category : #'instance creation' }
EDASPortSettingsPort class >> withAnnouncer: anEDASettingsAnnouncer [
	^ self new announcer: anEDASettingsAnnouncer; yourself
]

{ #category : #accessing }
EDASPortSettingsPort >> announcer [
	^ announcer
]

{ #category : #accessing }
EDASPortSettingsPort >> announcer: anObject [
	announcer := anObject
]

{ #category : #accessing }
EDASPortSettingsPort >> commandListenerAdapterClass [

	^ commandListenerAdapterClass
]

{ #category : #accessing }
EDASPortSettingsPort >> commandListenerAdapterClass: anObject [

	commandListenerAdapterClass := anObject
]

{ #category : #accessing }
EDASPortSettingsPort >> commandListenerSettings [

	^ commandListenerSettings ifNil: [ 
		  | result |
		  result := EDASPortResolver new resolveCommandListenerSettingsPort.
		  self commandListenerSettings: result.
		  result ]
]

{ #category : #accessing }
EDASPortSettingsPort >> commandListenerSettings: anObject [

	commandListenerSettings := anObject
]

{ #category : #accessing }
EDASPortSettingsPort >> environmentSettings [

	^ environmentSettings ifNil: [ 
		  | result |
		  result := EDASPortResolver new resolveEnvironmentSettingsPort.
		  self environmentSettings: result.
		  result ]
]

{ #category : #accessing }
EDASPortSettingsPort >> environmentSettings: anObject [

	environmentSettings := anObject
]

{ #category : #accessing }
EDASPortSettingsPort >> environmentSettingsAdapterClass [
	^ environmentSettingsAdapterClass
]

{ #category : #accessing }
EDASPortSettingsPort >> environmentSettingsAdapterClass: newValue [
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
