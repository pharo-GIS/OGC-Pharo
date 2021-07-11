"
The Mercator projection is a cylindrical map projection presented by Flemish geographer and cartographer Gerardus Mercator in 1569. 

It became the standard map projection for navigation because it is unique in representing north as up and south as down everywhere while preserving local directions and shapes. The map is thereby conformal. 
As a side effect, the Mercator projection inflates the size of objects away from the equator. This inflation is very small near the equator but accelerates with increasing latitude to become infinite at the poles. So, for example, landmasses such as Greenland and Antarctica appear far larger than they actually are relative to landmasses near the equator, such as Central Africa. 
"
Class {
	#name : #OGCMercatorProjection,
	#superclass : #OGCSpatialReferenceSystem,
	#category : #'OGC-Core'
}

{ #category : #'as yet unclassified' }
OGCMercatorProjection class >> area: aSurface [
	^ aSurface asGElement area
]

{ #category : #'as yet unclassified' }
OGCMercatorProjection class >> distance: aGeometry toPoint: aPoint [
	^ aGeometry asGElement distanceTo: aPoint asGElement
]

{ #category : #'as yet unclassified' }
OGCMercatorProjection class >> intersection: aGeometry withLine: aLine [
	| result |
	result :=  (aGeometry asGElement intersectionsWithLine: aLine asGElement).
	(result size = 1) ifTrue: [ ^ result first asOGCElement ] ifFalse: [ ^ result ]
]

{ #category : #initialization }
OGCMercatorProjection class >> length: aLine [
	" Return the distance between two points of a Line"
	^ aLine asGElement length
]