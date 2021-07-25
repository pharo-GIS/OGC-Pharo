Extension { #name : #OGCGeometry }

{ #category : #'*OGC-Geometry' }
OGCGeometry >> asGElement [
	self subclassResponsibility 
]

{ #category : #'*OGC-Geometry' }
OGCGeometry >> initialize [
	spatialReferenceSystem := OGCGeometricProjection
]
