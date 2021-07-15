Extension { #name : #OGCPointTest }

{ #category : #'*OGC-Geometry-Tests' }
OGCPointTest >> testDistance [
	| point1 point2 |
	point1 := OGCPoint xy: #(0 1).
	point2 := OGCPoint xy: #(0 4).
	self assert: (point1 distance: point2) equals: 3
]
