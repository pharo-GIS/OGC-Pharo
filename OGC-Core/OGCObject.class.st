Class {
	#name : #OGCObject,
	#superclass : #Object,
	#instVars : [
		'properties'
	],
	#category : #'OGC-Core'
}

{ #category : #testing }
OGCObject class >> isAbstract [
	^ self = OGCObject
]
