Class {
	#name : #OGCInformationPresenter,
	#superclass : #SpWindowPresenter,
	#classInstVars : [
		'presenter'
	],
	#category : #'OGC-Viewer'
}

{ #category : #testing }
OGCInformationPresenter class >> isClosed [ 
	^ self isOpened not
]

{ #category : #testing }
OGCInformationPresenter class >> isOpened [
	^ self presenter isOpen
]

{ #category : #testing }
OGCInformationPresenter class >> open [
	self presenter open
]

{ #category : #accessing }
OGCInformationPresenter class >> presenter [
	^ presenter ifNil: [ presenter := self new presenter: (SpTextPresenter new beNotEditable ) ]
]

{ #category : #accessing }
OGCInformationPresenter class >> textPresenter [
	^ self presenter presenter
]
