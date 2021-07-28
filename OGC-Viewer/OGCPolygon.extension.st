Extension { #name : #OGCPolygon }

{ #category : #'*OGC-Viewer' }
OGCPolygon >> displayWithZoom: zoom offsetX: offsetX offsetY: offsetY [
	| alpha |
	alpha := (exteriorRing style) at: 'fill-opacity' ifAbsent: [ 0.5 ].
	(exteriorRing style includesKey: 'fill') ifFalse: [ exteriorRing style at: 'fill' put: (Color white alpha: alpha ) ].
	^ exteriorRing displayWithZoom: zoom offsetX: offsetX offsetY: offsetY
]
