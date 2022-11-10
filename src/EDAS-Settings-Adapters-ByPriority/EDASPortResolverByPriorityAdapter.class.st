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
EDASPortResolverByPriorityAdapter >> availableCommandListenerSettingsAdapters [
	^ self availableAdaptersForPort: EDASCommandListenerSettingsPort
]

{ #category : #logic }
EDASPortResolverByPriorityAdapter >> availableEventPublisherSettingsAdapters [
	^ self availableAdaptersForPort: EDASEventPublisherSettingsPort
]

{ #category : #logic }
EDASPortResolverByPriorityAdapter >> availableEventStoreSettingsAdapters [
	^ self availableAdaptersForPort: EDASEventStoreSettingsPort
]

{ #category : #logic }
EDASPortResolverByPriorityAdapter >> availableLoggingSettingsAdapters [
	^ self availableAdaptersForPort: EDASLoggingSettingsPort
]

{ #category : #logic }
EDASPortResolverByPriorityAdapter >> availableProjectionsSettingsAdapters [
	^ self availableAdaptersForPort: EDASProjectionsSettingsPort
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
