Extension { #name : 'OGCPolygon' }

{ #category : '*OGC-Viewer' }
OGCPolygon >> displayWithZoom: zoom offsetX: offsetX offsetY: offsetY [
	exteriorRing style at: 'fill' put: self defaultFillColor .
	exteriorRing style at: 'fill-opacity' put: self defaultFillOpacity.
	self style keysDo: [ :aKey | exteriorRing style at: aKey put: (self style at: aKey) ].
	^ exteriorRing displayWithZoom: zoom offsetX: offsetX offsetY: offsetY
]
