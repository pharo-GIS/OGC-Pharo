Class {
	#name : #OGCViewerMorph,
	#superclass : #StandardWindow,
	#instVars : [
		'surface',
		'map'
	],
	#category : #'OGC-Viewer'
}

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

{ #category : #'as yet unclassified' }
OGCViewerMorph >> displayPoint: aOGCPoint withZoomLevel: aZoomLevel [
	| repere repereX repereY |
	map := self getTilePng: aOGCPoint withZoomLevel: aZoomLevel.
	repere := self repere.
	repereX := ((self repere position) x) +(aOGCPoint xPixelInTileWithZoom: aZoomLevel).
	repereY := ((self repere position) y) + (aOGCPoint yPixelInTileWithZoom: aZoomLevel).
	repere position: repereX @ repereY.
	map addMorph: repere.
	^ map
]

{ #category : #'as yet unclassified' }
OGCViewerMorph >> getTilePng: aOGCPoint withZoomLevel: aZoomLevel [
	| url zoom |
	zoom := aZoomLevel min: self zoomLimit.
	url := 
		'https://tile.openstreetmap.org/' 
		, zoom asString , '/' 
		, (aOGCPoint xTileWithZoom: zoom) asString , '/'
		, (aOGCPoint yTileWithZoom: zoom) asString , '.png'.
	^ (ZnEasy getPng: url) asMorph
	
	
]

{ #category : #initialization }
OGCViewerMorph >> initialize [
	super initialize.
	surface := AthensCairoSurface extent: self defaultExtent.
	self title: 'OGC Viewer'.
]

{ #category : #'as yet unclassified' }
OGCViewerMorph >> repere [
	| repere |
	repere := (ZnEasy getPng: 'https://image.flaticon.com/icons/png/512/143/143960.png') asMorph.
	repere resize: self repereSize @ self repereSize.
	repere position: ((self repereSize/2) sign: -1) @ ((self repereSize) sign: -1).
	^ repere copy
]

{ #category : #'as yet unclassified' }
OGCViewerMorph >> repereSize [
	^ 20
]

{ #category : #running }
OGCViewerMorph >> run [

	self open.
	self extent: self defaultExtent.
]

{ #category : #'as yet unclassified' }
OGCViewerMorph >> zoomLimit [
	^ 19
]
