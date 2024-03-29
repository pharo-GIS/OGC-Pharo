"
###6.1.7 LineString, Line, LinearRing

###6.1.7.1 Description 

A Line is a LineString with exactly 2 Points = a segment.

Instanciation: `OGCLine class>>#withPoints:`
"
Class {
	#name : #OGCLine,
	#superclass : #OGCLineString,
	#category : #'OGC-Core'
}

{ #category : #'as yet unclassified' }
OGCLine class >> errorIncorrectNumberOfPoints: anInteger [
	OGCIncorrectNumberOfPointsError signalWith: anInteger
]

{ #category : #accessing }
OGCLine class >> geometryType [
	^ 'Line'
]

{ #category : #'as yet unclassified' }
OGCLine class >> withPoints: aCollectionOfPoints [
	(aCollectionOfPoints size = 2) 
		ifTrue: [ ^ self new points: aCollectionOfPoints ]
		ifFalse: [ self errorIncorrectNumberOfPoints: aCollectionOfPoints size]
]

{ #category : #accessing }
OGCLine >> length [
	^ spatialReferenceSystem length: self
]
