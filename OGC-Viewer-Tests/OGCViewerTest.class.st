Class {
	#name : #OGCViewerTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'OGC-Viewer-Tests'
}

{ #category : #running }
OGCViewerTest >> setUp [
	| point1 point2 point3 linearRing lineString polygon features |
	point1 := OGCPoint xy: #(0 0).
	point2 := OGCPoint xy: #(1 1).
	point3 := OGCPoint xy: #(0 1).
	linearRing := OGCLinearRing new points: { point1 . point2 . point3 . point1 }.
	lineString := OGCLineString new points: { point1 . point2 }.
	polygon := OGCPolygon new exteriorRing: linearRing.
	features := { lineString . linearRing . polygon }.
	model := OGCFeatureCollection new features: (features collect: [ :aFeature | aFeature asFeature ]).
	model features: (model features do: 
		[:aFeature | 
			|code| 
			code := ((Random new nextBetween: 0 and: 1) * 10) round: 0.
			aFeature properties at: 'code' put: code])
	
	
	
	
]

{ #category : #tests }
OGCViewerTest >> testApplyStyle [
	model applyStyle: (OGCGeometry createStyleDictionary: #(blue 0.3 green 4)).
	self assert: (model features first geometry style at: 'fill') equals: 'blue'.
	self assert: (model features second geometry style at: 'fill-opacity') equals: '0.3'.
	self assert: (model features third geometry style at: 'stroke') equals: 'green'.
	self assert: (model features third geometry style at: 'stroke-width') equals: '4'.
]

{ #category : #tests }
OGCViewerTest >> testApplyStyleifFeature [
	| blockCondition styleDictionary |
	blockCondition := [ :aFeature | (aFeature properties at: 'code') asNumber even ].
	styleDictionary := OGCGeometry createStyleDictionary: #(purple 0.8 orange 3).
	model 
		applyStyle: styleDictionary
		ifFeature: blockCondition .
	self assert: ( (model features select: blockCondition) first geometry style ) equals: styleDictionary .
]

{ #category : #tests }
OGCViewerTest >> testBestZoom [
	| bestZoom rectangleEnvelopeAtBestZoom rectangleEnvelopeBigger |
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
	| morph |
	morph := (OGCViewerMorph withMapTiles: 4@3) displayObject: model.
	self assert: morph fullBounds width equals: 256*4.
	self assert: morph fullBounds height equals: 256*3.
]
