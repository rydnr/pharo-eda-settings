Class {
	#name : #EDASSettingBrowserRefresher,
	#superclass : #Object,
	#traits : 'EDACSettingBrowserHelper + EDASSettingsChangedListener',
	#classTraits : 'EDACSettingBrowserHelper classTrait + EDASSettingsChangedListener classTrait',
	#category : #'EDAS-Settings'
}

{ #category : #helper }
EDASSettingBrowserRefresher class >> subscribeToSettingsChangedEventsIn: anEDASettingsAnnouncer [

	anEDASettingsAnnouncer
		when: EDASSettingsChanged
		do: [ :event |
			self refreshSettingBrowsers ]
]
