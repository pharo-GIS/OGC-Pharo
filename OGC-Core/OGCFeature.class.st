Class {
	#name : #OGCFeature,
	#superclass : #OGCObject,
	#instVars : [
		'geometry',
		'properties',
		'id'
	],
	#category : #'OGC-Core'
}

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
