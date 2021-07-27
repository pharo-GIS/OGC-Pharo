Extension { #name : #OGCCurve }

{ #category : #'*OGC-Viewer' }
OGCCurve >> displayWithZoom: zoom offsetX: offsetX offsetY: offsetY [
	| allXPixel allYPixel surface amplitudeX amplitudeY initialOffsetX initialOffsetY coordInit coordNext pointInit morph |
	" 1. define working surface "
	allXPixel := points collect: [ :each | each xPixelWithZoom: zoom ].
	allYPixel := points collect: [ :each | each yPixelWithZoom: zoom ].
	amplitudeX := allXPixel max - allXPixel min.
	amplitudeY := allYPixel max - allYPixel min.
	surface := AthensCairoSurface extent: amplitudeX@amplitudeY.
	" 2. define first point coordinates: reference "
	initialOffsetX := (self points first xPixelWithZoom: zoom) - allXPixel min.
	initialOffsetY := (self points first yPixelWithZoom: zoom) - allYPixel min.
	coordInit := initialOffsetX @ initialOffsetY .
	
	surface drawDuring: [ :can | 
		" 3. init surface "
		surface clear: Color transparent .
		" to do : consider style dictionary "
		(can setStrokePaint: self color ) width: self width.
		pointInit := points first.
		" 4. draw linestring "
		points allButFirst do: [ :point_i |
			coordNext := 
				(Point x: (point_i xPixelWithZoom: zoom) y: (point_i yPixelWithZoom: zoom) ) 
				- (Point x: (pointInit xPixelWithZoom: zoom) y: (pointInit yPixelWithZoom: zoom) ).
			can drawShape: (can createPath: [:builder |
				builder 
					moveTo: coordInit;
					lineTo: coordNext.
			 ]).
			coordInit := coordInit + coordNext.
			pointInit := point_i.
	 	]
	].	
	" 5. change result position "
	morph := surface asMorph.
	morph position: 
		((initialOffsetX sign: (-1) ) + (points first xPixelWithOffset: offsetX withZoom: zoom))
		@ ((initialOffsetY sign: (-1) ) + (points first yPixelWithOffset: offsetY withZoom: zoom)).
	^ morph
]
