Trait {
	#name : #EDASSettingsPort,
	#instVars : [
		'edaApplication'
	],
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
EDASSettingsPort classSide >> accepts: anEDAApplication [

	^ false
]

{ #category : #accessing }
EDASSettingsPort classSide >> adapterAccessor [

	self subclassResponsibility
]

{ #category : #accessing }
EDASSettingsPort classSide >> adapterClassAccessor [

	self subclassResponsibility 
]

{ #category : #accessing }
EDASSettingsPort classSide >> changedEventName [

	^ nil
]

{ #category : #testing }
EDASSettingsPort classSide >> description [

	^ (((Pragma
		     allNamed: #edaPort:withDescription:icon:atPosition:
		     includingTraitsInSuperAndSubclasses: self) select: [ :p | 
		    p method methodClass soleInstance = self ]) collect: [ :p | 
		   p arguments second ]) asOrderedCollection
		  ifEmpty: [ nil ]
		  ifNotEmpty: [ :c | c first ]
]

{ #category : #metadata }
EDASSettingsPort classSide >> edaPort [

	self subclassResponsibility
]

{ #category : #testing }
EDASSettingsPort classSide >> icon [

	| provider |
	provider := EDACIconProvider new.
	^ (((Pragma
		     allNamed: #edaPort:withDescription:icon:atPosition:
		     includingTraitsInSuperAndSubclasses: self) select: [ :p | 
		    p method methodClass soleInstance = self ]) collect: [ :p | 
		   p arguments third ]) asOrderedCollection
		  ifEmpty: [ provider iconNamed: #comments ]
		  ifNotEmpty: [ :c | provider iconNamed: c first ]
]

{ #category : #testing }
EDASSettingsPort classSide >> iconFor: aString in: anEDAApplication [

	| iconName |
	iconName := ((Pragma
		              allNamed: #'edaSettings:withDescription:icon:atPosition:readOnly:multiple:'
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

	^ (((Pragma allNamed: #edaPort:withDescription:icon:atPosition: includingTraitsInSuperAndSubclasses: self) 
		    select: [ :p | p method methodClass soleInstance = self ]) 
		   collect: [ :p | p arguments first ]) asOrderedCollection
		  ifEmpty: [ nil ]
		  ifNotEmpty: [ :c | c first ]
]

{ #category : #accessing }
EDASSettingsPort classSide >> portChangedEventName [

	^ nil
]

{ #category : #metadata }
EDASSettingsPort classSide >> portLabel [

	self subclassResponsibility 
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

{ #category : #testing }
EDASSettingsPort classSide >> selector [

	self subclassResponsibility 
]

{ #category : #settings }
EDASSettingsPort classSide >> settingsAttributes [

	^ ((Pragma
		    allNamed:
		    #edaSettings:withDescription:icon:atPosition:readOnly:multiple:
		    includingTraitsInSuperAndSubclasses: self) sort: [ :a :b | 
		   (a argumentAt: 4) < (b argumentAt: 4) ]) collect: [ :p | 
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
EDASSettingsPort >> description [

	^ self class description
]

{ #category : #accessing }
EDASSettingsPort >> descriptionFor: aString [

	^ ((Pragma
		    allNamed: #edaSettings:withDescription:icon:atPosition:readOnly:multiple:
		    includingTraitsInSuperAndSubclasses: self class) select: [ :p | 
		   p method selector = aString asSymbol ]) ifEmpty: [ nil ] ifNotEmpty: [ :col | col first argumentAt: 2 ]
]

{ #category : #accessing }
EDASSettingsPort >> edaApplication [

	^ edaApplication
]

{ #category : #accessing }
EDASSettingsPort >> edaApplication: anObject [

	edaApplication := anObject
]

{ #category : #testing }
EDASSettingsPort >> icon [

	^ self class icon
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
EDASSettingsPort >> label [

	^ self class label
]

{ #category : #accessing }
EDASSettingsPort >> labelFor: aString [

	^ ((Pragma
		    allNamed:
		    #edaSettings:withDescription:icon:atPosition:readOnly:multiple:
		    includingTraitsInSuperAndSubclasses: self class) select: [ :p | 
		   p method selector = aString asSymbol ]) ifEmpty: [ nil ] ifNotEmpty: [ :col | col first argumentAt: 1 ]
]

{ #category : #accessing }
EDASSettingsPort >> selector [

	^ self class selector
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
