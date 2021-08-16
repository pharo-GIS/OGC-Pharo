"
###6.1.3 GeometryCollection

###6.1.3.1 Description 

A GeometryCollection is a geometric object that is **a collection of some number of geometric objects**.

All the elements in a GeometryCollection shall be in the same Spatial Reference System. 
This is also the Spatial Reference System for the GeometryCollection.

GeometryCollection places no other constraints on its elements. 
Subclasses of GeometryCollection may restrict membership based on dimension and may also place other constraints on the degree of spatial overlap between elements. 
"
Class {
	#name : #OGCGeometryCollection,
	#superclass : #OGCGeometry,
	#instVars : [
		'geometries'
	],
	#category : #'OGC-Core'
}

{ #category : #accessing }
OGCGeometryCollection class >> geometries: aCollectionOfGeometries [
	| classToGenerate |
	classToGenerate := self.
	(aCollectionOfGeometries allSatisfy: [ :each | each class geometryType = 'LineString' ]) 
		ifTrue: [ classToGenerate := OGCMultiLineString ].
	(aCollectionOfGeometries allSatisfy: [ :each | each class geometryType = 'Point' ]) 
		ifTrue: [ classToGenerate := OGCMultiPoint  ].
	(aCollectionOfGeometries allSatisfy: [ :each | each class geometryType = 'Polygon' ]) 
		ifTrue: [ classToGenerate := OGCMultiPolygon ].
	^ classToGenerate new geometries: aCollectionOfGeometries 
]

{ #category : #testing }
OGCGeometryCollection >> = anotherMultiPoint [
	^ self geometries asSet = anotherMultiPoint geometries asSet
]

{ #category : #accessing }
OGCGeometryCollection >> coordinates [
	^ geometries collect: #coordinates
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
	geometries := anObject.
	geometries do: [ :each | each style: self style ].
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
	" Returns the minimal rectangle which contains all features "
	| allRectangularEnvelopes |
	allRectangularEnvelopes := geometries collect: [ :aGeometry | aGeometry rectangularEnvelope  ].
	^ allRectangularEnvelopes reduce: [ :rect1 :rect2 | rect1 merge: rect2 ]
]
