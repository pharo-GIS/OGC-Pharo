Class {
	#name : #OGCInformationWindowPresenter,
	#superclass : #SpWindowPresenter,
	#classInstVars : [
		'presenter'
	],
	#category : #'OGC-Viewer'
}

{ #category : #'as yet unclassified' }
OGCInformationWindowPresenter class >> getNewPresenter [
	^ self new 
		presenter: self getNewSubPresenter ;
		title: 'Information'
]

{ #category : #'as yet unclassified' }
OGCInformationWindowPresenter class >> getNewSubPresenter [
	| newPresenter |

	newPresenter := SpPresenter new.
	newPresenter layout: (SpBoxLayout  newTopToBottom
		add: 'Properties' expand: false;
		add: (newPresenter newText beNotEditable) expand: true;
		addLast: (SpBoxLayout newLeftToRight
				addLast: (newPresenter newButton label: 'Inspect') expand: false;
				yourself)
			expand: false;
		yourself).
			
	^ newPresenter
]

{ #category : #'as yet unclassified' }
OGCInformationWindowPresenter class >> inspectButton [
	^ self presenter presenter layout children third children first
]

{ #category : #testing }
OGCInformationWindowPresenter class >> isClosed [ 
	^ self isOpened not
]

{ #category : #testing }
OGCInformationWindowPresenter class >> isOpened [
	^ self presenter isOpen
]

{ #category : #testing }
OGCInformationWindowPresenter class >> open [
	presenter := self getNewPresenter .
	self presenter open.
]

{ #category : #accessing }
OGCInformationWindowPresenter class >> presenter [
	^ presenter ifNil: [ ^ presenter := self getNewPresenter ]
]

{ #category : #accessing }
OGCInformationWindowPresenter class >> textPresenter [
	^ self presenter presenter layout children second
]

{ #category : #accessing }
OGCInformationWindowPresenter class >> title [
	^ 'Informations'
]
