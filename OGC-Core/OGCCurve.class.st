"
6.1.6 Curve

6.1.6.1 Description

A Curve is a 1-dimensional geometric object usually stored as a sequence of Points, with the subtype of Curve
specifying the form of the interpolation between Points. This standard defines only one subclass of Curve,
LineString, which uses linear interpolation between Points. 
"
Class {
	#name : #OGCCurve,
	#superclass : #OGCGeometry,
	#instVars : [
		'points'
	],
	#category : #'OGC-Core'
}

{ #category : #accessing }
OGCCurve class >> geometryType [
	^ 'Curve'
]

{ #category : #'as yet unclassified' }
OGCCurve class >> points: aCollectionOfPoints [
	^ self new points: aCollectionOfPoints 
]

{ #category : #'as yet unclassified' }
OGCCurve class >> withPoints: aCollectionOfPoints [
	^ self new points: aCollectionOfPoints 
]

{ #category : #testing }
OGCCurve >> = anotherCurve [
	^ (self points) = (anotherCurve points)
]

{ #category : #basic }
OGCCurve >> boundary [
	"The boundary of a non-closed Curve consists of its two end Points. The boundary of a closed Curve is empty."
	self isClosed ifFalse: [ ^ OGCCurve withPoints: (OrderedCollection with: (self points allButLast last) with: self endPoint)  ] ifTrue: [ ^ OGCEmptySet new ]
]

{ #category : #accessing }
OGCCurve >> dimension [ 
	"The inherent dimension of this geometric object, which must be less than or equal to the coordinate dimension."
	^ 1
]

{ #category : #accessing }
OGCCurve >> endPoint [
	^ points last
]

{ #category : #accessing }
OGCCurve >> isClosed [
	^ self startPoint = self endPoint
]

{ #category : #testing }
OGCCurve >> isRing [
	^ self isClosed & self isSimple
]

{ #category : #basic }
OGCCurve >> isSimple [
	"A Curve is simple if it does not pass through the same Point twice with the possible exception of the two end
points"
	| setSize |
	setSize := points asSet size.
	^ (points size == setSize) ifFalse: [ (setSize == (points size - 1)) and: (self isClosed) ]
]

{ #category : #accessing }
OGCCurve >> length [
	^ points size
]

{ #category : #accessing }
OGCCurve >> points [
	^ points
]

{ #category : #accessing }
OGCCurve >> points: anObject [
	points := anObject
]

{ #category : #accessing }
OGCCurve >> startPoint [
	^ points first
]
