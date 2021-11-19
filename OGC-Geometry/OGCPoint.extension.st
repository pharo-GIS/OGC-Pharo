Extension { #name : #OGCPoint }

{ #category : #'*OGC-Geometry' }
OGCPoint >> asGElement [
	^ GPoint x: x y: y
]

{ #category : #'*OGC-Geometry' }
OGCPoint >> intersection: anotherGeometry [
	^ anotherGeometry intersectionWithPoint: self
]

{ #category : #'*OGC-Geometry' }
OGCPoint >> intersectionWithLine: aLine [
	^ aLine intersectionWithPoint: self
]

{ #category : #'*OGC-Geometry' }
OGCPoint >> intersectionWithPoint: aPoint [
	| intersectionAnswer |
	intersectionAnswer := (self asGElement ) intersectionsWithPoint: (aPoint asGElement ).
	intersectionAnswer ifEmpty: [ ^ OGCEmptySet new ] ifNotEmpty: [ ^ intersectionAnswer first asOGCElement ]
]
