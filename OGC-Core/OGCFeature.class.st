Class {
	#name : #OGCFeature,
	#superclass : #OGCObject,
	#instVars : [
		'geometry',
		'properties',
		'id',
		'informationWindow'
	],
	#category : #'OGC-Core'
}

{ #category : #styling }
OGCFeature >> applyStyle: aStyleDictionary [
	self geometry applyStyle: aStyleDictionary 
]

{ #category : #converting }
OGCFeature >> asFeaturesCollection [ 
	^ OGCFeatureCollection new features: (Array with: self)
]

{ #category : #'methods analysis' }
OGCFeature >> distance: anotherFeature [
	^ self geometry distance: anotherFeature geometry
]

{ #category : #accessing }
OGCFeature >> geometry [
	^ geometry
]

{ #category : #accessing }
OGCFeature >> geometry: anObject [
	geometry := anObject
]

{ #category : #accessing }
OGCFeature >> id [ 
	^ id
]

{ #category : #accessing }
OGCFeature >> id: aStringIdOrInteger [
	id := aStringIdOrInteger
]

{ #category : #accessing }
OGCFeature >> properties [
	^ properties 
]

{ #category : #accessing }
OGCFeature >> properties: aDictionary [
	properties := aDictionary
]

{ #category : #basic }
OGCFeature >> rectangularEnvelope [
	" Returns the minimal rectangle which contains all features "
	^ self geometry rectangularEnvelope 
]
