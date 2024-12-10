"
I am the empty OGCGeometry object, so `isEmpty = true`
"
Class {
	#name : 'OGCEmptySet',
	#superclass : 'OGCGeometry',
	#category : 'OGC-Core',
	#package : 'OGC-Core'
}

{ #category : 'accessing' }
OGCEmptySet class >> geometryType [ 
	 ^ 'Empty set'
]

{ #category : 'testing' }
OGCEmptySet >> = anotherObject [
	^ self isEmpty = anotherObject isEmpty
]

{ #category : 'basic' }
OGCEmptySet >> isEmpty [
	^ true
]
