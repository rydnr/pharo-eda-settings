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

{ #category : #logic }
EDASPortResolverByPriorityAdapter >> availableCommandListenerSettingsAdapters [
	^ self availableAdapters: EDASCommandListenerSettingsPort
]

{ #category : #logic }
EDASPortResolverByPriorityAdapter >> availableEventPublisherSettingsAdapters [
	^ self availableAdapters: EDASEventPublisherSettingsPort
]

{ #category : #logic }
EDASPortResolverByPriorityAdapter >> availableEventStoreSettingsAdapters [
	^ self availableAdapters: EDASEventStoreSettingsPort
]

{ #category : #logic }
EDASPortResolverByPriorityAdapter >> availableLoggingSettingsAdapters [
	^ self availableAdapters: EDASLoggingSettingsPort
]

{ #category : #logic }
EDASPortResolverByPriorityAdapter >> availableProjectionSettingsAdapters [
	^ self availableAdapters: EDASProjectionSettingsPort
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
EDASPortResolverByPriorityAdapter >> resolveProjectionSettingsPort [
	^ self resolvePort: EDASProjectionSettingsPort
]
