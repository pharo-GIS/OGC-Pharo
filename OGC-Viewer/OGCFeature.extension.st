Extension { #name : #OGCFeature }

{ #category : #'*OGC-Viewer' }
OGCFeature >> displayWithZoom: aZoom offsetX: aXValue offsetY: aYValue [
	| morph |
	morph := self geometry displayWithZoom: aZoom offsetX: aXValue offsetY: aYValue.
	(morph isArray ) 
		ifTrue: [ 
			| aMorphFromCollection | 
			aMorphFromCollection := ImageMorph new.
			morph do: [ :eachMorph | aMorphFromCollection addMorph: eachMorph ].
			^ aMorphFromCollection ].
	^ morph
]
