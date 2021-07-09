Class {
	#name : #OGCReferenceSystem,
	#superclass : #Object,
	#category : #'OGC-Core'
}

{ #category : #testing }
OGCReferenceSystem class >> isAbstract [
	^ true
]

{ #category : #accessing }
OGCReferenceSystem >> axisName [
	self subclassResponsibility 
]

{ #category : #accessing }
OGCReferenceSystem >> dimension [
	self subclassResponsibility 
]
