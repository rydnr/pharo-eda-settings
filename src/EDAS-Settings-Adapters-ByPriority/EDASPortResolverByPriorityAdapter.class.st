Class {
	#name : #EDASPortResolverByPriorityAdapter,
	#superclass : #Object,
	#traits : 'EDASTPortSettingsPort + EDASByPriorityAdapter',
	#classTraits : 'EDASTPortSettingsPort classTrait + EDASByPriorityAdapter classTrait',
	#instVars : [
		'edaApplication'
	],
	#category : #'EDAS-Settings-Adapters-ByPriority'
}

{ #category : #testing }
EDASPortResolverByPriorityAdapter class >> description [
	^ 'Priority-based'
]

{ #category : #'as yet unclassified' }
EDASPortResolverByPriorityAdapter >> availableCommandListenerSettingsAdaptersForApp: anEDAApplication [

	^ self availableAdaptersForPort: EDASCommandListenerSettingsPort andApp: anEDAApplication
]

{ #category : #logic }
EDASPortResolverByPriorityAdapter >> availableEventPublisherSettingsAdaptersForApp: anEDAApplication [

	^ self availableAdaptersForPort: EDASEventPublisherSettingsPort andApp: anEDAApplication
]

{ #category : #logic }
EDASPortResolverByPriorityAdapter >> availableEventStoreSettingsAdaptersForApp: anEDAApplication [

	^ self availableAdaptersForPort: EDASEventStoreSettingsPort andApp: anEDAApplication
]

{ #category : #logic }
EDASPortResolverByPriorityAdapter >> availableLoggingSettingsAdaptersForApp: anEDAApplication [

	^ self availableAdaptersForPort: EDASLoggingSettingsPort andApp: anEDAApplication
]

{ #category : #logic }
EDASPortResolverByPriorityAdapter >> availableProjectionsSettingsAdaptersForApp: anEDAApplication [

	^ self availableAdaptersForPort: EDASProjectionsSettingsPort andApp: anEDAApplication
]

{ #category : #accessing }
EDASPortResolverByPriorityAdapter >> edaApplication [
	^ edaApplication
]

{ #category : #accessing }
EDASPortResolverByPriorityAdapter >> edaApplication: anEDAApplication [ 
 edaApplication := anEDAApplication 
]

{ #category : #logic }
EDASPortResolverByPriorityAdapter >> resolveCommandListenerSettingsPort [
	^ self resolvePort: EDASCommandListenerSettingsPort
]

{ #category : #logic }
EDASPortResolverByPriorityAdapter >> resolveEnvironmentSettingsPort [
	^ self resolvePort: EDASEnvironmentSettingsPort
]

{ #category : #logic }
EDASPortResolverByPriorityAdapter >> resolveEventPublisherSettingsPort [
	^ self resolvePort: EDASEventPublisherSettingsPort
]

{ #category : #logic }
EDASPortResolverByPriorityAdapter >> resolveEventStoreSettingsPort [
	^ self resolvePort: EDASEventStoreSettingsPort
]

{ #category : #logic }
EDASPortResolverByPriorityAdapter >> resolveLoggingSettingsPort [
	^ self resolvePort: EDASLoggingSettingsPort
]

{ #category : #logic }
EDASPortResolverByPriorityAdapter >> resolveProjectionsSettingsPort [
	^ self resolvePort: EDASProjectionsSettingsPort
]
