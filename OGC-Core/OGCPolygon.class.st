"
6.1.11 Polygon, Triangle

6.1.11.1 Description

A Polygon is a planar Surface defined by 1 exterior boundary and 0 or more interior boundaries. Each interior
boundary defines a hole in the Polygon. A Triangle is a polygon with 3 distinct, non-collinear vertices and no
interior boundary.
The exterior boundary LinearRing defines the “top” of the surface which is the side of the surface from which the
exterior boundary appears to traverse the boundary in a counter clockwise direction. The interior LinearRings will
have the opposite orientation, and appear as clockwise when viewed from the “top”,
The assertions for Polygons (the rules that define valid Polygons) are as follows:
a) Polygons are topologically closed;
b) The boundary of a Polygon consists of a set of LinearRings that make up its exterior and interior boundaries;
c) No two Rings in the boundary cross and the Rings in the boundary of a Polygon may intersect at a Point but
only as a tangent, e.g. 
"
Class {
	#name : #OGCPolygon,
	#superclass : #OGCSurface,
	#instVars : [
		'interiorRings'
	],
	#category : #'OGC-Core'
}

{ #category : #accessing }
OGCPolygon class >> geometryType [
	^ 'Polygon'
]

{ #category : #accessing }
OGCPolygon >> addInteriorRing: anOGCLinearRing [
	interiorRings add: anOGCLinearRing 
]

{ #category : #accessing }
OGCPolygon >> exteriorRing [
	"Returns the exterior ring of this Polygon as a LineString"
	^ exteriorRing
]

{ #category : #accessing }
OGCPolygon >> exteriorRing: anObject [
	exteriorRing := anObject
]

{ #category : #accessing }
OGCPolygon >> interiorRingN: anInteger [
	"Returns the Nth interior ring for this Polygon as a LineString."
	^ interiorRings at: anInteger
]

{ #category : #accessing }
OGCPolygon >> interiorRings [
	^ interiorRings ifNil: [ 
		interiorRings := OrderedCollection new ]
]

{ #category : #accessing }
OGCPolygon >> interiorRings: anObject [
	interiorRings := anObject
]

{ #category : #accessing }
OGCPolygon >> numInteriorRing [
	"Returns the number of interior rings in this Polygon"
	^ interiorRings size
]
