Extension { #name : #Class }

{ #category : #'*EDAS-Settings' }
Class >> subclassesAndTraits [

	| result subclassBlock traitsBlock |
	traitsBlock := [ :s :cls :col :tb | 
	               | aux |
	               aux := OrderedCollection withAll:
		                      (cls traits asOrderedCollection removeAllSuchThat: [ :c | 
			                       c = s or: [ col includes: c ] ]).
	               aux addAll:
		               (cls traitUsers asOrderedCollection  removeAllSuchThat: [ :c | 
			                c = s or: [ col includes: c ] ]).
	               aux do: [ :t | 
		               col add: t.
		               tb
			               value: s
			               value: t
			               value: col
			               value: tb ] ].

	subclassBlock := [ :cls :col :sb :tb | 
	                 col add: cls.
	                 cls subclassesDo: [ :c | 
		                 col add: c.
		                 sb
			                 value: c
			                 value: col
			                 value: sb
			                 value: tb.
		                 tb
			                 value: self
			                 value: c
			                 value: col
			                 value: tb ] ].


	result := Set new.
	traitsBlock
		value: self
		value: self
		value: result
		value: traitsBlock.
	subclassBlock
		value: self
		value: result
		value: subclassBlock
		value: traitsBlock.
	^ result
]

{ #category : #'*EDAS-Settings' }
Class >> superclassesAndTraits [

	| result superclassBlock traitsBlock |
	traitsBlock := [ :s :cls :col :tb | 
	               | aux |
	               aux := OrderedCollection withAll:
		                      (cls traits asOrderedCollection 
			                       removeAllSuchThat: [ :c | 
			                       c = s or: [ col includes: c ] ]).
	               aux do: [ :t | 
		               col add: t.
		               tb
			               value: s
			               value: t
			               value: col
			               value: tb ] ].
	superclassBlock := [ :cls :col :sb :tb | 
	                   cls superclass ifNotNil: [ :c | 
		                   (col includes: c) ifFalse: [ 
			                   col add: c.
			                   sb
				                   value: c
				                   value: col
				                   value: sb
				                   value: tb.
			                   tb value: self value: c value: col value: tb ] ] ].


	result := Set new.
	traitsBlock
		value: self
		value: self
		value: result
		value: traitsBlock.
	superclassBlock
		value: self
		value: result
		value: superclassBlock
		value: traitsBlock.
	^ result
]
