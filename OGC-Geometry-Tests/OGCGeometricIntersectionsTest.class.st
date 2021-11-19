Class {
	#name : #OGCGeometricIntersectionsTest,
	#superclass : #TestCase,
	#category : #'OGC-Geometry-Tests'
}

{ #category : #tests }
OGCGeometricIntersectionsTest >> testLineIntersectionWithLine [
	| point1 point2 point3 point4 pointIntersection line1 line2 parallelLine1 parallelLine2 |
	point1 := OGCPoint xy: #(-1 -1).
	point2 := OGCPoint xy: #(1 1).
	point3 := OGCPoint xy: #(-1 1).
	point4 := OGCPoint xy: #(1 -1).
	pointIntersection := OGCPoint xy: #(0 0).
	line1 := OGCLine withPoints: { point1 . point2 }.
	line2 := OGCLine withPoints: { point3 . point4 }.
	parallelLine1 := OGCLine withPoints: { point1 . point4 }.
	parallelLine2 := OGCLine withPoints: { point3 . point2 }.
	" case secant lines"
	self assert: (line1 intersection: line2) equals: pointIntersection.
	" case paralell lines"
	self assert: (parallelLine1 intersection: parallelLine2 ) equals: OGCEmptySet new.
	" case mixed lines (?) "
	
	
]

{ #category : #tests }
OGCGeometricIntersectionsTest >> testLineStringIntersectionWithLine [
	| p1 p2 p3 p4 p5 p6 p7 linestring line intersection1 intersection2 |
	p1 := OGCPoint xy: { 0 . 0 }.
	p2:= OGCPoint xy: { 3 . 0 }.
	p3:= OGCPoint xy: { 1 . 1 }.
	p4:= OGCPoint xy: { 1 . -1 }.
	p5:= OGCPoint xy: { 2 . -1 }.
	p6:= OGCPoint xy: { 2 . 1 }.
	intersection1 := OGCPoint xy: { 1 . 0 }.
	intersection2 := OGCPoint xy: { 2 . 0 }.
	linestring := OGCLineString withPoints: { p3 . p4 . p5 . p6 }.
	line := OGCLine withPoints: { p1 . p2 }.
	self assert: (linestring intersection: line) equals: (OGCGeometryCollection geometries: { intersection1 . intersection2  }).
	self assert: (line intersection: linestring) equals: (OGCGeometryCollection geometries: { intersection1 . intersection2  }).
	p7 := OGCPoint xy: { 0 . -1 }.
	self assert: (linestring intersection: (OGCLine withPoints: { p1 . p7 })) equals: OGCEmptySet new.
	self assert: ((OGCLine withPoints: { p1 . p7 }) intersection: linestring) equals: OGCEmptySet new.
]

{ #category : #tests }
OGCGeometricIntersectionsTest >> testLineStringIntersectionWithLineString [
	| pa1 pa2 pa3 pa4 pb1 pb2 pb3 pb4 lsa lsb intersect1 intersect2 intersect3 |
	pa1 := OGCPoint xy: { 0 . -1 }.
	pa2 := OGCPoint xy: { 2 . 1 }.
	pa3 := OGCPoint xy: { 4 . -1 }.
	pa4 := OGCPoint xy: { 6 . 1 }.
	pb1 := (pa1 deepCopy) y: (pa1 y negated).
	pb2 := (pa2 deepCopy) y: (pa2 y negated).
	pb3 := (pa3 deepCopy) y: (pa3 y negated).
	pb4 := (pa4 deepCopy) y: (pa4 y negated).
	intersect1 := OGCPoint xy: { 1 . 0 }.
	intersect2 := OGCPoint xy: { 3 . 0 }.
	intersect3 := OGCPoint xy: { 5 . 0 }.
	lsa := OGCLineString withPoints: { pa1 . pa2 . pa3 . pa4 }.
	lsb := OGCLineString withPoints: { pb1 . pb2 . pb3 . pb4 }.
	self assert: (lsa intersection: lsb) equals: (OGCGeometryCollection geometries: { intersect1 . intersect2 . intersect3 }).
	
]

{ #category : #tests }
OGCGeometricIntersectionsTest >> testLineStringIntersectionWithPoint [
	| p3 p4 p5 p6 p7 linestring intersection1 |
	p3:= OGCPoint xy: { 1 . 1 }.
	p4:= OGCPoint xy: { 1 . -1 }.
	p5:= OGCPoint xy: { 2 . -1 }.
	p6:= OGCPoint xy: { 2 . 1 }.
	intersection1 := OGCPoint xy: { 1 . 0 }.
	linestring := OGCLineString withPoints: { p3 . p4 . p5 . p6 }.
	self assert: (linestring intersection: intersection1) equals: (intersection1).
	self assert: (intersection1 intersection: linestring) equals: (intersection1).
	p7 := OGCPoint xy: { 0 . -1 }.
	self assert: (linestring intersection: p7) equals: OGCEmptySet new.
	self assert: (p7 intersection: linestring) equals: OGCEmptySet new.
]

{ #category : #tests }
OGCGeometricIntersectionsTest >> testPointIntersectionWithLine [
	| line point1 point2 point3 point4 |
	point1 := OGCPoint xy: { 1 . 1 }.
	point2 := OGCPoint xy: { 2 . 2 }.
	point3 := OGCPoint xy: { 3 . 3 }. 
	point4 := OGCPoint xy: { -1 . -1 }.
	line := OGCLine withPoints: { point1. point3 }.
	self assert: (line intersection: point2) equals: point2.
	self assert: (line intersection: point4) equals: OGCEmptySet new.
	self assert: (point2 intersection: line) equals: point2.
	self assert: (point4 intersection: line) equals: OGCEmptySet new.
]

{ #category : #tests }
OGCGeometricIntersectionsTest >> testPointIntersectionWithPoint [
	| point1 point2 |
	point1 := OGCPoint xy: { 1 . 1 }.
	point2 := OGCPoint xy: { 2 . 2 }.
	self assert: (point1 intersection: point2) equals: OGCEmptySet new.
	self assert: (point1 intersection: point1) equals: point1
]
