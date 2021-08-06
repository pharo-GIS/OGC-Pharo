"
6.1.14 MultiPolygon

A MultiPolygon is a MultiSurface whose elements are Polygons.

The assertions for MultiPolygons are as follows.
a) The interiors of 2 Polygons that are elements of a MultiPolygon may not intersect.
b) The boundaries of any 2 Polygons that are elements of a MultiPolygon may not “cross” and may touch at only a finite number of Points.
NOTE Crossing is prevented by assertion (a) above. 
c) A MultiPolygon is defined as topologically closed.
d) A MultiPolygon may not have cut lines, spikes or punctures, a MultiPolygon is a regular closed Point set
e) The interior of a MultiPolygon with more than 1 Polygon is not connected; the number of connected
components of the interior of a MultiPolygon is equal to the number of Polygons in the MultiPolygon.
The boundary of a MultiPolygon is a set of closed Curves (LineStrings) corresponding to the boundaries of its
element Polygons. Each Curve in the boundary of the MultiPolygon is in the boundary of exactly 1 element
Polygon, and every Curve in the boundary of an element Polygon is in the boundary of the MultiPolygon.
The reader is referred to works by Worboys et al.([13], [14]) and Clementini et al. ([5], [6]) for the definition and
specification of MultiPolygons. 
"
Class {
	#name : #OGCMultiPolygon,
	#superclass : #OGCMultiSurface,
	#category : #'OGC-Core'
}

{ #category : #accessing }
OGCMultiPolygon class >> geometryType [
	^ 'MultiPolygon'
]

{ #category : #accessing }
OGCMultiPolygon >> coordinates: aCollection [ 
	self geometries: (aCollection collect: [ :each |
		OGCPolygon new coordinates: each ])
]
