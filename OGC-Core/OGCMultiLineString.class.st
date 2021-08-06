"
6.1.9 MultiLineString

A MultiLineString is a MultiCurve whose elements are LineStrings. 
"
Class {
	#name : #OGCMultiLineString,
	#superclass : #OGCMultiCurve,
	#category : #'OGC-Core'
}

{ #category : #accessing }
OGCMultiLineString class >> geometryType [
	^ 'MultiLineString'
]

{ #category : #accessing }
OGCMultiLineString >> coordinates: aCollection [ 
	geometries := aCollection collect: [ :each |
		OGCLineString new coordinates: each ]
]
