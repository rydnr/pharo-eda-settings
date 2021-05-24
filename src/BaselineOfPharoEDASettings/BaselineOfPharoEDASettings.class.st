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
			self declarePackagesIn: spec.
			self declareGroupsIn: spec ]
]

{ #category : #meta }
BaselineOfPharoEDASettings >> declareGroupsIn: spec [
	spec
		group: 'core' with: #(#'EDAS-Settings');
		group: 'tests' with: #(#'EDAS-Settings-Tests');
		group: 'default' with: #('core' 'tests')
]

{ #category : #meta }
BaselineOfPharoEDASettings >> declarePackagesIn: spec [
	spec
		package: #'EDAS-Settings';
		package: #'EDAS-Settings-Tests' with: [ spec requires: #('EDAS-Settings') ]
]
