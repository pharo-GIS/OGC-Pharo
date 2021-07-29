Class {
	#name : #OGCFeatureCollection,
	#superclass : #OGCObject,
	#instVars : [
		'features',
		'properties'
	],
	#category : #'OGC-Core'
}

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
	" Returns [ minX, maxX, minY, maxY ] to define minimal rectangle which contains all features "
	| minX maxX minY maxY |
	minX := (features collect: [ :aFeature | aFeature geometry rectangularEnvelope at: 'minX' ]) min.
	maxX := (features collect: [ :aFeature | aFeature geometry rectangularEnvelope at: 'maxX' ]) max.
	minY := (features collect: [ :aFeature | aFeature geometry rectangularEnvelope at: 'minY' ]) min.
	maxY := (features collect: [ :aFeature | aFeature geometry rectangularEnvelope at: 'maxY' ]) max.
	^ Dictionary newFromPairs: {'minX' . minX . 'maxX' . maxX . 'minY' . minY . 'maxY' . maxY }
]
