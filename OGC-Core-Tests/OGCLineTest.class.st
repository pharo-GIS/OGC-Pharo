Class {
	#name : #OGCLineTest,
	#superclass : #TestCase,
	#instVars : [
		'line'
	],
	#category : #'OGC-Core-Tests'
}

{ #category : #'tests - errors' }
OGCLineTest >> testErrorTooManyPoints [
	| point1 point2 point3 points |
	point1 := OGCPoint xy: #(0 0).
	point2 := OGCPoint xy: #(1 0).
	point3 := OGCPoint xy: #(0 1).
	points := OrderedCollection with: point1.
	points add: point2.
	points add: point3.
	self should: [ OGCLine withPoints: points ] raise: TooManyPoints
]

{ #category : #tests }
OGCLineTest >> testLength [
	| point1 point2 points |
	point1 := OGCPoint xy: #(0 0).
	point2 := OGCPoint xy: #(3 0).
	points := OrderedCollection with: point1.
	points add: point2.
	line := OGCLine withPoints: points.
	self assert: line length equals: 3
]
