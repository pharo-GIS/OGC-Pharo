"
6.1.10 Surface

6.1.10.1 Description

A Surface is a 2-dimensional geometric object.
A simple Surface may consists of a single “patch” that is associated with one “exterior boundary” and 0 or more
“interior” boundaries. A single such Surface patch in 3-dimensional space is isometric to planar Surfaces, by a
simple affine rotation matrix that rotates the patch onto the plane z = 0. If the patch is not vertical, the projection
onto the same plane is an isomorphism, and can be represented as a linear transformation, i.e. an affine. 
"
Class {
	#name : #OGCSurface,
	#superclass : #OGCGeometry,
	#category : 'OGC-Core'
}
