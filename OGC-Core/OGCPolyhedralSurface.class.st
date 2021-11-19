"
A PolyhedralSurface is a contiguous collection of polygons, which share common boundary segments. For each
pair of polygons that “touch”, the common boundary shall be expressible as a finite collection of LineStrings.
"
Class {
	#name : #OGCPolyhedralSurface,
	#superclass : #OGCSurface,
	#category : #'OGC-Core'
}

{ #category : #accessing }
OGCPolyhedralSurface class >> geometryType [
	^ 'PolyhedralSurface'
]

{ #category : #'as yet unclassified' }
OGCPolyhedralSurface >> boundingPolygon: aPolygon [
	"Returns the collection of polygons MultiPolygon, in this surface that bounds the given polygon for any polygon in the surface"
]

{ #category : #accessing }
OGCPolyhedralSurface >> coordinates [
	^ exteriorRing collect: #coordinates
]

{ #category : #'as yet unclassified' }
OGCPolyhedralSurface >> isClosed [
	" Returns  1  (True)  if  the  polygon  closes  on  itself,  and  thus  has  no  boundary  and  encloses a solid"
]

{ #category : #'as yet unclassified' }
OGCPolyhedralSurface >> numPatches [
	"Returns the number of including polygons"
]

{ #category : #'as yet unclassified' }
OGCPolyhedralSurface >> patchesN: anInteger [
	"Returns a polygon in this surface, the order is arbitrary"
]
