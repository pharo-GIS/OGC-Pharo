"
A reference system contains:
- exactly one spatial reference system
- one measure reference system if needed
"
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
