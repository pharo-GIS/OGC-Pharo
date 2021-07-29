Class {
	#name : #BaselineOfOGC,
	#superclass : #BaselineOf,
	#category : #BaselineOfOGC
}

{ #category : #baselines }
BaselineOfOGC >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		self geometry: spec.
		spec 
			package: #'OGC-Core';
			package: #'OGC-Core-Tests' with: [
				spec requires: #('OGC-Core' ) ];
			package: #'OGC-Geometry' with: [ 
				spec requires: #('OGC-Core' 'Geometry') ];
			package: #'OGC-Geometry-Tests' with: [ 
				spec requires: #('OGC-Core-Tests' 'OGC-Geometry') ];
			package: #'OGC-Spheric' with: [ 
				spec requires: #('OGC-Core' ) ];
			package: #'OGC-Spheric-Tests' with: [ 
				spec requires: #('OGC-Core-Tests' 'OGC-Spheric') ].
		spec 
			group: 'Core' with: #('OGC-Core' );
			group: 'Tests' with: #('OGC-Core-Tests');
			group: 'Geometric' with: #('OGC-Geometry' 'OGC-Geometry-Tests');
			group: 'Spheric' with: #('OGC-Spheric' 'OGC-Spheric-Tests');
			group: 'default' with: #('Core' 'Tests' 'Geometric' 'Spheric'). 
		]

]

{ #category : #accessing }
BaselineOfOGC >> geometry: spec [ 
	"For Geometric projection computation"
	spec
    	baseline: 'Geometry'
 		with: [ 
			spec repository: 'github://pharo-contributions/Geometry:master/src' ]
]
