Extension { #name : #OGCSurface }

{ #category : #'*OGC-Geometry' }
OGCSurface >> asGElement [
	| pointsToTransform |
	pointsToTransform := (self exteriorRing points) allButLast .
	^ GPolygon vertices: (pointsToTransform collect: [ :aPoint | aPoint asGElement ])
]
