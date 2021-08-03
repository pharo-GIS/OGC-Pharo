Extension { #name : #OGCGeometryCollection }

{ #category : #'*OGC-Viewer' }
OGCGeometryCollection >> displayWithZoom: zoom offsetX: offsetX offsetY: offsetY [
	| morph initialOffsetX initialOffsetY |
	initialOffsetX := (self rectangularTileEnvelopeWithZoom: zoom) origin x.
	initialOffsetY := (self rectangularTileEnvelopeWithZoom: zoom) origin y.
	morph := ImageMorph new.
	geometries do: [ :each |
		| morphGeometry |
		morphGeometry := each displayWithZoom: zoom offsetX: (offsetX "+ initialOffsetX") offsetY: (offsetY "+ initialOffsetY").
		morph addMorph: morphGeometry.
	].
	^ morph
]
