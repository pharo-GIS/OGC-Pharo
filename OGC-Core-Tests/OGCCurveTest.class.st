Class {
	#name : #OGCCurveTest,
	#superclass : #TestCase,
	#instVars : [
		'c',
		'ringCurve'
	],
	#category : #'OGC-Core-Tests'
}

{ #category : #running }
OGCCurveTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	| points closedPoints |
	points := OrderedCollection with: (OGCPoint x: 0 y:0) with: (OGCPoint x:1 y:1) .
	closedPoints := points copy.
	closedPoints add: (OGCPoint x:0 y:0) .
	ringCurve := OGCCurve withPoints: closedPoints.
	points add: (OGCPoint x:1 y:1) .
	points add: (OGCPoint x: 2 y:2) .
	c := OGCCurve withPoints: points.
	
]

{ #category : #tests }
OGCCurveTest >> testCurveBoundary [
	self assert: c boundary equals: (OGCCurve withPoints: (OrderedCollection with: (OGCPoint x: 1 y:1) with: (OGCPoint x:2 y:2) )).
	self assert: ringCurve boundary class equals: OGCEmptySet.
]

{ #category : #tests }
OGCCurveTest >> testCurveEndPoint [
	self assert: c endPoint equals: (OGCPoint x: 2 y: 2)
]

{ #category : #tests }
OGCCurveTest >> testCurveGeometricType [
	self assert: c geometryType equals: 'Curve'
]

{ #category : #tests }
OGCCurveTest >> testCurveHasDimension1 [
	self assert: c dimension equals: 1
]

{ #category : #tests }
OGCCurveTest >> testCurveIsClosed [
	self assert: c isClosed equals: false.
	self assert: ringCurve isClosed equals: true.
]

{ #category : #tests }
OGCCurveTest >> testCurveIsRing [
	self assert: c isRing equals: false.
	self assert: ringCurve isRing equals: true.
]

{ #category : #tests }
OGCCurveTest >> testCurveIsSimple [
	self assert: c isSimple equals: false.
	self assert: ringCurve isSimple equals: true.
]

{ #category : #tests }
OGCCurveTest >> testCurveStartPoint [
	self assert: c startPoint equals: (OGCPoint x: 0 y: 0)
]
