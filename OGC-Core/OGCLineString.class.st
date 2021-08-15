"
###6.1.7 LineString, Line, LinearRing

###6.1.7.1 Description 

A LineString is a Curve with linear interpolation between Points. 
Each consecutive pair of Points defines a Line segment.
"
Class {
	#name : #OGCLineString,
	#superclass : #OGCCurve,
	#instVars : [
		'lines'
	],
	#category : #'OGC-Core'
}

{ #category : #accessing }
OGCLineString class >> geometryType [
	^ 'LineString'
]

{ #category : #'as yet unclassified' }
OGCLineString >> getLines [
	| resultLines |
	resultLines := OrderedCollection new.
	points allButLast doWithIndex: [ :point :index | resultLines add: (OGCLine withPoints: { point . (points at: (index + 1 ) ) }) ].
	^ resultLines
]

{ #category : #enumerating }
OGCLineString >> intersection: anotherGeometry [
	| allIntersections |
	allIntersections := self lines collect: [ :aLine | aLine intersection: anotherGeometry ].
	^ allIntersections 
]

{ #category : #accessing }
OGCLineString >> length [
	| lengthLines |
	lengthLines := (self lines collect: [ :aLine | aLine length ]).
	^ lengthLines ifNotEmpty: [ lengthLines sum ] ifEmpty: [ 0 ]
]

{ #category : #initialization }
OGCLineString >> length: aCollectionOfPoints withValue: aLength andStartedPoint: aPoint [
	^ aCollectionOfPoints 
			ifEmpty: [ aLength ]
			ifNotEmpty: 
			[ self length: aCollectionOfPoints allButFirst withValue: aLength + (aPoint distance: aCollectionOfPoints first) andStartedPoint: aCollectionOfPoints first ]
]

{ #category : #accessing }
OGCLineString >> lines [
	^ lines ifNil: [ lines := self getLines ]
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
