"
###6.1.5 MultiPoint

A MultiPoint is a 0-dimensional GeometryCollection. The elements of a MultiPoint are restricted to Points. 

The Points are not connected or ordered in any semantically important way (see the discussion at GeometryCollection).

A MultiPoint is simple if no two Points in the MultiPoint are equal (have identical coordinate values in X and Y).
Every MultiPoint is spatially equal under the definition in Clause 6.1.15.3 to a simple Multipoint.
The boundary of a MultiPoint is the empty set. 
"
Class {
	#name : 'OGCMultiPoint',
	#superclass : 'OGCGeometryCollection',
	#category : 'OGC-Core',
	#package : 'OGC-Core'
}

{ #category : 'accessing' }
OGCMultiPoint class >> geometryType [
	^ 'MultiPoint'
]

{ #category : 'instance creation' }
OGCMultiPoint class >> withPoints: aBagOfPoints [
	^ self new geometries: aBagOfPoints 
]

{ #category : 'basic' }
OGCMultiPoint >> boundary [
	^ OGCEmptySet new
]

{ #category : 'accessing' }
OGCMultiPoint >> dimension [ 
	"The inherent dimension of this geometric object, which must be less than or equal to the coordinate dimension."
	^ 0 
]

{ #category : 'basic' }
OGCMultiPoint >> isSimple [
	"A MultiPoint is simple if no two Points in the MultiPoint are equal"
	^ (self geometries size == self geometries asSet size)
]

{ #category : 'testing' }
OGCMultiPoint >> locateAlong: mValue [
	"Returns a derived geometry collection value that matches the
specified m coordinate value. See Subclause 6.1.2.6 “Measures on Geometry” for more details"
	^ self locateBetween: mValue and: mValue
]

{ #category : 'testing' }
OGCMultiPoint >> locateBetween: mStart and: mEnd [
	| resultPoints |
	resultPoints := self geometries select: [ :each | each m >= mStart and: each m<= mEnd ].
	^ self class withPoints: resultPoints
]
