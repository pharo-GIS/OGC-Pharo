"
Admitted hypothesis:
		- the Earth is a perfect sphere
		- the Earth has a approximate ray of 6372.795477598 km
		- results are given in km
		- coordinates are longitude and latitude in degrees
"
Class {
	#name : #OGCSphericSystem,
	#superclass : #OGCSpatialReferenceSystem,
	#category : #'OGC-Spheric'
}

{ #category : #'as yet unclassified' }
OGCSphericSystem class >> distance: aGeometry toPoint: aPoint [
	"For now, it only works with points"
	(aGeometry class geometryType = 'Point') ifTrue: 
		[ ^ self distanceFromPoint: aGeometry toPoint: aPoint ]
]

{ #category : #'as yet unclassified' }
OGCSphericSystem class >> distanceFromPoint: pointA toPoint: pointB [
	" D(A,B) = R * arccos (sin(latA) * sin(latB) + cos (latA) * cos(latB) * cos(lonA - lonB)) 
	https://fr.wikipedia.org/wiki/Distance_du_grand_cercle"
	
	| sinValue cosValue ray latA latB lonA lonB |
	
	ray := 6372.795477598.
	
	latA := (pointA latitude) degreesToRadians.
	latB := (pointB latitude) degreesToRadians.
	lonA := (pointA longitude) degreesToRadians.
	lonB := (pointB longitude) degreesToRadians.
	
	sinValue := (latA sin ) * (latB sin).
	cosValue := (latA cos ) * (latB cos) * ((lonA - lonB) cos).
	
	^ ray * ((sinValue + cosValue) arcCos)
]
