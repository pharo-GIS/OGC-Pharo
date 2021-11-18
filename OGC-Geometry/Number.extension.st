Extension { #name : #Number }

{ #category : #'*OGC-Geometry' }
Number >> asOGCPoint [
	"Answer a Point with the receiver as both coordinates; often used to 
	supply the same value in two dimensions, as with symmetrical gridding 
	or scaling."

	^ OGCPoint x: self y: self
]
