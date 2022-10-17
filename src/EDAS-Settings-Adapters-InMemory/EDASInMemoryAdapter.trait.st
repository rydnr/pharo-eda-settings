Trait {
	#name : #EDASInMemoryAdapter,
	#category : #'EDAS-Settings-Adapters-InMemory'
}

{ #category : #accessing }
EDASInMemoryAdapter classSide >> description [
	^ 'Manual'
]

{ #category : #testing }
EDASInMemoryAdapter >> isReadOnly: aSymbol [
	^ false
]

{ #category : #testing }
EDASInMemoryAdapter >> supportsMultiple: aSymbol [
	^ false
]
