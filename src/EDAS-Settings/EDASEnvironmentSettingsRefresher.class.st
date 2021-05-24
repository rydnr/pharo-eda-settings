Class {
	#name : #EDASEnvironmentSettingsRefresher,
	#superclass : #Object,
	#traits : 'EDASTSettingsChangedListener',
	#classTraits : 'EDASTSettingsChangedListener classTrait',
	#category : #'EDAS-Settings'
}

{ #category : #helper }
EDASEnvironmentSettingsRefresher class >> subscribeToSettingsChangedEventsIn: anEDASettingsAnnouncer [
	anEDASettingsAnnouncer
		when: EDAEnvironmentSettingsAdapterClassChanged
		do:
			[ :event | event edaApplication environmentSettingsPort: event newValue new. self refreshSettingBrowsers ]
]
