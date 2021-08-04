Class {
	#name : #OGCViewerTest,
	#superclass : #TestCase,
	#category : #'OGC-Viewer-Tests'
}

{ #category : #tests }
OGCViewerTest >> testCoordinatesPoint [
	| point zoomLevel |
	"Based on example from https://developers.google.com/maps/documentation/javascript/coordinates"
	point := OGCPoint latitude: 41.85 longitude: -87.65 .
	zoomLevel := 3.
	self assert: point coordinates equals: #(-87.65 41.85).
	self assert: point worldCoordinates equals: #(65.6711111111111 95.17492654697409).
	self assert: (point pixelCoordinatesWithZoom: zoomLevel) equals: #(525 761).
	self assert: (point tileCoordinatesWithZoom: zoomLevel) equals: #(2 2).
]

{ #category : #tests }
OGCViewerTest >> testWithMapTiles [
	| model morph |
	model := GeoJSONReader fromURL: 'https://raw.githubusercontent.com/mapbox/mapping/master/worldcities/worldcities.geojson'.
	morph := (OGCViewerMorph withMapTiles: 4@3) displayObject: model.
	self assert: morph fullBounds width equals: 256*4.
	self assert: morph fullBounds height equals: 256*3.
]
