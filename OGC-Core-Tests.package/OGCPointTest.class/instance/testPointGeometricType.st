tests
testPointGeometricType
	| p |
	p := OGCPoint new.
	self assert: p geometryType equals: 'Point'