Extension { #name : #OGCLineString }

{ #category : #'*OGC-Geometry' }
OGCLineString >> intersection: anotherGeometry [
	| allIntersections |
	allIntersections := self lines collect: [ :aLine | aLine intersection: anotherGeometry ].
	allIntersections := (allIntersections asSet) reject: [:each | each class geometryType = 'Empty set' ].
	allIntersections 
		ifEmpty: [ ^ OGCEmptySet new ] 
		ifNotEmpty: [ 
			(allIntersections size = 1)
				ifTrue: [ ^ allIntersections asArray first ] 
				ifFalse: [ ^ OGCGeometryCollection geometries: allIntersections ]
		]
]

{ #category : #'*OGC-Geometry' }
OGCLineString >> intersectionWithLine: aLine [
	^ self intersection: aLine
]

{ #category : #'*OGC-Geometry' }
OGCLineString >> intersectionWithPoint: aPoint [
	^ self intersection: aPoint
]
