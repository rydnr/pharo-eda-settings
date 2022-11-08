Class {
	#name : #EDASMongoProjectionSettingsInMemoryAdapter,
	#superclass : #EDASMongoSettingsInMemoryAdapter,
	#classTraits : 'EDASProjectionSettingsPort classTrait',
	#instVars : [
		'concurrentSynchronization',
		'headlessMode',
		'strategy',
		'projectionSynchronizationEnabled'
	],
	#category : #'EDAS-Settings-Adapters-InMemory'
}

{ #category : #testing }
EDASMongoProjectionSettingsInMemoryAdapter class >> accepts: anEDAApplication [
	^ true
]

{ #category : #accessing }
EDASMongoProjectionSettingsInMemoryAdapter class >> priority [
	^ 0
]

{ #category : #accessing }
EDASMongoProjectionSettingsInMemoryAdapter >> concurrentSynchronization [
	^ concurrentSynchronization
]

{ #category : #accessing }
EDASMongoProjectionSettingsInMemoryAdapter >> concurrentSynchronization: aBoolean [
	concurrentSynchronization := aBoolean
]

{ #category : #accessing }
EDASMongoProjectionSettingsInMemoryAdapter >> headlessMode [
	^ headlessMode
]

{ #category : #accessing }
EDASMongoProjectionSettingsInMemoryAdapter >> headlessMode: aBoolean [
	headlessMode := aBoolean
]

{ #category : #accessing }
EDASMongoProjectionSettingsInMemoryAdapter >> projectionSynchronizationEnabled [
	^ projectionSynchronizationEnabled
]

{ #category : #accessing }
EDASMongoProjectionSettingsInMemoryAdapter >> projectionSynchronizationEnabled: aBoolean [
	projectionSynchronizationEnabled := aBoolean
]

{ #category : #accessing }
EDASMongoProjectionSettingsInMemoryAdapter >> strategy [
	^ strategy
]

{ #category : #accessing }
EDASMongoProjectionSettingsInMemoryAdapter >> strategy: aStrategy [
	strategy := aStrategy
]
