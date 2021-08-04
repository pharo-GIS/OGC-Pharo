Class {
	#name : #OGCViewerMorph,
	#superclass : #StandardWindow,
	#instVars : [
		'surface',
		'map',
		'repere',
		'displayParameters'
	],
	#category : #'OGC-Viewer'
}

{ #category : #'as yet unclassified' }
OGCViewerMorph class >> displayFeaturesCollection: aFeaturesCollection [
	^ self new displayFeaturesCollection: aFeaturesCollection
]

{ #category : #'as yet unclassified' }
OGCViewerMorph class >> displayFeaturesCollection: aFeaturesCollection withZoomLevel: aZoomLevel [
	^ self new displayFeaturesCollection: aFeaturesCollection withZoomLevel: aZoomLevel 
	
]

{ #category : #'as yet unclassified' }
OGCViewerMorph class >> withMapTiles [
	^ self withMapTiles: 3@2
]

{ #category : #'as yet unclassified' }
OGCViewerMorph class >> withMapTiles: aPoint [
	"(number of tiles in width)@(number of tiles in height) wanted at visualisation"
	| aViewer |
	aViewer := self new activateMapTiles.
	aViewer displayParameters at: 'widthTileLimit' put: (((aPoint x) - 1 ) max: 0).
	aViewer displayParameters at: 'heightTileLimit' put: (((aPoint y) - 1 ) max: 0).
	^ aViewer
]

{ #category : #initialization }
OGCViewerMorph >> activateMapTiles [
	displayParameters at: 'displayMapTiles' put: true
]

{ #category : #initialization }
OGCViewerMorph >> defaultDisplayParameters [
	| defaultDictionary |
	defaultDictionary := Dictionary new.
	defaultDictionary at: 'displayMapTiles' put: false.
	defaultDictionary at: 'widthTileLimit' put: 3.
	defaultDictionary at: 'heightTileLimit' put: 2.
	^ defaultDictionary
]

{ #category : #initialization }
OGCViewerMorph >> defaultExtent [
	^ 400@400
]

{ #category : #operations }
OGCViewerMorph >> displayFeaturesCollection: aFeaturesCollection [
	^ self displayFeaturesCollection: aFeaturesCollection withZoomLevel: (aFeaturesCollection bestZoomWithZoomLimit: 19 widthTileLimit: self widthTileLimit heightTileLimit: self heightTileLimit )
]

{ #category : #operations }
OGCViewerMorph >> displayFeaturesCollection: aFeaturesCollection withZoomLevel: aZoomLevel [
	| zoom rectangularTileEnvelope |
	zoom := aZoomLevel min: 19.
	" 1. define four map tiles to define corners "
	rectangularTileEnvelope := aFeaturesCollection rectangularTileEnvelopeWithZoom: zoom.

	map := ImageMorph new.
	
	(displayParameters at: 'displayMapTiles') ifTrue: [ 
		" 2. if true: load all map tiles and display complete map background "
		| xInterval yInterval |
		xInterval := (rectangularTileEnvelope origin x) to: ((rectangularTileEnvelope origin x) + self widthTileLimit).
		yInterval := (rectangularTileEnvelope origin y) to: ((rectangularTileEnvelope origin y) + self heightTileLimit).
		map addMorph: (self getMapTilesWithZoom: zoom xInterval: xInterval yInterval: yInterval).
	].
	
	" 3. display features "
	map addMorph: (aFeaturesCollection displayWithZoom: zoom).
	
	 ^ map
]

{ #category : #initialization }
OGCViewerMorph >> displayParameters [
	^ displayParameters 
]

{ #category : #initialization }
OGCViewerMorph >> displayParameters: aDictionary [
	displayParameters  := aDictionary 
]

{ #category : #'as yet unclassified' }
OGCViewerMorph >> getMapTilesWithZoom: zoom xInterval: aXInterval yInterval: aYInterval [
	| mapTiles coordNext|
	mapTiles := ImageMorph new.
	coordNext := 0@0.
	aXInterval do: [ :x_i |
		| tile_i |
		aYInterval do: [ :y_i |
			tile_i := self getTilePngWithZoom: zoom x: x_i y: y_i.
			tile_i position: coordNext.
			coordNext := coordNext x @ tile_i bottom.
			mapTiles addMorph: tile_i.
			] .
		coordNext := tile_i right @ 0.
		].
	^ mapTiles
]

{ #category : #operations }
OGCViewerMorph >> getTilePng: aOGCPoint withZoomLevel: aZoomLevel [
	| zoom |
	zoom := aZoomLevel min: self zoomLimit.
	^ self getTilePngWithZoom: aZoomLevel x: (aOGCPoint xTileWithZoom: zoom) y: (aOGCPoint yTileWithZoom: zoom)
]

{ #category : #operations }
OGCViewerMorph >> getTilePngWithZoom: aZoomLevel x: aXvalue y: aYvalue [
	| url morph |
	morph := ImageMorph new.
	url := 
		'https://tile.openstreetmap.org/' 
		, aZoomLevel asString , '/' 
		, aXvalue asString , '/'
		, aYvalue asString , '.png'.
	morph := [ (ZnEasy getPng: url) asMorph ] onErrorDo: [ morph position: aXvalue@aYvalue ].
	^ morph
]

{ #category : #accessing }
OGCViewerMorph >> heightTileLimit [
		^ self displayParameters at: 'heightTileLimit'
]

{ #category : #initialization }
OGCViewerMorph >> initialize [
	super initialize.
	surface := AthensCairoSurface extent: self defaultExtent.
	self title: 'OGC Viewer'.
	self displayParameters: self defaultDisplayParameters
]

{ #category : #running }
OGCViewerMorph >> run [

	self open.
	self extent: self defaultExtent.
]

{ #category : #accessing }
OGCViewerMorph >> tileSize [
	^ 256
]

{ #category : #accessing }
OGCViewerMorph >> widthTileLimit [
	^ self displayParameters at: 'widthTileLimit'
]

{ #category : #accessing }
OGCViewerMorph >> zoomLimit [
	^ 19
]
