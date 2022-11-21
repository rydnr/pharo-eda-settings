"
* Class: EDASettings

Manages the configuration settings of EDA, using Pharo Settings framework, and injecting default values from config/[environment].json files.

* Responsibility: 

Build Settings menu entries with EDA-specific configuration settings, for the user to manage.
"
Class {
	#name : #EDASSettings,
	#superclass : #Object,
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
EDASSettings class >> default [

	self open.
	(self currentWorld submorphs select: [ :w | 
		 w model class = SettingBrowser ]) collect: [ :w | w delete ]
]

{ #category : #settings }
EDASSettings class >> edaSettingsOn: aBuilder [

	<systemsettings>
	<pharoedasettings>
	| root rootSymbol iconProvider |
	rootSymbol := #edaApps.
	root := aBuilder group: rootSymbol.
	iconProvider := EDACIconProvider new.
	EDAApplications uniqueInstance edaApplications
		ifEmpty: [ 
			root
				label:
					#'pharoeda.settings.noApplicationsRegistered.label' translated;
				description:
					#'pharoeda.settings.noApplicationsRegistered.description';
				icon: (iconProvider
						 iconNamed: #noapps
						 ifAbsent: [ Smalltalk ui iconNamed: #collection ]) ]
		ifNotEmpty: [ :apps | 
			| label description icon |
			label := apps size = 1
				         ifTrue: [ 
				         #'pharoeda.settings.applicationRegistered.label'
					         translated ]
				         ifFalse: [ 
					         #'pharoeda.settings.applicationsRegistered.label'
						         translated , apps size printString ].
			description := apps size = 1
				               ifTrue: [ 
				               #'pharoeda.settings.applicationRegistered.description' ]
				               ifFalse: [ 
				               #'pharoeda.settings.applicationsRegistered.description' ].
			icon := apps size = 1
				        ifTrue: [ #oneapp ]
				        ifFalse: [ #someapps ].
			root
				label: label;
				description: description;
				icon: (iconProvider iconNamed: icon orElse: #collection);
				order: 1.
			apps do: [ :app | 
				self edaSettingsOn: aBuilder for: app under: rootSymbol ] ]
]

{ #category : #settings }
EDASSettings class >> edaSettingsOn: aBuilder for: anEDAApplication under: aSymbol [

	| parent parentGroup ports resolver |
	parent := anEDAApplication applicationName.
	parentGroup := aBuilder group: parent.
	parentGroup
		label: parent translated;
		parent: aSymbol;
		description: anEDAApplication description;
		icon: anEDAApplication icon;
		noOrdering.
	resolver := EDASPortResolver new.
	ports := resolver availablePorts.
	ports keysAndValuesDo: [ :i :p | 
		| adapter |
		adapter := resolver resolvePort: p forApp: anEDAApplication.
		adapter ifNotNil: [ :ad |
		anEDAApplication portSettings adapterFor: p is: ad.
		self
			adapterSettingsOn: aBuilder
			for: p
			implementedBy: ad
			under: parent
			on: anEDAApplication
			order: i ] ].
	self
		portSettingsOn: aBuilder
		under: parent
		on: anEDAApplication
		order: ports size + 1
]

{ #category : #'class initialization' }
EDASSettings class >> initialize [

	"self default"
]

{ #category : #settings }
EDASSettings class >> multiAttributeAdapterSettingsOn: aBuilder for: aPort implementedBy: anAdapter under: aParent on: app order: anInteger [

	| attributes |
	attributes := anAdapter class settingsAttributes.
	attributes ifNotEmpty: [ :attrs | 
		| key |
		key := aParent , anAdapter class name.
		(aBuilder group: key)
			label: anAdapter label;
			description: anAdapter description;
			icon: anAdapter icon;
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
EDASSettings class >> open [

	(SettingBrowser forKeywords: #('pharoedasettings')) open
]

{ #category : #settings }
EDASSettings class >> port: aPort settingsOn: aBuilder under: aParent on: app order: anInteger [

	| values portResolver |
	portResolver := EDASPortResolver new.
	values := OrderedCollection withAll:
		          (((portResolver availableAdaptersForPort: aPort andApp: app) collect: [ 
			            :adapterClass | 
			            adapterClass portLabel translated -> adapterClass ]) 
			           sorted: [ :a :b | a < b ]).
	values ifNotEmpty: [ :v | 
		(aBuilder pickOne: aPort name)
			label: aPort label translated;
			description: aPort description;
			icon: aPort icon;
			target: app;
			targetSelector: #portSettings;
			parent: aParent;
			default: v first;
			domainValues: v;
			order: anInteger ]
]

{ #category : #settings }
EDASSettings class >> portEntriesForApp: anEDAApplication [

	| portResolver result |
	result := OrderedCollection new.
	portResolver := EDASPortResolver new.
	portResolver availablePorts keysAndValuesDo: [ :i :p | 
		result add: (OrderedCollection withAll:
				 (((portResolver availableAdaptersForPort: p andApp: anEDAApplication) collect: [ 
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
		label: #'pharoeda.settings.ports.label' translated;
		description: #'pharoeda.settings.ports.description';
		icon: (EDACIconProvider new iconNamed: #ports orElse: #smallConfiguration);
		parent: aParent.
	portResolver := EDASPortResolver new.
	portResolver availablePorts keysAndValuesDo: [ :i :p | 
		self
			port: p
			settingsOn: aBuilder
			under: key
			on: app
			order: i ]
]

{ #category : #settings }
EDASSettings class >> resetSettings [
	#(#EDAACommandStompTopicListener #EDAAEventStompTopicPublisher #EDAAMongoEventStore #EDACLoggingSettings EDAApplication  EDAProjector 	 EDACompositeProjector  #EDAAProjectionMongoRepository)
		do: [ :cls | cls initialize ]
]

{ #category : #settings }
EDASSettings class >> settingOn: aBuilder named: aSymbol labelled: aString withDescription: aDescription icon: anIcon usingConfig: aConfig under: aParent on: app order: anInteger [

	| entry |
	(aConfig isReadOnly: aSymbol)
		ifTrue: [ 
			| value |
			entry := aBuilder group: aSymbol.
			value := aConfig perform: aSymbol.

			(aConfig supportsMultiple: aSymbol)
				ifTrue: [ 
				value := (aConfig keyIn: aSymbol forValue: value) translated ]
				ifFalse: [ value ].
			entry dialog: [ LabelMorph newLabel: value greaseString ] ]
		ifFalse: [ 
			(aConfig supportsMultiple: aSymbol)
				ifTrue: [ 
					entry := aBuilder pickOne: aSymbol.
					entry domainValues: ((aConfig values: aSymbol) collect: [ :v | 
							 v key translated -> v value greaseString ]) ]
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
		named: anAdapter selector
		labelled: anAdapter label
		withDescription: anAdapter description
		icon: anAdapter icon
		usingConfig: anAdapter
		under: aParent
		on: app
		order: anInteger.
	aPort settingsBlock value: app
]
