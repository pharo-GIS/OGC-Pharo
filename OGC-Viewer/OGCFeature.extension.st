Extension { #name : 'OGCFeature' }

{ #category : '*OGC-Viewer' }
OGCFeature >> displayWithZoom: aZoom offsetX: aXValue offsetY: aYValue [
	| morph |
	morph := self geometry displayWithZoom: aZoom offsetX: aXValue offsetY: aYValue.
	morph on: #click send: #handleClick to: self.
	^ morph
]

{ #category : '*OGC-Viewer' }
OGCFeature >> handleClick [
	" at click on my morph: open window with properties "
	| textToDisplay |
	textToDisplay := String new.
	self properties keysAndValuesDo: [ :aKey :aValue |
		textToDisplay := textToDisplay , aKey asString , ' : ' , aValue asString , '
' ].
	OGCInformationWindowPresenter isClosed ifTrue: [ OGCInformationWindowPresenter open ].
	OGCInformationWindowPresenter textPresenter text: textToDisplay .
	OGCInformationWindowPresenter inspectButton action: [ self inspect ].
]
