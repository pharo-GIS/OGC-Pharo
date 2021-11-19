Class {
	#name : #OGCObject,
	#superclass : #Object,
	#category : #'OGC-Core'
}

{ #category : #'as yet unclassified' }
OGCObject class >> createStyleDictionary: anArray [
	" return a dictionary which can be used as a style dictionary for a OGCGeometry, based on data given as the following array of strings : [ <fillColor> <fillOpacity> <strokeColor> <strokeWidth> ] "
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

{ #category : #style }
OGCObject >> applyContinuousColorationOn: aDataKey withFeatureData: aCSVArray withAssociateKey: aDataAssociateKey withColor: aColorName [
	self subclassResponsibility 
]

{ #category : #style }
OGCObject >> applyStyle: aStyleDictionary [
	" apply the given style (as a dictionary) to every elements"
	self subclassResponsibility 
]

{ #category : #style }
OGCObject >> applyStyle: aStyleDictionary ifFeature: aBlock [
	" apply the given style to features which respect given block closure"
	self subclassResponsibility 
]

{ #category : #converting }
OGCObject >> asFeaturesCollection [ 
	self subclassResponsibility 
]

{ #category : #basic }
OGCObject >> rectangularEnvelope [
	" return a rectangle which can contain all geometries"
	self subclassResponsibility 
]
