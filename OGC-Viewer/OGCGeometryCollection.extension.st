Extension { #name : #OGCGeometryCollection }

{ #category : #'*OGC-Viewer' }
OGCGeometryCollection >> displayWithZoom: zoom offsetX: offsetX offsetY: offsetY [
	| morph |
	morph := ImageMorph new.
	geometries do: [ :each |
		| morphGeometry |
		morphGeometry := each displayWithZoom: zoom offsetX: (offsetX) offsetY: (offsetY).
		morph addMorph: morphGeometry.
	].
	^ morph
]
