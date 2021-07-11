Class {
	#name : #OGCReferenceSystem,
	#superclass : #Object,
	#category : #'OGC-Core'
}

{ #category : #accessing }
OGCReferenceSystem class >> axisName [
	self subclassResponsibility 
]

{ #category : #accessing }
OGCReferenceSystem class >> dimension [
	self subclassResponsibility 
]

{ #category : #testing }
OGCReferenceSystem class >> isAbstract [
	^ true
]
