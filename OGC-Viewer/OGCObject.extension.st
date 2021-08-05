Extension { #name : #OGCObject }

{ #category : #'*OGC-Viewer' }
OGCObject >> bestZoom [
	^ self bestZoomWithZoomLimit: 19 widthTileLimit: 2 heightTileLimit: 1
]

{ #category : #'*OGC-Viewer' }
OGCObject >> bestZoomWithZoomLimit: zoomLimit widthTileLimit: widthTileLimit heightTileLimit: heightTileLimit [
	" return the best zoom in [ 0, zoomLimit ] for the display of objects to fit in defined width and height tile limits"
	0 to: zoomLimit do: [ :zoom_i |
		| tempRect |
		tempRect := self rectangularTileEnvelopeWithZoom: zoom_i.
		((tempRect width > widthTileLimit) or: (tempRect height > heightTileLimit)) ifTrue: [ 
			^ (zoom_i - 1) max: 0 ]
		 ].
	^ zoomLimit
]

{ #category : #'*OGC-Viewer' }
OGCObject >> displayWithZoom: aZoom [
	^ self displayWithZoom: aZoom offsetX: 0 offsetY: 0
]

{ #category : #'*OGC-Viewer' }
OGCObject >> displayWithZoom: aZoom offsetX: aXValue offsetY: aYValue [
	" return the morph of object with given zoom, pixel offset in X and pixel offset in Y "
	self subclassResponsibility
]

{ #category : #'*OGC-Viewer' }
OGCObject >> inspectionMap [
	<inspectorPresentationOrder: 90 title: 'Map'>
	" open a tab at inspection to display objects "
    ^ SpMorphPresenter new
        morph: ((self asFeaturesCollection) displayWithZoom: self bestZoom);
        yourself 
]

{ #category : #'*OGC-Viewer' }
OGCObject >> inspectionMapWithTiles [
	<inspectorPresentationOrder: 91 title: 'Map with Tiles'>
	" open a tab at inspection to display objects with a map background "
    ^ SpMorphPresenter new
        morph: ((OGCViewerMorph withMapTiles: 3@2) displayFeaturesCollection: (self asFeaturesCollection));
        yourself 
]

{ #category : #'*OGC-Viewer' }
OGCObject >> rectangularTileEnvelopeWithZoom: zoom [
	" return the minimal rectangle whose origin and corner are tile coordinates, which contains all geometries displayed with given zoom level"
	| rectangularEnvelope corner00 corner11 minX maxX minY maxY |
	rectangularEnvelope := self rectangularEnvelope.
	corner00 := (OGCPoint x: (rectangularEnvelope origin x) y: (rectangularEnvelope origin y)).
	corner11 := (OGCPoint x: (rectangularEnvelope corner x) y: (rectangularEnvelope corner y)).
	minX := (corner00 xTileWithZoom: zoom).
	maxX := (corner11 xTileWithZoom: zoom).
	minY := (corner00 yTileWithZoom: zoom).
	maxY := (corner11 yTileWithZoom: zoom).
	^ minX@minY corner: maxX@maxY
]
