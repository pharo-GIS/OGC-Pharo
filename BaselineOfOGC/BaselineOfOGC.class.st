Class {
	#name : #BaselineOfOGC,
	#superclass : #BaselineOf,
	#category : #BaselineOfOGC
}

{ #category : #baselines }
BaselineOfOGC >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec 
			package: #'OGC-Core';
			package: #'OGC-Core-Tests' with: [
				spec requires: #('OGC-Core' ) ];
			package: #'OGC-Geometry' with: [ 
				spec requires: #('OGC-Core' 'Geometry') ];
			package: #'OGC-Geometry-Tests' with: [ 
				spec requires: #('OGC-Core-Tests' 'OGC-Geometry') ].
		spec 
			group: 'Core' with: #('OGC-Core' );
			group: 'Tests' with: #('OGC-Core-Tests');
			group: 'OGC-Geometry' with: #('OGC-Geometry' 'OGC-Geometry-Tests');
			group: 'default' with: #('Core' 'Tests' 'OGC-Geometry'). 
			
		"For Geometric projection computation"
		spec
    	baseline: 'Geometry'
    	with: [ spec repository: 'github://pharo-contributions/Geometry:master/src' ].	
	
		].

]
