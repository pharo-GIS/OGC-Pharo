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
OGCGeometricIntersectionsTest >> testLineIntersectionWithPoint [
	| line point1 point2 point3 point4 |
	point1 := OGCPoint xy: { 1 . 1 }.
	point2 := OGCPoint xy: { 2 . 2 }.
	point3 := OGCPoint xy: { 3 . 3 }. 
	point4 := OGCPoint xy: { -1 . -1 }.
	line := OGCLine withPoints: { point1. point3 }.
	self assert: (point2 intersection: line) equals: point2.
	self assert: (point4 intersection: line) equals: OGCEmptySet new.
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
]

{ #category : #tests }
OGCGeometricIntersectionsTest >> testPointIntersectionWithPoint [
	| point1 point2 |
	point1 := OGCPoint xy: { 1 . 1 }.
	point2 := OGCPoint xy: { 2 . 2 }.
	self assert: (point1 intersection: point2) equals: OGCEmptySet new.
	self assert: (point1 intersection: point1) equals: point1
]
