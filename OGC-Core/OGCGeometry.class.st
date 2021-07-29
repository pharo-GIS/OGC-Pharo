"
6.1.2 Geometry

6.1.2.1 Description 

Geometry is the root class of the hierarchy. Geometry is an abstract (non-instantiable) class.
The instantiable subclasses of Geometry defined in this Standard are restricted to 0, 1 and
2-dimensional geometric objects that exist in 2, 3 or 4-dimensional coordinate space. 
Geometry values in R2 have points with coordinate values for x and y. Geometry values in R3 have points with coordinate
values for x, y and z or for x, y and m. Geometry values in R4 have points with coordinate values for x, y, z and m.
The interpretation of the coordinates is subject to the coordinate reference systems associated to the point. All
coordinates within a geometry object should be in the same coordinate reference systems. Each coordinate shall
be unambiguously associated to a coordinate reference system either directly or through its containing geometry.
The z coordinate of a point is typically, but not necessarily, represents altitude or elevation. The m coordinate
represents a measurement.
All Geometry classes described in this standard are defined so that instances of Geometry are topologically
closed, i.e. all represented geometries include their boundary as point sets. This does not affect their 
"
Class {
	#name : #OGCGeometry,
	#superclass : #OGCObject,
	#instVars : [
		'spatialReferenceSystem',
		'measureReferenceSystems',
		'style'
	],
	#category : #'OGC-Core'
}

