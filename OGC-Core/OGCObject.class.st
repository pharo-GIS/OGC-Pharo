Class {
	#name : #OGCObject,
	#superclass : #Object,
	#category : #'OGC-Core'
}

{ #category : #testing }
OGCObject class >> isAbstract [
	^ self = OGCObject
]
