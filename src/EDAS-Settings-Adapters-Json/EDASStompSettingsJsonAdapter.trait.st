Trait {
	#name : #EDASStompSettingsJsonAdapter,
	#traits : 'EDASSettingsJsonAdapter',
	#classTraits : 'EDASSettingsJsonAdapter classTrait',
	#category : #'EDAS-Settings-Adapters-Json'
}

{ #category : #'instance creation' }
EDASStompSettingsJsonAdapter classSide >> fromFile: aFileReference under: aLabel withApp: anEDAApplication [

	^ self fromFile: aFileReference under: aLabel for: 'stomp' withApp: anEDAApplication
]
