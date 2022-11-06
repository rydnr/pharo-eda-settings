"
**Class**

I'm a baseline to load PharoEDA Settings.

**Responsibilities**

Guide Metacello to load PharoEDA-Settings with its dependencies.

**Collaborators**

Metacello
"
Class {
	#name : #BaselineOfPharoEDASettings,
	#superclass : #BaselineOf,
	#category : #BaselineOfPharoEDASettings
}

{ #category : #baselines }
BaselineOfPharoEDASettings >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec blessing: #baseline.
			self includeDeployUtils: spec.
			self includePharoEDACommon: spec.
			self declarePackagesIn: spec.
			self declareGroupsIn: spec ]
]

{ #category : #meta }
BaselineOfPharoEDASettings >> declareGroupsIn: spec [

	spec
		group: 'core'
		with:
			#( #'EDAS-Settings' #'EDAS-Settings-Ports' #'EDAS-Settings-Adapters-InMemory'
			   #'EDAS-Settings-Adapters-EnvVars'
			   #'EDAS-Settings-Adapters-Json' #'EDAS-Settings-Adapters-ByPriority' );
		group: 'tests'
		with:
			#( #'EDAS-Settings-Tests' #'EDAS-Settings-Adapters-Json-Tests' #'EDAS-Settings-Ports-Tests');
		group: 'default' with: #( 'core' 'tests' )
]

{ #category : #meta }
BaselineOfPharoEDASettings >> declarePackagesIn: spec [

	spec
		package: #'EDAS-Settings'
		with: [ spec requires: #( 'DeployUtils' ) ];
		package: #'EDAS-Settings-Tests'
		with: [ spec requires: #( 'EDAS-Settings' ) ];
		package: #'EDAS-Settings-Ports'
		with: [ spec requires: #( 'PharoEDACommon' ) ];
		package: #'EDAS-Settings-Adapters-InMemory'
		with: [ spec requires: #( 'PharoEDACommon' 'EDAS-Settings-Ports' ) ];
		package: #'EDAS-Settings-Adapters-EnvVars'
		with: [ spec requires: #( 'PharoEDACommon' 'EDAS-Settings-Ports' ) ];
		package: #'EDAS-Settings-Adapters-Json'
		with: [ spec requires: #( 'PharoEDACommon' 'EDAS-Settings-Ports' ) ];
		package: #'EDAS-Settings-Adapters-Json-Tests'
		with: [ spec requires: #( 'PharoEDACommon' 'EDAS-Settings-Ports' ) ];
		package: #'EDAS-Settings-Ports-Tests'
		with: [ spec requires: #( 'PharoEDACommon' 'EDAS-Settings-Ports' ) ];
		package: #'EDAS-Settings-Adapters-ByPriority' with: [ 
			spec requires:
					#( 'PharoEDACommon' 'EDAS-Settings-Ports' 'EDAS-Settings-Adapters-InMemory'
					   'EDAS-Settings-Adapters-EnvVars'
					   'EDAS-Settings-Adapters-Json' ) ]
]

{ #category : #dependencies }
BaselineOfPharoEDASettings >> includeDeployUtils: spec [
	spec baseline: 'DeployUtils' with: [ spec repository: 'github://fstephany/DeployUtils/repository' ].
	^ spec
]

{ #category : #dependencies }
BaselineOfPharoEDASettings >> includePharoEDACommon: spec [
spec
		baseline: 'PharoEDACommon'
		with: [ spec repository: 'github://rydnr/pharo-eda-common:main' ].
	^ spec
]

{ #category : #hooks }
BaselineOfPharoEDASettings >> postload: loader package: packageSpec [

	| location |
	location := (IceRepository registry detect: [ :each | 
		             each name = 'pharo-eda-settings' ]) location.
	EDAIconProvider addDefaultLocation: location / 'resources' / 'icons'.
	EDACTranslationProvider addDefaultLocation:
		location / 'resources' / 'l10n'
]
