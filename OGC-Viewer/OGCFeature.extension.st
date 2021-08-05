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
	" at click on my morph: open window with properties "
	| textToDisplay |
	textToDisplay := String new.
	self properties keysAndValuesDo: [ :aKey :aValue |
		textToDisplay := textToDisplay , aKey asString , ' : ' , aValue asString , '
' ].
	OGCInformationPresenter isClosed ifTrue: [ OGCInformationPresenter open ].
	OGCInformationPresenter textPresenter text: textToDisplay .
]
