Class {
	#name : #EDASMongoEventStoreSettingsInMemoryAdapter,
	#superclass : #EDASMongoSettingsInMemoryAdapter,
	#traits : 'EDASEventStoreSettingsPort',
	#classTraits : 'EDASEventStoreSettingsPort classTrait',
	#category : #'EDAS-Settings-Adapters-InMemory'
}

{ #category : #testing }
EDASMongoEventStoreSettingsInMemoryAdapter class >> accepts: anEDAApplication [
	^ true
]

{ #category : #accessing }
EDASMongoEventStoreSettingsInMemoryAdapter class >> priority [
	^ 0
]
