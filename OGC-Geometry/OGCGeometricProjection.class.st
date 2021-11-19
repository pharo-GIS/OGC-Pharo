Class {
	#name : #OGCGeometricProjection,
	#superclass : #OGCSpatialReferenceSystem,
	#category : #'OGC-Geometry'
}

{ #category : #'as yet unclassified' }
OGCGeometricProjection class >> area: aSurface [
	^ aSurface asGElement area
]

{ #category : #'as yet unclassified' }
OGCGeometricProjection class >> distance: aGeometry toPoint: aPoint [
	^ aGeometry asGElement distanceTo: aPoint asGElement
]

{ #category : #initialization }
OGCGeometricProjection class >> length: aLine [
	" Return the distance between two points of a Line"
	^ aLine asGElement length
]
