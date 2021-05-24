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
			self includePharoEDACommon: spec.
			self declarePackagesIn: spec.
			self declareGroupsIn: spec ]
]

{ #category : #meta }
BaselineOfPharoEDASettings >> declareGroupsIn: spec [
	spec
		group: 'core' with: #(#'EDAS-Settings' #'EDAS-Settings-Ports' #'EDAS-Settings-Adapters-InMemory' #'EDAS-Settings-Adapters-EnvVars' #'EDAS-Settings-Adapters-ByPriority');
		group: 'tests' with: #(#'EDAS-Settings-Tests');
		group: 'default' with: #('core' 'tests')
]

{ #category : #meta }
BaselineOfPharoEDASettings >> declarePackagesIn: spec [
	spec
		package: #'EDAS-Settings';
		package: #'EDAS-Settings-Tests' with: [ spec requires: #('EDAS-Settings') ];
		package: #'EDAS-Settings-Ports'
			with: [ spec requires: #('PharoEDACommon') ];
		package: #'EDAS-Settings-Adapters-InMemory'
			with: [ spec requires: #('PharoEDACommon' 'EDAS-Settings-Ports') ];
		package: #'EDAS-Settings-Adapters-EnvVars'
			with: [ spec requires: #('PharoEDACommon' 'EDAS-Settings-Ports') ];
		package: #'EDAS-Settings-Adapters-ByPriority'
			with: [ spec
				requires:
					#('PharoEDAApi' 'EDAS-Settings-Ports' 'EDAS-Settings-Adapters-InMemory' 'EDAS-Settings-Adapters-EnvVars') ]
]

{ #category : #dependencies }
BaselineOfPharoEDASettings >> includePharoEDACommon: spec [
spec
		baseline: 'PharoEDACommon'
		with: [ spec repository: 'github://osoco/pharo-eda-common:main' ].
	^ spec
]
