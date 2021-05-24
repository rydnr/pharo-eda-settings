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
			self includePharoEDAApi: spec.
			self declarePackagesIn: spec.
			self declareGroupsIn: spec ]
]

{ #category : #dependencies }
BaselineOfPharoEDASettings >> includePharoEDAApi: spec [
spec
		baseline: 'PharoEDAApi'
		with: [ spec repository: 'github://osoco/pharo-eda-api:main' ].
	^ spec
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
			with: [ spec requires: #('PharoEDAApi') ];
		package: #'EDAS-Settings-Adapters-InMemory'
			with: [ spec requires: #('PharoEDAApi' 'EDAS-Settings-Ports') ];
		package: #'EDAS-Settings-Adapters-EnvVars'
			with: [ spec requires: #('PharoEDAApi' 'EDAS-Settings-Ports') ];
		package: #'EDAS-Settings-Adapters-ByPriority'
			with: [ spec
				requires:
					#('PharoEDAApi' 'EDAS-Settings-Ports' 'EDAS-Settings-Adapters-InMemory' 'EDAS-Settings-Adapters-EnvVars') ]
]
