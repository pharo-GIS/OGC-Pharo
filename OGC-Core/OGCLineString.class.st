"
###6.1.7 LineString, Line, LinearRing

###6.1.7.1 Description 

A LineString is a Curve with linear interpolation between Points. 
Each consecutive pair of Points defines a Line segment.
"
Class {
	#name : #OGCLineString,
	#superclass : #OGCCurve,
	#category : #'OGC-Core'
}

{ #category : #accessing }
OGCLineString class >> geometryType [
	^ 'LineString'
]

{ #category : #accessing }
OGCLineString >> length [
	^ self length: points allButFirst withValue: 0 andStartedPoint: points first
]

{ #category : #initialization }
OGCLineString >> length: aCollectionOfPoints withValue: aLength andStartedPoint: aPoint [
	^ aCollectionOfPoints 
			ifEmpty: [ aLength ]
			ifNotEmpty: 
			[ self length: aCollectionOfPoints allButFirst withValue: aLength + (aPoint distance: aCollectionOfPoints first) andStartedPoint: aCollectionOfPoints first ]
]

{ #category : #access }
OGCLineString >> numPoints [
	"The number of Points in this LineString"
	^ points size
]

{ #category : #access }
OGCLineString >> pointN: anInteger [
	"Returns the specified Point N in this LineString"
	^ points at: anInteger 
]
