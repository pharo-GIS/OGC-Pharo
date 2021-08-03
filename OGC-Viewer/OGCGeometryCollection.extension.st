Extension { #name : #OGCGeometryCollection }

{ #category : #'*OGC-Viewer' }
OGCGeometryCollection >> displayWithZoom: zoom offsetX: offsetX offsetY: offsetY [
	^ geometries collect: [ :each | each displayWithZoom: zoom offsetX: offsetX offsetY: offsetY ]
]
