Class {
	#name : #OGCViewerMorph,
	#superclass : #StandardWindow,
	#instVars : [
		'surface',
		'map',
		'repere'
	],
	#category : #'OGC-Viewer'
}

{ #category : #'as yet unclassified' }
OGCViewerMorph class >> displayFeaturesCollection: aFeaturesCollection withZoomLevel: aZoomLevel [
	^ self new displayFeaturesCollection: aFeaturesCollection withZoomLevel: aZoomLevel 
	
]

{ #category : #'as yet unclassified' }
OGCViewerMorph class >> displayPoint: aOGCPoint withZoomLevel: aZoomLevel [
	| morph |
	morph := self new displayPoint: aOGCPoint withZoomLevel: aZoomLevel.
	morph openInWindowLabeled: 'Point, zoom : ', aZoomLevel asString.
	
]

{ #category : #initialization }
OGCViewerMorph >> defaultExtent [
	^ 400@400
]

{ #category : #operations }
OGCViewerMorph >> displayFeaturesCollection: aFeaturesCollection withZoomLevel: aZoomLevel [
	| zoom rectangularTileEnvelope coordNext |
	zoom := aZoomLevel min: 19.
	" 1. define four map tiles to define corners "
	rectangularTileEnvelope := self rectangularTileEnvelope: aFeaturesCollection withZoom: zoom.

	" 2. load all map tiles and display complete map background "
	map := ImageMorph new.
	coordNext := 0@0.
	(rectangularTileEnvelope at: 'minX') to: (rectangularTileEnvelope at: 'maxX') do: [ :x_i |
		| tile_i |
		(rectangularTileEnvelope at: 'minY') to: (rectangularTileEnvelope at: 'maxY') do: [ :y_i |
			tile_i := self getTilePngWithZoom: zoom x: x_i y: y_i.
			tile_i position: coordNext.
			coordNext := coordNext x @ tile_i bottom.
			map addMorph: tile_i.
			] .
		coordNext := tile_i right @ 0.
		].
	
	" 3. display features "
	aFeaturesCollection features do: [ :each |
		| morph offsetX offsetY |
		offsetX := rectangularTileEnvelope at: 'minX'.
		offsetY := rectangularTileEnvelope at: 'minY'.
		morph := each geometry displayWithZoom: zoom offsetX: offsetX offsetY: offsetY.
		map addMorph: morph.
	].
	 ^ map
]

{ #category : #operations }
OGCViewerMorph >> displayPoint: aOGCPoint withZoomLevel: aZoomLevel [
	| repere_i repereX repereY |
	map := self getTilePng: aOGCPoint withZoomLevel: aZoomLevel.
	repere_i := self repere.
	repereX := ((self repere position) x) +(aOGCPoint xPixelInTileWithZoom: aZoomLevel).
	repereY := ((self repere position) y) + (aOGCPoint yPixelInTileWithZoom: aZoomLevel).
	repere_i position: repereX @ repereY.
	map addMorph: repere_i.
	^ map
]

{ #category : #operations }
OGCViewerMorph >> getTilePng: aOGCPoint withZoomLevel: aZoomLevel [
	| zoom |
	zoom := aZoomLevel min: self zoomLimit.
	^ self getTilePngWithZoom: aZoomLevel x: (aOGCPoint xTileWithZoom: zoom) y: (aOGCPoint yTileWithZoom: zoom)
]

{ #category : #operations }
OGCViewerMorph >> getTilePngWithZoom: aZoomLevel x: aXvalue y: aYvalue [
	| url |
	url := 
		'https://tile.openstreetmap.org/' 
		, aZoomLevel asString , '/' 
		, aXvalue asString , '/'
		, aYvalue asString , '.png'.
	^ (ZnEasy getPng: url) asMorph
]

{ #category : #initialization }
OGCViewerMorph >> initialize [
	super initialize.
	surface := AthensCairoSurface extent: self defaultExtent.
	self title: 'OGC Viewer'.
]

{ #category : #accessing }
OGCViewerMorph >> padding [
	" extra-edge in number of tiles to consider to build the map"
	^ 0
]

{ #category : #operations }
OGCViewerMorph >> rectangularTileEnvelope: aFeaturesCollection withZoom: zoom [
	| rectangularEnvelope corner00 corner11 minX maxX minY maxY |
	" 1. define four map tils to define corners "
	rectangularEnvelope := aFeaturesCollection rectangularEnvelope.
	corner00 := (OGCPoint x: (rectangularEnvelope at: 'minX') y: (rectangularEnvelope at: 'maxY')).
	corner11 := (OGCPoint x: (rectangularEnvelope at: 'maxX') y: (rectangularEnvelope at: 'minY')).
	minX := (corner00 xTileWithZoom: zoom) - self padding.
	maxX := (corner11 xTileWithZoom: zoom) + self padding.
	minY := (corner00 yTileWithZoom: zoom) - self padding.
	maxY := (corner11 yTileWithZoom: zoom) + self padding.
	^ Dictionary newFromPairs: {'minX' . minX . 'maxX' . maxX . 'minY' . minY . 'maxY' . maxY }
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
OGCViewerMorph >> zoomLimit [
	^ 19
]
