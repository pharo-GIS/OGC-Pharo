Extension { #name : #OGCLine }

{ #category : #'*OGC-Geometry' }
OGCLine >> asGElement [
	^ GSegment with: points first asGElement with: points second asGElement 
]
