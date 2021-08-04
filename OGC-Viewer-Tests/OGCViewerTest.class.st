Class {
	#name : #OGCViewerTest,
	#superclass : #TestCase,
	#category : #'OGC-Viewer-Tests'
}

{ #category : #tests }
OGCViewerTest >> testApplyStyle [
	| model |
	model := GeoJSONExamples regionsFranceMetropole .
	model applyStyle: (OGCGeometry createStyleDictionary: #(blue 0.3 green 4)).
	self assert: (model features first geometry style at: 'fill') equals: 'blue'.
	self assert: (model features second geometry style at: 'fill-opacity') equals: '0.3'.
	self assert: (model features third geometry style at: 'stroke') equals: 'green'.
	self assert: (model features fourth geometry style at: 'stroke-width') equals: '4'.
]

{ #category : #tests }
OGCViewerTest >> testApplyStyleifFeature [
	| model blockCondition styleDictionary |
	model := GeoJSONExamples regionsFranceMetropole .
	blockCondition := [ :aFeature | (aFeature properties at: 'code') asNumber even ].
	styleDictionary := OGCGeometry createStyleDictionary: #(purple 0.8 orange 3).
	model 
		applyStyle: styleDictionary
		ifFeature: blockCondition .
	self assert: ( (model features select: blockCondition) first geometry style ) equals: styleDictionary .
]

{ #category : #tests }
OGCViewerTest >> testBestZoom [
	| model bestZoom rectangleEnvelopeAtBestZoom rectangleEnvelopeBigger |
	model := GeoJSONExamples pointLineAndPolygon2 .
	bestZoom := model bestZoomWithZoomLimit: 19 widthTileLimit: 3 heightTileLimit: 2.
	rectangleEnvelopeAtBestZoom := model rectangularTileEnvelopeWithZoom: bestZoom.
	rectangleEnvelopeBigger := model rectangularTileEnvelopeWithZoom: (bestZoom + 1).
	self assert: rectangleEnvelopeAtBestZoom width <= 3.
	self assert: rectangleEnvelopeAtBestZoom height <= 2.
	self assert: ((rectangleEnvelopeBigger width>3) or: (rectangleEnvelopeBigger height>2))
]

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
