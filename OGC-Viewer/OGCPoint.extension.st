Extension { #name : #OGCPoint }

{ #category : #'*OGC-Viewer' }
OGCPoint >> pixelCoordinates [
	^ Array braceWith: (self xPixelWithZoom: 0) with: (self yPixelWithZoom: 0)
]

{ #category : #'*OGC-Viewer' }
OGCPoint >> pixelCoordinatesWithZoom: aZoomLevel [
	^ Array braceWith: (self xPixelWithZoom: aZoomLevel ) with: (self yPixelWithZoom: aZoomLevel )
]

{ #category : #'*OGC-Viewer' }
OGCPoint >> tileCoordinatesWithZoom [
	^ Array braceWith: (self xTileWithZoom: 0 ) with: (self yTileWithZoom: 0 )
]

{ #category : #'*OGC-Viewer' }
OGCPoint >> tileCoordinatesWithZoom: aZoomLevel [
	^ Array braceWith: (self xTileWithZoom: aZoomLevel ) with: (self yTileWithZoom: aZoomLevel )
]

{ #category : #'*OGC-Viewer' }
OGCPoint >> tileSize [
	^ 256
]

{ #category : #'*OGC-Viewer' }
OGCPoint >> worldCoordinates [
	^ Array braceWith: self xWorld with: self yWorld
]

{ #category : #'*OGC-Viewer' }
OGCPoint >> xPixelWithZoom: aZoomLevel [
	^ (self xWorld * (2 ** aZoomLevel)) asInteger
]

{ #category : #'*OGC-Viewer' }
OGCPoint >> xTileWithZoom: aZoomLevel [
	^ (self xWorld * (2 ** aZoomLevel) / self tileSize ) asInteger
]

{ #category : #'*OGC-Viewer' }
OGCPoint >> xWorld [
	^ ((self longitude + 180)/360) * self tileSize
]

{ #category : #'*OGC-Viewer' }
OGCPoint >> yPixelWithZoom: aZoomLevel [
	^ (self yWorld * (2 ** aZoomLevel)) asInteger
]

{ #category : #'*OGC-Viewer' }
OGCPoint >> yTileWithZoom: aZoomLevel [
	^ (self yWorld * (2 ** aZoomLevel) / self tileSize ) asInteger
]

{ #category : #'*OGC-Viewer' }
OGCPoint >> yWorld [
	| siny lnValue |
	siny := ((self latitude * Float pi )/180) sin.
	siny := (siny max: -0.9999) min: (0.9999).

	lnValue := ((1 + siny)/(1-siny)) ln.
	^ self tileSize * (0.5 - (lnValue / (4 * Float pi))).
]
