"
###6.1.10 Surface

###6.1.10.1 Description

A Surface is a 2-dimensional geometric object.
A simple Surface may consists of a single “patch” that is associated with one “exterior boundary” and 0 or more
“interior” boundaries. A single such Surface patch in 3-dimensional space is isometric to planar Surfaces, by a
simple affine rotation matrix that rotates the patch onto the plane z = 0. If the patch is not vertical, the projection
onto the same plane is an isomorphism, and can be represented as a linear transformation, i.e. an affine. 
"
Class {
	#name : #OGCSurface,
	#superclass : #OGCGeometry,
	#instVars : [
		'exteriorRing'
	],
	#category : #'OGC-Core'
}

{ #category : #testing }
OGCSurface class >> isAbstract [
	^ self == OGCSurface 
]

{ #category : #basic }
OGCSurface >> area [
	"The area of this Surface, as measured in the spatial reference system of this Surface."
	self subclassResponsibility 
]

{ #category : #basic }
OGCSurface >> boundary [
	self subclassResponsibility 
]

{ #category : #basic }
OGCSurface >> centroid [
	"The mathematical centroid for this Surface as a Point. The result is not guaranteed to
be on this Surface."
	self subclassResponsibility 
]

{ #category : #basic }
OGCSurface >> dimension [ 
	"The inherent dimension of this geometric object, which must be less than or equal to the coordinate dimension."
	^ 2
]

{ #category : #basic }
OGCSurface >> pointOnSurface [
	"A Point guaranteed to be on this Surface"
	self subclassResponsibility 
]

{ #category : #basic }
OGCSurface >> rectangularEnvelope [
	" Returns [ minX, maxX, minY, maxY ] to define minimal rectangle which contains all features "
	^ exteriorRing rectangularEnvelope
]
