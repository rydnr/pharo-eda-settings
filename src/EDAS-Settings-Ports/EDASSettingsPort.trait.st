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
EDASSettingsPort classSide >> _iconFor: aString in: anEDAApplication [

	| iconName |
	iconName := ((Pragma
		              allNamed:
		              #edaSettings:withDescription:icon:atPosition:readOnly:multiple:
		              includingTraitsInSuperAndSubclasses: self) select: [ 
		             :p | p method selector = aString asSymbol ])
		            ifEmpty: [ #smallQuestion ]
		            ifNotEmpty: [ :col | col first argumentAt: 3 ].
	^ anEDAApplication iconProvider iconNamed: iconName ifAbsent: [ 
		  Smalltalk ui icons
			  iconNamed: iconName
			  ifNone: [ Smalltalk ui icons iconNamed: #smallQuestion ] ]
]

{ #category : #testing }
EDASSettingsPort classSide >> accepts: aPortResolver [
	^ false
]

{ #category : #testing }
EDASSettingsPort classSide >> description [

	| pragmas match |
	pragmas := Pragma
		           allNamed: #edaPort:withDescription:icon:atPosition
		           includingTraitsInSuperAndSubclasses: self.
	match := pragmas select: [ :p | p method methodClass soleInstance = self ].
	^ ((Pragma
		    allNamed: #edaPort:withDescription:icon:atPosition
		    includingTraitsInSuperAndSubclasses: self) select: [ :p | 
		   p method methodClass soleInstance = self ])
		  ifEmpty: [ '' ]
		  ifNotEmpty: [ :col | col first argumentAt: 2 ]
]

{ #category : #testing }
EDASSettingsPort classSide >> icon [

	| provider |
	provider := EDAIconProvider new.
	^ (((Pragma allNamed: #edaPort:withDescription:icon:atPosition:) 
		    select: [ :p | p method methodClass soleInstance = self ]) collect: [ :p | 
		   p arguments third ]) asOrderedCollection
		  ifEmpty: [ provider iconNamed: #comments ]
		  ifNotEmpty: [ :c | provider iconNamed: c first ]
]

{ #category : #testing }
EDASSettingsPort classSide >> iconFor: aString in: anEDAApplication [

	| iconName |
	iconName := ((Pragma
		              allNamed: #edaPort:withDescription:icon:atPosition
		              includingTraitsInSuperAndSubclasses: self) select: [ 
		             :p | p method selector = aString asSymbol ])
		            ifEmpty: [ #smallQuestion ]
		            ifNotEmpty: [ :col | col first argumentAt: 3 ].
	^ anEDAApplication iconProvider iconNamed: iconName ifAbsent: [ 
		  Smalltalk ui icons
			  iconNamed: iconName
			  ifNone: [ Smalltalk ui icons iconNamed: #smallQuestion ] ]
]

{ #category : #testing }
EDASSettingsPort classSide >> label [

	^ (((Pragma allNamed: #edaPort:withDescription:icon:atPosition:) 
		    select: [ :p | p method methodClass soleInstance = self ]) 
		   collect: [ :p | p arguments first ]) asOrderedCollection
		  ifEmpty: [ nil ]
		  ifNotEmpty: [ :c | c first ]
]

{ #category : #testing }
EDASSettingsPort classSide >> position [

	^ (((Pragma allNamed: #edaPort:withDescription:icon:atPosition:) 
		    select: [ :p | p method methodClass soleInstance = self ]) 
		   collect: [ :p | p arguments fourth ]) asOrderedCollection
		  ifEmpty: [ nil ]
		  ifNotEmpty: [ :c | c first ]
]

{ #category : #accessing }
EDASSettingsPort classSide >> priority [
	self shouldBeImplemented 
]

{ #category : #settings }
EDASSettingsPort classSide >> settingsAttributes [

	^ ((Pragma
		    allNamed: #edaSettings:withDescription:atPosition:readOnly:multiple:
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
EDASSettingsPort >> adapterFor: aPort is: anAdapter [

self shouldBeImplemented
]

{ #category : #accessing }
EDASSettingsPort >> descriptionFor: aString [

	^ ((Pragma
		    allNamed: #edaSettings:withDescription:icon:atPosition:readOnly:multiple:
		    includingTraitsInSuperAndSubclasses: self class) select: [ :p | 
		   p method selector = aString asSymbol ]) ifEmpty: [ nil ] ifNotEmpty: [ :col | col first argumentAt: 2 ]
]

{ #category : #testing }
EDASSettingsPort >> iconFor: aString [ 

	^ self iconFor: aString in: self edaApplication
]

{ #category : #testing }
EDASSettingsPort >> iconFor: aString in: anEDAApplication [

	^ self class iconFor: aString in: anEDAApplication 
]

{ #category : #testing }
EDASSettingsPort >> isReadOnly: aString [

	^ ((Pragma
		    allNamed:
		    #edaSettings:withDescription:icon:atPosition:readOnly:multiple:
		    includingTraitsInSuperAndSubclasses: self class) select: [ :p | 
		   p method selector = aString asSymbol ])
		  ifEmpty: [ false ]
		  ifNotEmpty: [ :col | col first argumentAt: 5 ]
]

{ #category : #accessing }
EDASSettingsPort >> labelFor: aString [

	^ ((Pragma
		    allNamed:
		    #edaSettings:withDescription:icon:atPosition:readOnly:multiple:
		    includingTraitsInSuperAndSubclasses: self class) select: [ :p | 
		   p method selector = aString asSymbol ]) ifEmpty: [ nil ] ifNotEmpty: [ :col | col first argumentAt: 1 ]
]

{ #category : #testing }
EDASSettingsPort >> supportsMultiple: aString [

	^ ((Pragma
		    allNamed:
		    #edaSettings:withDescription:icon:atPosition:readOnly:multiple:
		    includingTraitsInSuperAndSubclasses: self class) select: [ :p | 
		   p method selector = aString asSymbol ])
		  ifEmpty: [ false ]
		  ifNotEmpty: [ :col | col first argumentAt: 6 ]
]
