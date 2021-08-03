Class {
	#name : #OGCFeatureCollection,
	#superclass : #OGCObject,
	#instVars : [
		'features',
		'properties'
	],
	#category : #'OGC-Core'
}

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
