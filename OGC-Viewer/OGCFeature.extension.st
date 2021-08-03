Extension { #name : #OGCFeature }

{ #category : #'*OGC-Viewer' }
OGCFeature >> displayWithZoom: aZoom offsetX: aXValue offsetY: aYValue [
	| morph initialOffsetX initialOffsetY |
	
	initialOffsetX := (self rectangularTileEnvelopeWithZoom: aZoom) origin x.
	initialOffsetY := (self rectangularTileEnvelopeWithZoom: aZoom) origin y.
	
	morph := self geometry displayWithZoom: aZoom offsetX: (aXValue + initialOffsetX) offsetY: (aYValue + initialOffsetY).
	(morph isArray ) 
		ifTrue: [ 
			| aMorphFromCollection | 
			aMorphFromCollection := ImageMorph new.
			morph do: [ :eachMorph | aMorphFromCollection addMorph: eachMorph ].
			^ aMorphFromCollection ].
		
	^ morph
]

{ #category : #'*OGC-Viewer' }
OGCFeature >> simpleDisplayWithZoom: aZoom offsetX: aXValue offsetY: aYValue [
	| morph i|
	
	morph := self geometry displayWithZoom: aZoom offsetX: (aXValue) offsetY: (aYValue).
	(morph isArray ) 
		ifTrue: [ 
			| aMorphFromCollection | 
			aMorphFromCollection := ImageMorph new.
			morph do: [ :eachMorph | aMorphFromCollection addMorph: eachMorph ].
			^ aMorphFromCollection ].
		
	^ morph
]
