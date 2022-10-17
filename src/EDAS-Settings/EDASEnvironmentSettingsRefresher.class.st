Class {
	#name : #EDASEnvironmentSettingsRefresher,
	#superclass : #Object,
	#traits : 'EDASSettingsChangedListener + EDACSettingBrowserHelper',
	#classTraits : 'EDASSettingsChangedListener classTrait + EDACSettingBrowserHelper classTrait',
	#category : #'EDAS-Settings'
}

{ #category : #helper }
EDASEnvironmentSettingsRefresher class >> subscribeToSettingsChangedEventsIn: anEDASettingsAnnouncer [
	anEDASettingsAnnouncer
		when: EDASEnvironmentSettingsAdapterClassChanged
		do:
			[ :event | event edaApplication environmentSettingsPort: event newValue new. self refreshSettingBrowsers ]
]
