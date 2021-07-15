Extension { #name : #GPoint }

{ #category : #'*OGC-Core' }
GPoint >> asOGCElement [
	^ OGCPoint x: self x y: self y
]
