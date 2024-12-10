"
###6.1.7 LineString, Line, LinearRing

###6.1.7.1 Description 

A LinearRing is **a LineString** that is:
- **closed**: my start point is equal to my end point
- **simple**: no intersection
"
Class {
	#name : 'OGCLinearRing',
	#superclass : 'OGCLineString',
	#category : 'OGC-Core',
	#package : 'OGC-Core'
}

{ #category : 'accessing' }
OGCLinearRing class >> geometryType [
	^ 'LinearRing'
]

{ #category : 'as yet unclassified' }
OGCLinearRing class >> notALinearRing: isClosed and: isSimple [
	OGCNotALinearRingError signal: isClosed and: isSimple
]

{ #category : 'as yet unclassified' }
OGCLinearRing class >> withPoints: aCollectionOfPoints [
	| lineString |
	lineString := self superclass withPoints: aCollectionOfPoints.
	(lineString isRing)
		ifTrue: [ ^ lineString ]
		ifFalse: [ self notALinearRing: lineString isClosed and: lineString isSimple]
]
