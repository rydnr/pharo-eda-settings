Class {
	#name : #EDASSettingBrowserRefresher,
	#superclass : #Object,
	#traits : 'EDACSettingBrowserHelper',
	#classTraits : 'EDACSettingBrowserHelper classTrait',
	#category : #'EDAS-Settings'
}

{ #category : #helper }
EDASSettingBrowserRefresher class >> subscribeToSettingsChangedEventsIn: anEDASettingsAnnouncer [

	anEDASettingsAnnouncer
		when: EDASSettingsChanged
		do: [ :event |
			self refreshSettingBrowsers ]
]
