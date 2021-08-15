Extension { #name : #OGCLineStringTest }

{ #category : #'*OGC-Geometry-Tests' }
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

{ #category : #'*OGC-Geometry-Tests' }
OGCLineStringTest >> testLineStringsIntersection [
	| point1 point2 point3 point4 pointIntersection line1 line2 |
	point1 := OGCPoint xy: #(-1 -1).
	point2 := OGCPoint xy: #(1 1).
	point3 := OGCPoint xy: #(-1 1).
	point4 := OGCPoint xy: #(1 -1).
	pointIntersection := OGCPoint xy: #(0 0).
	line1 := OGCLineString withPoints: { point1 . point2 }.
	line2 := OGCLineString withPoints: { point3 . point4 }.
	(point1 spatialReferenceSystem name = 'Geometric')
		ifTrue: [ self assert: (line1 intersection: line2) equals: pointIntersection ]
		ifFalse: [ self skip ]
]

{ #category : #'*OGC-Geometry-Tests' }
OGCLineStringTest >> testLinesIntersection [
	| point1 point2 point3 point4 pointIntersection line1 line2 |
	point1 := OGCPoint xy: #(-1 -1).
	point2 := OGCPoint xy: #(1 1).
	point3 := OGCPoint xy: #(-1 1).
	point4 := OGCPoint xy: #(1 -1).
	pointIntersection := OGCPoint xy: #(0 0).
	line1 := OGCLine withPoints: { point1 . point2 }.
	line2 := OGCLine withPoints: { point3 . point4 }.
	(point1 spatialReferenceSystem name = 'Geometric')
		ifTrue: [ self assert: (line1 intersection: line2) equals: pointIntersection ]
]
