Extension { #name : #OGCLine }

{ #category : #'*OGC-Geometry' }
OGCLine >> asGElement [
	^ GSegment with: points first asGElement with: points second asGElement 
]

{ #category : #'*OGC-Geometry' }
OGCLine >> intersection: anotherGeometry [
	^ anotherGeometry intersectionWithLine: self
]

{ #category : #'*OGC-Geometry' }
OGCLine >> intersectionWithLine: aLine [
	| result |
	"3 possible cases: 
		- no intersection, 
		- same line equation -> answer is a OGCLine too, 
		- simple intersection -> just a OGCPoint of intersection "
	result := self asGElement intersectionsWith: aLine asGElement .
	result ifEmpty: [ ^ OGCEmptySet new ] ifNotEmpty: [ ^ result first asOGCElement ]
]

{ #category : #'*OGC-Geometry' }
OGCLine >> intersectionWithPoint: aPoint [
	| result |
	result :=  (aPoint asGElement intersectionsWithLine: self asGElement).
	result ifEmpty: [ ^ OGCEmptySet new ] ifNotEmpty: [ ^ result first asOGCElement ]
]
