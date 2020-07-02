"
6.1.4 Point

6.1.4.1 Description

A Point is a 0-dimensional geometric object and represents a single location in coordinate space. A Point has an
x-coordinate value, a y-coordinate value. If called for by the associated Spatial Reference System, it may also
have coordinate values for z and m.
The boundary of a Point is the empty set. 
"
Class {
	#name : #OGCPoint,
	#superclass : #OGCGeometry,
	#instVars : [
		'x',
		'y',
		'z'
	],
	#category : #'OGC-Core'
}

{ #category : #accessing }
OGCPoint class >> geometryType [
	^ 'Point'
]

{ #category : #'instance creation' }
OGCPoint class >> x: xNumber y: yNumber [
	^ self new 
		x: xNumber;
		y: yNumber 
]

{ #category : #accessing }
OGCPoint >> dimension [
	^ 0
]

{ #category : #testing }
OGCPoint >> is3D [ 
	^ z notNil
]

{ #category : #printing }
OGCPoint >> printOn: aStream [ 
	aStream << x asString << ',' << y asString.
	z ifNotNil: [ 
		aStream << ',' << z asString ]
]

{ #category : #accessing }
OGCPoint >> x [
	^ x
]

{ #category : #accessing }
OGCPoint >> x: aFloat [
	x:= aFloat 
]

{ #category : #accessing }
OGCPoint >> y [
	^ y
]

{ #category : #accessing }
OGCPoint >> y: aFloat [
	y:= aFloat
]

{ #category : #accessing }
OGCPoint >> z [
	^ z
]

{ #category : #accessing }
OGCPoint >> z: aFloat [
	z := aFloat
]
