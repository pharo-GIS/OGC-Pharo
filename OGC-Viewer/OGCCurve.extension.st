Extension { #name : #OGCCurve }

{ #category : #'*OGC-Viewer' }
OGCCurve >> displayWithZoom: zoom offsetX: offsetX offsetY: offsetY [
	| allXPixel allYPixel surface amplitudeX amplitudeY initialOffsetX initialOffsetY coordInit coordNext pointInit morph path |
	" 1. define working surface "
	allXPixel := points collect: [ :each | each xPixelWithZoom: zoom ].
	allYPixel := points collect: [ :each | each yPixelWithZoom: zoom ].
	amplitudeX := allXPixel max - allXPixel min.
	amplitudeY := allYPixel max - allYPixel min.
	surface := AthensCairoSurface extent: amplitudeX@amplitudeY.
	" 2. define first point coordinates: reference "
	initialOffsetX := (self startPoint xPixelWithZoom: zoom) - allXPixel min.
	initialOffsetY := (self startPoint yPixelWithZoom: zoom) - allYPixel min.
	coordInit := initialOffsetX @ initialOffsetY .
	
	surface drawDuring: [ :can | 
		" 3. init surface "
		surface clear: Color transparent .
		" to do : consider style dictionary "
		
		" 4. draw linestring "
		path := can createPath: [ :p | 
			
			pointInit := points first.
			p relative.
			p moveTo: coordInit.
			
			points allButFirst do: [ :point_i |
				coordNext := 
					(Point x: (point_i xPixelWithZoom: zoom) y: (point_i yPixelWithZoom: zoom) ) 
					- (Point x: (pointInit xPixelWithZoom: zoom) y: (pointInit yPixelWithZoom: zoom) ).
	
				p lineTo: coordNext.
				
				coordInit := coordInit + coordNext.
				pointInit := point_i.
	 		]	
		].
		can setShape: path.		
	].	
	
	surface drawDuring: [ :can | 
		can setPaint: self styleFillColor.
		can draw 
	].
	surface drawDuring: [ :can | 
		(can setStrokePaint: self styleStrokeColor ) width: self styleStrokeWidth.
		can draw
	].
	" 5. change result position "
	morph := surface asMorph.
	morph position: 
		((initialOffsetX sign: (-1) ) + (self startPoint xPixelWithOffset: offsetX withZoom: zoom))
		@ ((initialOffsetY sign: (-1) ) + (self startPoint yPixelWithOffset: offsetY withZoom: zoom)).
	^ morph
]
