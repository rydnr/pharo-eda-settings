Trait {
	#name : #EDASSettingsPort,
	#category : #'EDAS-Settings-Ports'
}

{ #category : #testing }
EDASSettingsPort classSide >> < anotherAdapterClass [
	^ self priority < anotherAdapterClass priority
]

{ #category : #testing }
EDASSettingsPort classSide >> <= anotherAdapterClass [
	^ self priority = anotherAdapterClass priority
		or: [ self < anotherAdapterClass ]
]

{ #category : #testing }
EDASSettingsPort classSide >> > anotherAdapterClass [
	^ anotherAdapterClass priority < self priority
]

{ #category : #testing }
EDASSettingsPort classSide >> >= anotherAdapterClass [
	^ self priority = anotherAdapterClass priority
		or: [ anotherAdapterClass < self ]
]

{ #category : #testing }
EDASSettingsPort classSide >> accepts: aPortResolver [
	^ false
]

{ #category : #testing }
EDASSettingsPort classSide >> description [
	self subclassResponsibility 
]

{ #category : #accessing }
EDASSettingsPort classSide >> priority [
	self shouldBeImplemented 
]

{ #category : #testing }
EDASSettingsPort classSide >> withApp: anEDAApplication [
	^ self new
		edaApplication: anEDAApplication;
		yourself
]

{ #category : #testing }
EDASSettingsPort >> isReadOnly [
	self shouldBeImplemented
]

{ #category : #testing }
EDASSettingsPort >> supportsMultiple [
	self shouldBeImplemented
]
