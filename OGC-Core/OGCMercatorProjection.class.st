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
	(aSurface geometryType = 'Triangle') 
		ifTrue: [ ^ self areaOfTriangle: aSurface ]
]

{ #category : #'as yet unclassified' }
OGCMercatorProjection class >> areaOfTriangle: aTriangle [
	| points point1 point2 point3 gPoint1 gPoint2 gPoint3 |
	points := aTriangle exteriorRing points.
	point1 := points first.
	point2 := points second.
	point3 := points third.
	gPoint1 := GPoint x: point1 x y: point1 y.
	gPoint2 := GPoint x: point2 x y: point2 y.
	gPoint3 := GPoint x: point3 x y: point3 y.
	^ ( GTriangle with: gPoint1 with: gPoint2 with: gPoint3 ) area
	
]

{ #category : #'as yet unclassified' }
OGCMercatorProjection class >> distanceFromPoint: aPoint toPoint: anotherGeometry [ 
	"For now, anotherGeometry is a Point"
	^ ( GPoint x: aPoint x y: aPoint y ) distanceTo: ( GPoint x: anotherGeometry x y: anotherGeometry y )
]

{ #category : #initialization }
OGCMercatorProjection class >> length: aLine [
	" Return the distance between two points of a Line"
	^ self distanceFromPoint: aLine points first toPoint: aLine points second
]
