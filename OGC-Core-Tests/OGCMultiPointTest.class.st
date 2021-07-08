Class {
	#name : #OGCMultiPointTest,
	#superclass : #TestCase,
	#category : #'OGC-Core-Tests'
}

{ #category : #tests }
OGCMultiPointTest >> testLocateAlong [
	| points mp result |
	points := Bag with: (OGCPoint xym: #(1 0 4)). 
	points add: (OGCPoint xym: #(1 1 1)).
	points add: (OGCPoint xym: #(1 2 2)).
	mp := OGCMultiPoint withPoints: points.
	result := mp locateAlong: 4.
	self assert: result class equals: OGCMultiPoint.
	self assert: (result geometries contains: [ :each | each class = OGCPoint ])
]

{ #category : #tests }
OGCMultiPointTest >> testLocateAlongWithMValue [
	| points wantedPoints mp wantedMp|
	points := Bag with: (OGCPoint xym: #(1 0 4)). 
	wantedPoints := Bag with: (OGCPoint xym: #(1 0 4)). 
	points add: (OGCPoint xym: #(1 1 1)).
	points add: (OGCPoint xym: #(1 2 2)).
	points add: (OGCPoint xym: #(3 1 4)).
	wantedPoints add: (OGCPoint xym: #(3 1 4)).
	points add: (OGCPoint xym: #(5 3 4)).
	wantedPoints add: (OGCPoint xym: #(5 3 4)).
	mp := OGCMultiPoint withPoints: points.
	wantedMp := OGCMultiPoint withPoints: wantedPoints.
	self assert: (mp locateAlong: 4) equals: wantedMp.
]

{ #category : #tests }
OGCMultiPointTest >> testLocateBetweenWithMValues [
	| points wantedPoints mp wantedMp|
	points := Bag with: (OGCPoint xym: #(1 0 4)). 
	wantedPoints := Bag with: (OGCPoint xym: #(1 0 4)). 
	points add: (OGCPoint xym: #(1 1 1)).
	points add: (OGCPoint xym: #(1 2 2)).
	wantedPoints add: (OGCPoint xym: #(1 2 2)).
	points add: (OGCPoint xym: #(3 1 4)).
	wantedPoints add: (OGCPoint xym: #(3 1 4)).
	points add: (OGCPoint xym: #(5 3 5)).
	points add: (OGCPoint xym: #(9 5 3)).
	wantedPoints add: (OGCPoint xym: #(9 5 3)).
	points add: (OGCPoint xym: #(7 6 7)).
	mp := OGCMultiPoint withPoints: points.
	wantedMp := OGCMultiPoint withPoints: wantedPoints.
	self assert: (mp locateBetween: 2 and: 4) equals: wantedMp.
]
