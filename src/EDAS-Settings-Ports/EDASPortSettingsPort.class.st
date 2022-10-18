Class {
	#name : #EDASPortSettingsPort,
	#superclass : #Object,
	#instVars : [
		'announcer',
		'environmentSettingsPort',
		'environmentSettingsAdapterClass',
		'commandListenerErrorStrategyAdapterClass',
		'commandListenerErrorStrategySettingsPort'
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
EDASPortSettingsPort >> commandListenerErrorStrategyAdapterClass [
	^ commandListenerErrorStrategyAdapterClass
]

{ #category : #accessing }
EDASPortSettingsPort >> commandListenerErrorStrategyAdapterClass: anObject [
	commandListenerErrorStrategyAdapterClass := anObject
]

{ #category : #accessing }
EDASPortSettingsPort >> commandListenerErrorStrategySettingsPort [

	^ commandListenerErrorStrategySettingsPort ifNil: [ 
		  | result |
		  result := EDASPortResolver new resolveCommandListenerErrorStrategySettingsPort.
		  self commandListenerErrorStrategySettingsPort: result.
		  result ]
]

{ #category : #accessing }
EDASPortSettingsPort >> commandListenerErrorStrategySettingsPort: anObject [

	commandListenerErrorStrategySettingsPort := anObject
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
					(EDASEnvironmentSettingsAdapterClassChanged
						old: oldValue
						new: newValue
						on: self announcer edaApplication) ]
]

{ #category : #accessing }
EDASPortSettingsPort >> environmentSettingsPort [
	^ environmentSettingsPort ifNil: [ | result | result := EDASPortResolver new resolveEnvironmentSettingsPort. self environmentSettingsPort: result. result ]
]

{ #category : #accessing }
EDASPortSettingsPort >> environmentSettingsPort: anObject [
	environmentSettingsPort := anObject
]
