Class {
	#name : #EDASInitializeNewlyRegisteredApplication,
	#superclass : #Object,
	#category : #'EDAS-Settings'
}

{ #category : #helper }
EDASInitializeNewlyRegisteredApplication >> onApplicationRegistered: anEvent [

	EDASSettings open; delete
]

{ #category : #helper }
EDASInitializeNewlyRegisteredApplication >> setupAnnouncer: anAnnouncer [

	anAnnouncer ifNotNil: [ :announcer | 
		announcer
			when: EDAApplicationRegistered
			do: [ :event | self onApplicationRegistered: event ] ]
]
