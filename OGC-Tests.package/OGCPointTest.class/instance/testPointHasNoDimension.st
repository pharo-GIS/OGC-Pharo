tests
testPointHasNoDimension
	| p |
	p := OGCPoint new
		x: 0;
		y: 0.
	self assert: p dimension equals: 0