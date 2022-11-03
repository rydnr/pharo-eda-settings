Trait {
	#name : #EDASTPortResolver,
	#category : #'EDAS-Settings-Ports'
}

{ #category : #logic }
EDASTPortResolver >> availableAdaptersForPort: aPort [

	^ (aPort traitUsers select: [ :cls | cls accepts: aPort ]) sorted asOrderedCollection 
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

	^ ((Pragma allNamed: #edaPort:atPosition:)
		   select: [ :p | p method methodClass = aPort ]
		   thenCollect: [ :p | p arguments first ]) asOrderedCollection
		  ifEmpty: [ nil ]
		  ifNotEmpty: [ :c | c first ]
]

{ #category : #helpers }
EDASTPortResolver >> pragmaBasedPorts [

	^ (((Pragma allNamed: #edaPort:atPosition:) sorted: [ :a :b | 
		    (a argumentAt: 2) < (b argumentAt: 2) ]) collect: [ :p | 
		   p method methodClass ]) asOrderedCollection
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
	candidates := (self availableAdaptersForPort: aPort) sorted.
	candidate := candidates ifEmpty: [ nil ] ifNotEmpty: [ :col | 
		             (col select: [ :adapter | 
			              (self resolvePortForAdapter: adapter) = aPort ])
			             ifEmpty: [ col first withApp: app ]
			             ifNotEmpty: [ :adapterMatches | 
				             app portSettings adapters
					             at: aPort
					             ifAbsent: [ adapterMatches first class withApp: app ] ] ].
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
			(class traits select: [ :t | t = EDASSettingsPort ]) ifNotEmpty: [ 
				result := class ] ] ].
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
