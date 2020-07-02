Class {
	#name : #OGCPointTest,
	#superclass : #TestCase,
	#category : #'OGC-Core-Tests'
}

{ #category : #tests }
OGCPointTest >> testPointGeometricType [
	| p |
	p := OGCPoint new.
	self assert: p geometryType equals: 'Point'
]

{ #category : #tests }
OGCPointTest >> testPointHasNoDimension [
	| p |
	p := OGCPoint new
		x: 0;
		y: 0.
	self assert: p dimension equals: 0
]

{ #category : #tests }
OGCPointTest >> testPointIs3D [
	| p |
	p := OGCPoint new
		x: 0;
		y: 0;
		z: 1.
	self assert: p is3D.
]

{ #category : #tests }
OGCPointTest >> testPointIsNot3D [
	| p |
	p := OGCPoint new
		x: 0;
		y: 0.
	self deny: p is3D.
]
