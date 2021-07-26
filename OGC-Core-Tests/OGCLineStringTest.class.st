Class {
	#name : #OGCLineStringTest,
	#superclass : #TestCase,
	#instVars : [
		'lineString'
	],
	#category : #'OGC-Core-Tests'
}

{ #category : #tests }
OGCLineStringTest >> testLength [
	| point1 point2 point3 point4 lineS points |
	point1 := OGCPoint xy: #(0 0).
	point2 := OGCPoint xy: #(3 0).
	point3 := OGCPoint xy: #(3 5).
	point4 := OGCPoint xy: #(10 5).
	points := OrderedCollection with: point1.
	points add: point2.
	points add: point3.
	points add: point4.
	lineS := OGCLineString withPoints: points.
	(point1 spatialReferenceSystem name = 'Geometric')
		ifTrue: [ self assert: lineS length equals: 15 ]
	

]
