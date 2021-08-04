Extension { #name : #OGCFeature }

{ #category : #'*OGC-Viewer' }
OGCFeature >> displayWithZoom: aZoom offsetX: aXValue offsetY: aYValue [
	| morph |
	morph := self geometry displayWithZoom: aZoom offsetX: aXValue offsetY: aYValue.
	morph on: #click send: #handleClick to: self.
	^ morph
]

{ #category : #'*OGC-Viewer' }
OGCFeature >> handleClick [
	" at click on my morph: inspect my properties "
	(self properties ) inspect.
]
