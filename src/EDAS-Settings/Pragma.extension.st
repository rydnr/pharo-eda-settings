Extension { #name : #Pragma }

{ #category : #'*EDAS-Settings' }
Pragma class >> allNamed: aString includingTraitsInSuperAndSubclasses: aClass [

	"Answer a collection of all pragmas found in methods of all classes and traits up and down given class (inclusive) whose keyword is aSymbol."

	| superclassBlock subclassBlock traitsBlock |
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
	subclassBlock := [ :cls :col :sb :tb | 
	                 cls subclassesDo: [ :c | 
		                 col add: c.
		                 sb
			                 value: c
			                 value: col
			                 value: sb
			                 value: tb.
		                 tb value: c value: col value: tb ] ].

	^ Array streamContents: [ :stream | 
		  | classes pragmas |
		  classes := Set new.
		  classes addAll: aClass superclassesAndTraits.
		  classes addAll: aClass subclassesAndTraits.
		  pragmas := Set new.
		  (classes addAll: (classes collect: [ :c | c class ]); yourself) do: [ :class | 
			  class pragmasDo: [ :pragma | 
				  pragma selector = aString asSymbol ifTrue: [ 
					  pragmas add: pragma ] ] ].
		  pragmas do: [ :pragma | stream nextPut: pragma ] ]
]
