Class {
	#name : #EDASStompSettingsInMemoryAdapter,
	#superclass : #Object,
	#traits : 'EDASInMemoryAdapter',
	#classTraits : 'EDASInMemoryAdapter classTrait',
	#instVars : [
		'host',
		'password',
		'port',
		'prefetchCount',
		'timeout',
		'username',
		'debug',
		'durable',
		'edaApplication'
	],
	#category : #'EDAS-Settings-Adapters-InMemory'
}

{ #category : #accessing }
EDASStompSettingsInMemoryAdapter >> debug [
	^ debug
]

{ #category : #accessing }
EDASStompSettingsInMemoryAdapter >> debug: aBoolean [
	debug := aBoolean
]

{ #category : #'class initialization' }
EDASStompSettingsInMemoryAdapter >> doInitialize [
	self host: nil.
	self port: nil.
	self username: nil.
	self password: nil.
	self timeout: nil.
		self durable: true.
]

{ #category : #accessing }
EDASStompSettingsInMemoryAdapter >> durable [
	^ durable
]

{ #category : #accessing }
EDASStompSettingsInMemoryAdapter >> durable: flag [
	durable := flag
]

{ #category : #accessing }
EDASStompSettingsInMemoryAdapter >> edaApplication [
	^ edaApplication
]

{ #category : #accessing }
EDASStompSettingsInMemoryAdapter >> edaApplication: anEDAApplication [
	edaApplication := anEDAApplication
]

{ #category : #accessing }
EDASStompSettingsInMemoryAdapter >> host [
	^ host
]

{ #category : #accessing }
EDASStompSettingsInMemoryAdapter >> host: val [
	host := val
]

{ #category : #'class initialization' }
EDASStompSettingsInMemoryAdapter >> initialize [
	super initialize.
	self doInitialize
]

{ #category : #accessing }
EDASStompSettingsInMemoryAdapter >> password [
	^ password
]

{ #category : #accessing }
EDASStompSettingsInMemoryAdapter >> password: val [
	password := val
]

{ #category : #accessing }
EDASStompSettingsInMemoryAdapter >> port [
	^ port
]

{ #category : #accessing }
EDASStompSettingsInMemoryAdapter >> port: val [
	port := val
]

{ #category : #accessing }
EDASStompSettingsInMemoryAdapter >> timeout [
	^ timeout
]

{ #category : #accessing }
EDASStompSettingsInMemoryAdapter >> timeout: val [
	timeout := val
]

{ #category : #accessing }
EDASStompSettingsInMemoryAdapter >> username [
	^ username
]

{ #category : #accessing }
EDASStompSettingsInMemoryAdapter >> username: val [
	username := val
]
