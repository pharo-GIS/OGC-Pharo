Extension { #name : #OGCPoint }

{ #category : #'*OGC-Geometry' }
OGCPoint >> asGElement [
	^ GPoint x: x y: y
]
