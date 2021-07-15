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
