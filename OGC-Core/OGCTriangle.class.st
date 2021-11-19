"
A Triangle is a polygon with 3 distinct, non-collinear vertices and no
interior boundary
"
Class {
	#name : #OGCTriangle,
	#superclass : #OGCPolygon,
	#category : #'OGC-Core'
}

{ #category : #accessing }
OGCTriangle class >> geometryType [
	^ 'Triangle'
]

{ #category : #'as yet unclassified' }
OGCTriangle class >> withExteriorRing: aLineString [
	^ self new exteriorRing: aLineString
]

{ #category : #basic }
OGCTriangle >> area [
	^ spatialReferenceSystem area: self
]

{ #category : #basic }
OGCTriangle >> boundary [
	^ exteriorRing 
]
