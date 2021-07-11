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
	^ spatialRS area: self
]

{ #category : #'as yet unclassified' }
OGCTriangle >> asGElement [
	| points |
	points := exteriorRing points.
	^ ( GTriangle with: points first asGElement with: points second asGElement with: points third asGElement ) 
]

{ #category : #basic }
OGCTriangle >> boundary [
	^ exteriorRing 
]
