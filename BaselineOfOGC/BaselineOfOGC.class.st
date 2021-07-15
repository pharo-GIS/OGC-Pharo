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
			package: #'OGC-Geometric-Computations' with: [ 
				spec requires: #('OGC-Core' 'Geometry') ];
			package: #'OGC-Geometric-Computations-Tests' with: [ 
				spec requires: #('OGC-Core-Tests' 'OGC-Geometric-Computations') ].
		spec 
			group: 'Core' with: #('OGC-Core' );
			group: 'Tests' with: #('OGC-Core-Tests');
			group: 'Geometric' with: #('OGC-Geometric-Computations' 'OGC-Geometric-Computations-Tests');
			group: 'default' with: #('Core' 'Tests'). 
			
		"For Geometric projection computation"
		spec
    	baseline: 'Geometry'
    	with: [ spec repository: 'github://pharo-contributions/Geometry:master/src' ]	].

]
