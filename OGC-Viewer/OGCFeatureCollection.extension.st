Extension { #name : #OGCFeatureCollection }

{ #category : #'*OGC-Viewer' }
OGCFeatureCollection >> displayWithZoom: aZoom offsetX: aXValue offsetY: aYValue [
	| morph initialOffsetX initialOffsetY |
	initialOffsetX := (self rectangularTileEnvelopeWithZoom: aZoom) origin x.
	initialOffsetY := (self rectangularTileEnvelopeWithZoom: aZoom) origin y.
	morph := ImageMorph new.
	self features do: [ :each |
		| morphFeature |
		morphFeature := each displayWithZoom: aZoom offsetX: (aXValue + initialOffsetX) offsetY: (aYValue + initialOffsetY).
		morph addMorph: morphFeature.
	].
	^ morph
]
