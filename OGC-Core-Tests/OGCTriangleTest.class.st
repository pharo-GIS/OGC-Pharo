Class {
	#name : #OGCTriangleTest,
	#superclass : #TestCase,
	#category : #'OGC-Core-Tests'
}

{ #category : #tests }
OGCTriangleTest >> testArea [
	| point1 point2 point3 lineS triangle points |
	point1 := OGCPoint xy: #(0 0).
	point2 := OGCPoint xy: #(1 0).
	point3 := OGCPoint xy: #(0 1).
	points := OrderedCollection with: point1.
	points add: point2.
	points add: point3.
	lineS := OGCLineString withPoints: points.
	triangle := OGCTriangle withExteriorRing: lineS.
	(point1 spatialReferenceSystem name = 'Geometric')
		ifTrue: [ self assert: (triangle area round: 4) equals: 0.5 ]
	
]
