Extension { #name : #OGCTriangle }

{ #category : #'*OGC-Geometry' }
OGCTriangle >> asGElement [
	| points | 
	points := exteriorRing points. 
	^ ( GTriangle with: points first asGElement with: points second asGElement with: points third asGElement ) 
]
