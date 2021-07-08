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
		'z',
		'm'
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

{ #category : #'instance creation' }
OGCPoint class >> x: xNumber y: yNumber m:mNumber [
	^ self new 
		x: xNumber;
		y: yNumber;
		m: mNumber
]

{ #category : #'accessing structure variables' }
OGCPoint class >> xy: anArray [
	^ self x: anArray first y: anArray second
]

{ #category : #'as yet unclassified' }
OGCPoint class >> xym: anArray [
	^ self x: anArray first y: anArray second m: anArray last
]

{ #category : #comparing }
OGCPoint >> = anOGCPoint [
	^ (x = anOGCPoint x) & (y = anOGCPoint y) & (z = anOGCPoint z)
]

{ #category : #conversion }
OGCPoint >> asPoint [
	^ x @ y
]

{ #category : #basic }
OGCPoint >> boundary [
	"Geometry — Returns the closure of the combinatorial boundary of this geometric object
(Reference [1], section 3.12.2). Because the result of this function is a closure, and hence topologically
closed, the resulting boundary can be represented using representational Geometry primitives (Reference [1],
section 3.12.2). The return type is integer, but is interpreted as Boolean, TRUE=1, FALSE=0."
	^ OGCEmptySet new
]

{ #category : #accessing }
OGCPoint >> dimension [
	^ 0
]

{ #category : #comparing }
OGCPoint >> hash [ 
	^ (x hash bitXor: y hash) bitXor: z hash
]

{ #category : #testing }
OGCPoint >> is3D [ 
	^ z notNil
]

{ #category : #testing }
OGCPoint >> locateBetween: mStart and: mEnd [
	"Returns a derived geometry collection value
that matches the specified range of m coordinate values inclusively. See Subclause 6.1.2.6 “Measures on
Geometry” for more details."
	^ (m >= mStart and: m<= mEnd) 
			ifTrue: [ OGCMultiPoint withPoints: (Bag with: self) ]
			ifFalse: [ OGCEmptySet new ]
]

{ #category : #accessing }
OGCPoint >> m [
	^ m
]

{ #category : #accessing }
OGCPoint >> m: aFloat [
	m := aFloat
]

{ #category : #accessing }
OGCPoint >> max: anOGCPoint [ 

	^ OGCPoint 
		x: (x max: anOGCPoint x) 
		y: (y max: anOGCPoint y)
]

{ #category : #accessing }
OGCPoint >> min: anOGCPoint [ 

	^ OGCPoint 
		x: (x min: anOGCPoint x) 
		y: (y min: anOGCPoint y)
]

{ #category : #printing }
OGCPoint >> printOn: aStream [ 
	aStream << x asString << ',' << y asString.
	z ifNotNil: [ 
		aStream << ',' << z asString ]
]

{ #category : #'truncation and round off' }
OGCPoint >> roundTo: grid [
	
	| gridPoint |
	gridPoint := grid asOGCPoint.
	^ OGCPoint 
		x: (x roundTo: gridPoint x) 
		y: (y roundTo: gridPoint y)
]

{ #category : #geometry }
OGCPoint >> to: end1 intersects: start2 to: end2 [ 
	^ self asPoint to: end1 intersects: start2 to: end2
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
