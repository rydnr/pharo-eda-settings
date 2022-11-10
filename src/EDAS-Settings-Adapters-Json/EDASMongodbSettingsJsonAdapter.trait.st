Trait {
	#name : #EDASMongodbSettingsJsonAdapter,
	#traits : 'EDASSettingsJsonAdapter',
	#classTraits : 'EDASSettingsJsonAdapter classTrait',
	#category : #'EDAS-Settings-Adapters-Json'
}

{ #category : #'instance creation' }
EDASMongodbSettingsJsonAdapter classSide >> fromFile: aFileReference under: aLabel withApp: anEDAApplication [

	^ self
		  fromFile: aFileReference
		  under: aLabel
		  for: 'mongodb'
		  withApp: anEDAApplication
]
