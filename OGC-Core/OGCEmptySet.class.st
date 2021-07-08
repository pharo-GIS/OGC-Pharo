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
	 'Empty set'
]

{ #category : #basic }
OGCEmptySet >> isEmpty [
	^ true
]