{ #category : #accessing }
OGCGeometry class >> geometryType [
	self subclassResponsibility 
]

{ #category : #testing }
OGCGeometry class >> isAbstract [
	^ self == OGCGeometry
]

{ #category : #testing }
OGCGeometry >> = anotherGeometry [
	self subclassResponsibility 
]

{ #category : #basic }
OGCGeometry >> SRID [
	"Returns the Spatial Reference System ID for this geometric object. This will normally be a
foreign key to an index of reference systems stored in either the same or some other datastore."
	self subclassResponsibility 
]

{ #category : #basic }
OGCGeometry >> boundary [
	"Geometry — Returns the closure of the combinatorial boundary of this geometric object
(Reference [1], section 3.12.2). Because the result of this function is a closure, and hence topologically
closed, the resulting boundary can be represented using representational Geometry primitives (Reference [1],
section 3.12.2). The return type is integer, but is interpreted as Boolean, TRUE=1, FALSE=0."
	self subclassResponsibility 
]

{ #category : #'methods analysis' }
OGCGeometry >> buffer: aDistance [
	"Returns a geometric object that represents all Points whose distance
from this geometric object is less than or equal to distance."
	self subclassResponsibility 
]

{ #category : #testing }
OGCGeometry >> contains: anotherGeometry [
	self subclassResponsibility 
]

{ #category : #'methods analysis' }
OGCGeometry >> convexHull [
	"Returns a geometric object that represents the convex hull of this geometric
object. Convex hulls, being dependent on straight lines, can be accurately represented in linear interpolations
for any geometry restricted to linear interpolations."
	self subclassResponsibility 
	
]

{ #category : #testing }
OGCGeometry >> crosses: anotherGeometry [
	self subclassResponsibility 
]

{ #category : #'methods analysis' }
OGCGeometry >> difference: anotherGeometry [
	"Returns a geometric object that represents the Point
set difference of this geometric object with anotherGeometry."
	self subclassResponsibility 
]

{ #category : #basic }
OGCGeometry >> dimension [ 
	"The inherent dimension of this geometric object, which must be less than or equal to the coordinate dimension."
	self subclassResponsibility 
]

{ #category : #testing }
OGCGeometry >> disjoint: anotherGeometry [
	self subclassResponsibility 
]

{ #category : #'methods analysis' }
OGCGeometry >> distance: anotherGeometry [
	"Returns the shortest distance between any two Points in
the two geometric objects as calculated in the spatial reference system of this geometric object. Because the
geometries are closed, it is possible to find a point on each geometric object involved, such that the distance
between these 2 points is the returned distance between their geometric objects."
	self subclassResponsibility 
]

{ #category : #basic }
OGCGeometry >> envelope [
	"The minimum bounding box for this Geometry, returned as a Geometry. The
polygon is defined by the corner points of the bounding box [(MINX, MINY), (MAXX, MINY), (MAXX, MAXY),
(MINX, MAXY), (MINX, MINY)]. Minimums for Z and M may be added. The simplest representation of an
Envelope is as two direct positions, one containing all the minimums, and another all the maximums. In some
cases, this coordinate will be outside the range of validity for the Spatial Reference System"
	self subclassResponsibility 
]

{ #category : #basic }
OGCGeometry >> geometryType [
	"Returns the name of the instantiable subtype of Geometry of which this geometric object is an instantiable member"
	^ self class geometryType
]

{ #category : #initialization }
OGCGeometry >> initialize [
	spatialReferenceSystem := OGCGeometricProjection
]

{ #category : #'methods analysis' }
OGCGeometry >> intersection: anotherGeometry [
	"Returns a geometric object that represents the
Point set intersection of this geometric object with anotherGeometry."
	self subclassResponsibility 
]

{ #category : #testing }
OGCGeometry >> intersects: anotherGeometry [
	self subclassResponsibility 
]

{ #category : #basic }
OGCGeometry >> is3D [
	self subclassResponsibility 
]

{ #category : #basic }
OGCGeometry >> isEmpty [ 
	self subclassResponsibility 
]

{ #category : #basic }
OGCGeometry >> isMeasured [
	"Returns 1 (TRUE) if this geometric object has m coordinate values."
	self subclassResponsibility 
]

{ #category : #basic }
OGCGeometry >> isSimple [
	"Returns 1 (TRUE) if this geometric object has no anomalous geometric points, such
as self intersection or self tangency. The description of each instantiable geometric class will include the
specific conditions that cause an instance of that class to be classified as not simple. The return type is
integer, but is interpreted as Boolean, TRUE=1, FALSE=0."
	self subclassResponsibility 
]

{ #category : #testing }
OGCGeometry >> locateAlong: mValue [
	"Returns a derived geometry collection value that matches the
specified m coordinate value. See Subclause 6.1.2.6 “Measures on Geometry” for more details"
	self subclassResponsibility 
]

{ #category : #testing }
OGCGeometry >> locateBetween: mStart and: mEnd [
	"Returns a derived geometry collection value
that matches the specified range of m coordinate values inclusively. See Subclause 6.1.2.6 “Measures on
Geometry” for more details."
	self subclassResponsibility 
]

{ #category : #testing }
OGCGeometry >> overlaps: anotherGeometry [
	self subclassResponsibility 
]

{ #category : #basic }
OGCGeometry >> rectangularEnvelope [
	"Returns [ minX, maxX, minY, maxY ] to define the minimal rectangle which contains the geometry"
	self subclassResponsibility 
]

{ #category : #testing }
OGCGeometry >> relate: anotherGeometry [
	"Returns 1 (TRUE) if this
geometric object is spatially related to anotherGeometry by testing for intersections between the interior,
boundary and exterior of the two geometric objects as specified by the values in the intersectionPatternMatrix.
This returns FALSE if all the tested intersections are empty except exterior (this) intersect exterior (another)."
	self subclassResponsibility 
]

{ #category : #accessing }
OGCGeometry >> spatialReferenceSystem [
	^ spatialReferenceSystem 
]

{ #category : #accessing }
OGCGeometry >> style [
	^ style ifNil: [ ^ style := Dictionary new ]
]

{ #category : #accessing }
OGCGeometry >> style: aDictionaryWithStyleSpecs [
	style := aDictionaryWithStyleSpecs 
	
]

{ #category : #'methods analysis' }
OGCGeometry >> symDifference: anotherGeometry [
	"Returns a geometric object that represents the
Point set symmetric difference of this geometric object with anotherGeometry."
	self subclassResponsibility 
]

{ #category : #testing }
OGCGeometry >> touches: anotherGeometry [
	self subclassResponsibility 
]

{ #category : #'methods analysis' }
OGCGeometry >> union: anotherGeometry [ 
	"Returns a geometric object that represents the Point set
union of this geometric object with anotherGeometry."
	self subclassResponsibility 
]

{ #category : #testing }
OGCGeometry >> within: anotherGeometry [
	self subclassResponsibility 
]
