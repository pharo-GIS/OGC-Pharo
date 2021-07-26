"
6.1.3 GeometryCollection

6.1.3.1 Description 

A GeometryCollection is a geometric object that is a collection of some number of geometric objects.
All the elements in a GeometryCollection shall be in the same Spatial Reference System. This is also the Spatial
Reference System for the GeometryCollection.
GeometryCollection places no other constraints on its elements. Subclasses of GeometryCollection may restrict
membership based on dimension and may also place other constraints on the degree of spatial overlap between
elements. 
"
Class {
	#name : #OGCGeometryCollection,
	#superclass : #OGCGeometry,
	#instVars : [
		'geometries'
	],
	#category : #'OGC-Core'
}

{ #category : #testing }
OGCGeometryCollection class >> isAbstract [
	^ self = OGCGeometryCollection 
]

{ #category : #basic }
OGCGeometryCollection >> dimension [
	^ geometries sorted: [ :e1 :e2 | e1 dimension > e2 dimension ] first
]

{ #category : #accessing }
OGCGeometryCollection >> geometries [
	^ geometries
]

{ #category : #accessing }
OGCGeometryCollection >> geometries: anObject [
	geometries := anObject
]

{ #category : #accessing }
OGCGeometryCollection >> geometryN: index [
	"Returns the Nth geometry in this GeometryCollection"	
	^ geometries at: index
]

{ #category : #accessing }
OGCGeometryCollection >> numGeometries [
	"cReturns the number of geometries in this GeometryCollection"
	^ geometries size
]

{ #category : #basic }
OGCGeometryCollection >> rectangularEnvelope [
	" Returns [ minX, maxX, minY, maxY ] to define minimal rectangle which contains all features "
	| allRectangularEnvelopes minX maxX minY maxY |
	allRectangularEnvelopes := geometries collect: [ :aGeometry | aGeometry rectangularEnvelope  ].
	minX := (allRectangularEnvelopes collect: [ :each | each at: 'minX' ]) min.
	maxX := (allRectangularEnvelopes collect: [ :each | each at: 'maxX' ]) max.
	minY := (allRectangularEnvelopes collect: [ :each | each at: 'minY' ]) min.
	maxY := (allRectangularEnvelopes collect: [ :each | each at: 'maxY' ]) max.
	^ Dictionary newFromPairs: {'minX' . minX . 'maxX' . maxX . 'minY' . minY . 'maxY' . maxY }
]
