"
I am a geometric object with isEmpty = true.
"
Class {
	#name : #OGCEmptySet,
	#superclass : #OGCGeometry,
	#category : #'OGC-Core'
}

{ #category : #accessing }
OGCEmptySet class >> geometryType [ 
	 ^ 'Empty set'
]

{ #category : #testing }
OGCEmptySet >> = anotherObject [
	^ self isEmpty = anotherObject isEmpty
]

{ #category : #basic }
OGCEmptySet >> isEmpty [
	^ true
]
