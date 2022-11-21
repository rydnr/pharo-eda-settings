Trait {
	#name : #EDASMongodbEventStoreSettingsAdapter,
	#category : #'EDAS-Settings-Ports'
}

{ #category : #building }
EDASMongodbEventStoreSettingsAdapter >> buildAdapter [

	^ EDAAMongoEventStore
		  withConfig: self
		  forApplication: self edaApplication
]
