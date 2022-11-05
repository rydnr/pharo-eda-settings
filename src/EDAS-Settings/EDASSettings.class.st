"
* Class: EDASettings

Manages the configuration settings of EDA, using Pharo Settings framework, and injecting default values from config/[environment].json files.

* Responsibility: 

Build Settings menu entries with EDA-specific configuration settings, for the user to manage.
"
Class {
	#name : #EDASSettings,
	#superclass : #Object,
	#classInstVars : [
		'duEnvironmentClass',
		'noApplications',
		'priorizedAdapter'
	],
	#category : #'EDAS-Settings'
}

{ #category : #settings }
EDASSettings class >> adapterSettingsOn: aBuilder for: aPort implementedBy: anAdapter under: aParent on: app order: anInteger [

	aPort selector
		ifNil: [ 
			self
				multiAttributeAdapterSettingsOn: aBuilder
				for: aPort
				implementedBy: anAdapter
				under: aParent
				on: app
				order: anInteger ]
		ifNotNil: [ :s | 
			self
				singleAttributeAdapterSettingsOn: aBuilder
				for: aPort
				implementedBy: anAdapter
				under: aParent
				on: app
				order: anInteger ]
]

{ #category : #settings }
EDASSettings class >> edaSettingsOn: aBuilder [
	<systemsettings>
	| root rootSymbol |
	rootSymbol := #edaApps.
	root := aBuilder group: rootSymbol.
	EDAApplications uniqueInstance edaApplications
		ifEmpty: [ root
				label: 'No PharoEDA applications registered' translated;
				description: 'No PharoEDA applications registered' ]
		ifNotEmpty: [ :apps | 
			root
				label: 'PharoEDA application(s)' translated , ': ' , apps size printString;
				description: 'Registered PharoEDA applications';
				noOrdering.
			apps
				do: [ :app | self edaSettingsOn: aBuilder for: app under: rootSymbol ] ]
]

{ #category : #settings }
EDASSettings class >> edaSettingsOn: aBuilder for: anEDAApplication under: aSymbol [

	| parent parentGroup ports resolver |
	parent := anEDAApplication applicationName.
	parentGroup := aBuilder group: parent.
	parentGroup
		label: parent translated;
		parent: aSymbol;
		description: parent;
		noOrdering.
	resolver := EDASPortResolver new.
	ports := resolver availablePorts.
	ports keysAndValuesDo: [ :i :p | 
		| adapter |
		adapter := resolver resolvePort: p forApp: anEDAApplication.
		anEDAApplication portSettings adapterFor: p is: adapter.
		self
			adapterSettingsOn: aBuilder
			for: p
			implementedBy: adapter
			under: parent
			on: anEDAApplication
			order: i ].
	self
		portSettingsOn: aBuilder
		under: parent
		on: anEDAApplication
		order: ports size + 1
]

{ #category : #settings }
EDASSettings class >> multiAttributeAdapterSettingsOn: aBuilder for: aPort implementedBy: anAdapter under: aParent on: app order: anInteger [

	| attributes |
	attributes := anAdapter class settingsAttributes.
	attributes ifNotEmpty: [ :attrs | 
		| key |
		key := aParent , anAdapter class name.
		(aBuilder group: key)
			label: aPort label;
			description: aPort description;
			icon: aPort icon;
			parent: aParent;
			order: anInteger.
		attrs keysAndValuesDo: [ :i :attr | 
			self
				settingOn: aBuilder
				named: attr asSymbol
				labelled: (anAdapter labelFor: attr)
				withDescription: (anAdapter descriptionFor: attr)
				icon: (anAdapter iconFor: attr)
				usingConfig: anAdapter
				under: key
				on: app
				order: i.
			aPort settingsBlock value: app ] ]
]

{ #category : #settings }
EDASSettings class >> port: aPort settingsOn: aBuilder under: aParent on: app order: anInteger [

	| values portResolver |
	portResolver := EDASPortResolver new.
	values := OrderedCollection withAll:
		          (((portResolver availableAdaptersForPort: aPort) collect: [ 
			            :adapterClass | 
			            adapterClass description translated -> adapterClass ]) 
			           sorted: [ :a :b | a < b ]).
	values ifNotEmpty: [ 
		(aBuilder pickOne: aPort adapterClassAccessor)
			label: (portResolver portDescription: aPort) translated;
			icon: (aPort iconFor: aPort adapterClassAccessor in: app);
			target: app;
			targetSelector: #portSettings;
			parent: aParent;
			default: values first key;
			domainValues: values;
			order: anInteger ]
]

{ #category : #settings }
EDASSettings class >> portEntries [

	| portResolver result |
	result := OrderedCollection new.
	portResolver := EDASPortResolver new.
	portResolver availablePorts keysAndValuesDo: [ :i :p | 
		result add: (OrderedCollection withAll:
				 (((portResolver availableAdaptersForPort: p) collect: [ 
					   :adapterClass | 
					   adapterClass description translated -> adapterClass ]) 
					  sorted: [ :a :b | a < b ])) ].
	^ result
]

{ #category : #settings }
EDASSettings class >> portSettingsOn: aBuilder under: aParent on: app order: anInteger [

	| entry key portResolver |
	key := aParent , 'ports'.
	entry := aBuilder group: key.
	entry
		label: 'Ports' translated;
		parent: aParent.
	portResolver := EDASPortResolver new.
	portResolver availablePorts keysAndValuesDo: [ :i :p | 
		self port: p settingsOn: aBuilder under: key on: app order: i ]
]

{ #category : #settings }
EDASSettings class >> resetSettings [
	#(#EDAACommandStompTopicListener #EDAAEventStompTopicPublisher #EDAAMongoEventStore #EDACLoggingSettings EDAApplication  EDAProjector 	 EDACompositeProjector  #EDAAProjectionMongoRepository)
		do: [ :cls | cls initialize ]
]

{ #category : #settings }
EDASSettings class >> settingOn: aBuilder named: aSymbol labelled: aString withDescription: aDescription icon: anIcon usingConfig: aConfig under: aParent on: app order: anInteger [

	| entry |
	(aConfig supportsMultiple: aSymbol)
		ifTrue: [ 
			entry := aBuilder pickOne: aSymbol.
			entry domainValues:
				((aConfig values: aSymbol) collect: [ :v | 
					 v key translated -> v value greaseString ]) ]
		ifFalse: [ 
			(aConfig isReadOnly: aSymbol)
				ifTrue: [ 
					entry := aBuilder group: aSymbol.
					entry dialog: [ 
						LabelMorph newLabel: (aConfig perform: aSymbol) asString ] ]
				ifFalse: [ entry := aBuilder setting: aSymbol ] ].
	entry
		parent: aParent;
		target: aConfig;
		label: aString translated;
		description: aDescription;
		icon: anIcon;
		order: anInteger
]

{ #category : #settings }
EDASSettings class >> singleAttributeAdapterSettingsOn: aBuilder for: aPort implementedBy: anAdapter under: aParent on: app order: anInteger [

	self
		settingOn: aBuilder
		named: aPort selector
		labelled: aPort label
		withDescription: aPort description
		icon: (anAdapter iconFor: aPort selector)
		usingConfig: anAdapter
		under: aParent
		on: app
		order: anInteger.
	aPort settingsBlock value: app
]
