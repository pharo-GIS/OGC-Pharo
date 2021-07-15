Extension { #name : #GPoint }

{ #category : #'*OGC-Geometry' }
GPoint >> asOGCElement [
	^ OGCPoint x: self x y: self y
]
