Extension { #name : #OGCFeature }

{ #category : #'*OGC-Viewer' }
OGCFeature >> displayWithZoom: aZoom offsetX: aXValue offsetY: aYValue [
	| morph |
	
	morph := self geometry displayWithZoom: aZoom offsetX: (aXValue) offsetY: (aYValue).
	^ morph
]
