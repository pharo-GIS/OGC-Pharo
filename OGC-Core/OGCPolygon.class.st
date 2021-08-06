"
###6.1.11 Polygon, Triangle

###6.1.11.1 Description

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

{ #category : #testing }
OGCPolygon >> = anotherPolygon [
	^ self class = anotherPolygon class and: 
		[ self interiorRings = anotherPolygon interiorRings
			and: 
			[ self exteriorRing  = anotherPolygon exteriorRing ] 
			]
]

{ #category : #accessing }
OGCPolygon >> addInteriorRing: anOGCLinearRing [
	anOGCLinearRing isClosed ifFalse: [ 
		Error signal: 'linear ring is not closed' ].
	self interiorRings add: anOGCLinearRing 
]

{ #category : #accessing }
OGCPolygon >> coordinates [
	^ exteriorRing points collect: #coordinates
]

{ #category : #accessing }
OGCPolygon >> coordinates: aCollection [ 
	(aCollection anySatisfy: [ :each | each class = Array ])
	ifTrue: [
		"coordinates contain an exterior ring and interior rings"
		self addExteriorRing: (OGCLinearRing new coordinates: aCollection first).
		aCollection allButFirst do: [ :each |
		self addInteriorRing: (OGCLinearRing new coordinates: each)  ]
		]
	ifFalse: [ 
		"coordiniates only contain an exterior ring"
		aCollection do: [ :each |
		self addExteriorRing: (OGCLinearRing new coordinates: each)  ]
		 ]
]

{ #category : #style }
OGCPolygon >> defaultFillColor [
	^ 'white'
]

{ #category : #style }
OGCPolygon >> defaultFillOpacity [
	^ '0.5'
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

{ #category : #comparing }
OGCPolygon >> hash [ 
	^ self interiorRings hash bitXor: self exteriorRing hash
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
