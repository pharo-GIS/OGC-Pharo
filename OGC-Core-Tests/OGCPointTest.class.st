Class {
	#name : #OGCPointTest,
	#superclass : #TestCase,
	#category : #'OGC-Core-Tests'
}

{ #category : #tests }
OGCPointTest >> testPointEqual [
	| p1 p2 |
	p1 := OGCPoint x: 1 y: 1.
	p2 := OGCPoint x: 1 y: 1.
	self assert: (p1 = p2) 
]

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

{ #category : #tests }
OGCPointTest >> testPointMax [
	| p1 p2 |
	p1 := OGCPoint x: 1 y: 1.
	p2 := OGCPoint x: 2 y: 2.
	self assert: (p2 max: p1) equals: p2.
]

{ #category : #tests }
OGCPointTest >> testPointMin [
	| p1 p2 |
	p1 := OGCPoint x: 1 y: 1.
	p2 := OGCPoint x: 2 y: 2.
	self assert: (p2 min: p1) equals: p1.
]

{ #category : #tests }
OGCPointTest >> testPointRoundTo [
	| p1 p2 |
	p1 := OGCPoint x: 1.23456789 y: 9.87654321.
	p2 := p1 roundTo: 10 ** -5.
	self assert: p2 x asFloat equals: 1.23457.
	self assert: p2 y asFloat equals: 9.87654
]
