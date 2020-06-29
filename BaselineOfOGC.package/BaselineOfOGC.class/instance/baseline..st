baselines
baseline: spec
	<baseline>

	spec for: #'common' do: [
		spec 
			package: #'OGC-Core';
			package: #'OGC-Core-Tests' with: [
				spec requires: #('OGC-Core' ) ].
		spec 
			group: 'Core' with: #('OGC-Core' );
			group: 'Tests' with: #('OGC-Core-Tests');
			group: 'default' with: #('Core' 'Tests'). ].
