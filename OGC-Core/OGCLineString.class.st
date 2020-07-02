"
6.1.7 LineString, Line, LinearRing

6.1.7.1 Description 

A LineString is a Curve with linear interpolation between Points. Each consecutive pair of Points defines a Line
segment.
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
