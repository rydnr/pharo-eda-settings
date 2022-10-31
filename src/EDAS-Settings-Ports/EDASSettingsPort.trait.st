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

{ #category : #settings }
EDASSettingsPort classSide >> settingsAttributes [

	^ ((Pragma
		    allNamed: #edaSettings:withDescription:atPosition:
		    includingTraitsInSuperAndSubclasses: self) sort: [ :a :b | 
		   (a argumentAt: 3) < (b argumentAt: 3) ]) collect: [ :p | 
		  p method selector ]
]

{ #category : #settings }
EDASSettingsPort classSide >> settingsBlock [
	^ [ :app | ]
]

{ #category : #testing }
EDASSettingsPort classSide >> withApp: anEDAApplication [
	^ self new
		edaApplication: anEDAApplication;
		yourself
]

{ #category : #accessing }
EDASSettingsPort >> descriptionFor: aString [

	^ ((Pragma
		    allNamed: #edaSettings:withDescription:atPosition:
		    includingTraitsInSuperAndSubclasses: self class) select: [ :p | 
		   p method selector = aString asSymbol ]) first argumentAt: 2
]

{ #category : #testing }
EDASSettingsPort >> isReadOnly: aSymbol [

	self shouldBeImplemented
]

{ #category : #accessing }
EDASSettingsPort >> labelFor: aString [

	^ ((Pragma
		    allNamed: #edaSettings:withDescription:atPosition:
		    includingTraitsInSuperAndSubclasses: self class) select: [ :p | 
		   p method selector = aString asSymbol ]) first argumentAt: 1
]

{ #category : #testing }
EDASSettingsPort >> supportsMultiple: aSymbol [

	self shouldBeImplemented
]
