Trait {
	#name : #EDASTPortResolver,
	#category : #'EDAS-Settings-Ports'
}

{ #category : #logic }
EDASTPortResolver >> availableAdaptersForPort: aPort andApp: anEDAApplication [

	| accepted |
	accepted := [ :port :cls :blk | 
	            (cls accepts: aPort inApp: anEDAApplication) or: [ 
		            cls subclasses do: [ :c | 
			            blk value: port value: c value: blk ] ] ].
	^ (aPort traitUsers select: [ :cls | 
		   cls accepts: aPort inApp: anEDAApplication ]) sorted
		  asOrderedCollection
]

{ #category : #helpers }
EDASTPortResolver >> availablePorts [

	^ self pragmaBasedPorts
]

{ #category : #helpers }
EDASTPortResolver >> portAdapterClassSymbol: aString [

	^ (aString , 'SettingsAdapterClass') asSymbol
]

{ #category : #helpers }
EDASTPortResolver >> portDescription: aPort [

	^ (((Pragma allNamed: #edaPort:withDescription:icon:atPosition:) 
		    select: [ :p | p method methodClass = aPort ]) collect: [ :p | 
		   p arguments second ]) asOrderedCollection
		  ifEmpty: [ nil ]
		  ifNotEmpty: [ :c | c first ]
]

{ #category : #helpers }
EDASTPortResolver >> pragmaBasedPorts [

	^ (((Pragma allNamed: #edaPort:withDescription:icon:atPosition:) sorted: [ :a :b | 
		    (a argumentAt: 4) < (b argumentAt: 4) ]) collect: [ :p | 
		   p method methodClass soleInstance ]) asOrderedCollection
]

{ #category : #api }
EDASTPortResolver >> resolvePort: aPort1 [

	| result superclassBlock traitsBlock |
	result := nil.
	traitsBlock := [ :cls :col :tb | 
	               cls traits do: [ :t | 
		               col add: t.
		               tb value: t value: col value: tb ] ].
	superclassBlock := [ :cls :col :sb :tb | 
	                   cls superclass ifNotNil: [ :c | 
		                   col add: c.
		                   sb
			                   value: c
			                   value: col
			                   value: sb
			                   value: tb.
		                   tb value: c value: col value: tb ] ].

	self availablePorts do: [ :a | 
		| classes |
		result ifNil: [ 
			classes := Set new.
			classes add: a class.
			traitsBlock value: a class value: classes value: traitsBlock.
			superclassBlock
				value: a class
				value: classes
				value: superclassBlock
				value: traitsBlock.
			classes do: [ :class | 
				result ifNil: [ 
					(class traits select: [ :t | t = EDASSettingsPort class ]) 
						ifNotEmpty: [ result := class soleInstance ] ] ] ] ].
	^ result
]

{ #category : #api }
EDASTPortResolver >> resolvePort: aPort forApp: app [

	| candidates candidate |
	candidates := (self availableAdaptersForPort: aPort andApp: app)
		              sorted.
	candidate := candidates ifEmpty: [ nil ] ifNotEmpty: [ :col | 
		             (col select: [ :adapter | 
			              (self resolvePortForAdapter: adapter) = aPort ])
			             ifEmpty: [ col first withApp: app ]
			             ifNotEmpty: [ :adapterMatches | 
				             app portSettings adapters
					             at: aPort
					             ifAbsent: [ adapterMatches first withApp: app ] ] ].
	^ candidate ifNil: [ nil ] ifNotNil: [ :c | c ]
]

{ #category : #api }
EDASTPortResolver >> resolvePortForAdapter: anAdapter [

	| result superclassBlock traitsBlock classes |
	result := nil.
	traitsBlock := [ :cls :col :tb | 
	               cls traits do: [ :t | 
		               col add: t.
		               tb value: t value: col value: tb ] ].
	superclassBlock := [ :cls :col :sb :tb | 
	                   cls superclass ifNotNil: [ :c | 
		                   col add: c.
		                   sb
			                   value: c
			                   value: col
			                   value: sb
			                   value: tb.
		                   tb value: c value: col value: tb ] ].


	classes := Set new.
	classes add: anAdapter class.
	traitsBlock value: anAdapter class value: classes value: traitsBlock.
	superclassBlock
		value: anAdapter class
		value: classes
		value: superclassBlock
		value: traitsBlock.
	classes do: [ :class | 
		result ifNil: [ 
			(class traits select: [ :t | t = EDASSettingsPort class ]) ifNotEmpty: [ 
				result := class soleInstance ] ] ].
	^ result
]

{ #category : #api }
EDASTPortResolver >> traitsBasedPorts [

	| result superclassBlock traitsBlock |
	result := OrderedCollection new.
	traitsBlock := [ :cls :col :tb | 
	               cls traits do: [ :t | 
		               col add: t.
		               tb value: t value: col value: tb ] ].
	superclassBlock := [ :cls :col :sb :tb | 
	                   cls superclass ifNotNil: [ :c | 
		                   col add: c.
		                   sb
			                   value: c
			                   value: col
			                   value: sb
			                   value: tb.
		                   tb value: c value: col value: tb ] ].

	self availablePorts do: [ :a | 
		| classes |
		classes := Set new.
		classes add: a class.
		traitsBlock value: a class value: classes value: traitsBlock.
		superclassBlock
			value: a class
			value: classes
			value: superclassBlock
			value: traitsBlock.
		classes do: [ :class | 
			(class traits select: [ :t | t = EDASSettingsPort class ]) 
				ifNotEmpty: [ result add: class soleInstance ] ] ].
	^ result
]
