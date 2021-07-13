Class {
	#name : #OGCLinearRingTest,
	#superclass : #TestCase,
	#category : #'OGC-Core-Tests'
}

{ #category : #tests }
OGCLinearRingTest >> testErrorNotALinearRingWithNotClosed [
	| points |
	points := OrderedCollection with: (OGCPoint x: 0 y:0).
	points add: (OGCPoint x:1 y:1) .
	points add: (OGCPoint x: 2 y:2) .
	self should: [ OGCLinearRing withPoints: points ] raise: OGCErrorNotALinearRing 
]

{ #category : #tests }
OGCLinearRingTest >> testErrorNotALinearRingWithNotSimple [
	| points |
	points := OrderedCollection with: (OGCPoint x: 0 y:0) with: (OGCPoint x:1 y:1) .
	points add: (OGCPoint x:1 y:1) .
	points add: (OGCPoint x: 0 y:0) .
	self should: [ OGCLinearRing withPoints: points ] raise: OGCErrorNotALinearRing 
]
