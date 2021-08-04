Class {
	#name : #OGCObject,
	#superclass : #Object,
	#category : #'OGC-Core'
}

{ #category : #'as yet unclassified' }
OGCObject class >> createStyleDictionary: anArray [
	" array = [ <fillColor> <fillOpacity> <strokeColor> <strokeWidth> ]"
	| styleDictionary keys |
	styleDictionary := Dictionary new.
	keys := { 'fill' . 'fill-opacity' . 'stroke' . 'stroke-width'}.
	anArray withIndexDo: [ :each :i | each ifNotNil: [ styleDictionary at: (keys at: i) put: each asString ] ].
	^ styleDictionary 
]

{ #category : #testing }
OGCObject class >> isAbstract [
	^ self = OGCObject
]

{ #category : #styling }
OGCObject >> applyStyle: aStyleDictionary [
	self subclassResponsibility 
]

{ #category : #styling }
OGCObject >> applyStyle: aStyleDictionary ifFeature: aBlock [
	self subclassResponsibility 
]

{ #category : #converting }
OGCObject >> asFeaturesCollection [ 
	self subclassResponsibility 
]

{ #category : #basic }
OGCObject >> rectangularEnvelope [
	self subclassResponsibility 
]
