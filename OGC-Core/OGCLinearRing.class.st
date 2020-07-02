"
6.1.7 LineString, Line, LinearRing

6.1.7.1 Description 

A LinearRing is a LineString that is both closed and simple. The Curve in Figure 2, item (c), is a closed LineString
that is a LinearRing. The Curve in Figure 2, item (d) is a closed LineString that is not a LinearRing. 
"
Class {
	#name : #OGCLinearRing,
	#superclass : #OGCLineString,
	#category : #'OGC-Core'
}

{ #category : #accessing }
OGCLinearRing class >> geometryType [
	^ 'LinearRing'
]
