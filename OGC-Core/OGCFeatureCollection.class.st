Class {
	#name : #OGCFeatureCollection,
	#superclass : #OGCObject,
	#instVars : [
		'features',
		'properties'
	],
	#category : #'OGC-Core'
}

{ #category : #style }
OGCFeatureCollection >> applyStyle: aStyleDictionary [
	self features do: [ :aFeature | aFeature applyStyle: aStyleDictionary ]
]

{ #category : #style }
OGCFeatureCollection >> applyStyle: aStyleDictionary ifFeature: aBlock [
	self features do: [ :eachFeature | eachFeature applyStyle: aStyleDictionary ifFeature: aBlock ]
]

{ #category : #style }
OGCFeatureCollection >> applyStyleOn: aDataKey withFeatureData: aCSVArray withAssociateKey: aDataAssociateKey withColor: aColorName [
	^ self applyStyleOn: aDataKey withFeatureData: aCSVArray withAssociateKey: aDataAssociateKey withEqualityCondition: [ :a :b | a = b ] withColor: aColorName
]

{ #category : #style }
OGCFeatureCollection >> applyStyleOn: aDataKey withFeatureData: aCSVArray withAssociateKey: aDataAssociateKey withEqualityCondition: aBlock withColor: aColorName [
	| indexKey indexAssociateKey dataDictionary maxValue minValue |
	" 1. organize data "
	indexKey := aCSVArray first indexOf: aDataKey.
	indexAssociateKey := aCSVArray first indexOf: aDataAssociateKey.
	dataDictionary := Dictionary new.
	aCSVArray allButFirst do: [ :aLine | dataDictionary at: (aLine at: indexAssociateKey) put: ((aLine at: indexKey) asNumber) ].
	" 2. fix colors "
	maxValue := dataDictionary values max.
	minValue := dataDictionary values min.
	(minValue = maxValue) 
		ifTrue: [ 
			"all features have the same value"
			self applyStyle: (self class createStyleDictionary: { aColorName . nil . nil . nil })
		] 
		ifFalse: [  ].
	" 3. apply color based on value"
	dataDictionary keysDo: [ :aDataKey_i |
		| opacity_rate equalityBlock|
		opacity_rate := (((dataDictionary at: aDataKey_i) - minValue)/(maxValue - minValue)) asFloat round:3.
		equalityBlock := [ :aFeature | aBlock value: (aFeature properties at: aDataAssociateKey) value: (aDataKey_i) ].
		self applyStyle: (self class createStyleDictionary: { aColorName . opacity_rate . nil . nil }) ifFeature: equalityBlock .
		" we add data to properties"
		self features select: equalityBlock thenDo: [ :aFeature | aFeature properties at: (aDataKey) put: (dataDictionary at: aDataKey_i) ]
		 ].
]

{ #category : #converting }
OGCFeatureCollection >> asFeaturesCollection [ 
	^ self
]

{ #category : #accessing }
OGCFeatureCollection >> features [
	^ features
]

{ #category : #accessing }
OGCFeatureCollection >> features: aCollection [ 
	features := aCollection
]

{ #category : #accessing }
OGCFeatureCollection >> initialize [
	super initialize.
	features := OrderedCollection new.
	properties := Dictionary new.
]

{ #category : #accessing }
OGCFeatureCollection >> properties [
	^ properties
]

{ #category : #accessing }
OGCFeatureCollection >> rectangularEnvelope [
	" Returns the minimal rectangle which contains all features "
	| allRectangularEnvelopes |
	allRectangularEnvelopes := features collect: [ :aFeature | aFeature geometry rectangularEnvelope  ].
	^ allRectangularEnvelopes reduce: [ :rect1 :rect2 | rect1 merge: rect2 ]
]
