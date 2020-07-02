"
6.1.5 MultiPoint

A MultiPoint is a 0-dimensional GeometryCollection. The elements of a MultiPoint are restricted to Points. The
Points are not connected or ordered in any semantically important way (see the discussion at
GeometryCollection).
A MultiPoint is simple if no two Points in the MultiPoint are equal (have identical coordinate values in X and Y).
Every MultiPoint is spatially equal under the definition in Clause 6.1.15.3 to a simple Multipoint.
The boundary of a MultiPoint is the empty set. 
"
Class {
	#name : #OGCMultiPoint,
	#superclass : #OGCGeometryCollection,
	#category : 'OGC-Core'
}
