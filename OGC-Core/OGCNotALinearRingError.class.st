"
When a linear ring wants to be instantiate but is not simple or is not closed
"
Class {
	#name : #OGCNotALinearRingError,
	#superclass : #Error,
	#instVars : [
		'isSimple',
		'isClosed'
	],
	#category : #'OGC-Core-Errors'
}

{ #category : #signalling }
OGCNotALinearRingError class >> signal: answerIsClosed and: answerIsSimple [
	^ self new
		isSimple: answerIsClosed;
		isClosed: answerIsClosed;
		signal
]

{ #category : #accessing }
OGCNotALinearRingError >> isClosed: aBoolean [
	isClosed := aBoolean
]

{ #category : #accessing }
OGCNotALinearRingError >> isSimple: aBoolean [
	isSimple := aBoolean
]

{ #category : #accessing }
OGCNotALinearRingError >> messageText [
	"Overwritten to initialiaze the message text to a standard text if it has not yet been set"
	
	^ messageText ifNil: [ messageText := self standardMessageText ]
]

{ #category : #printing }
OGCNotALinearRingError >> standardMessageText [
	"Generate a standard textual description"
	| isClosedMessage isSimpleMessage |
	isClosedMessage := isClosed 
		ifFalse: [ 'Is not closed as it must be. ']
		ifTrue: [ '' ].
	isSimpleMessage := isSimple
		ifFalse: [ 'Is not simple as it must be. ' ]
		ifTrue: [ '' ].
	^ String streamContents: [ :stream |
		stream << isClosedMessage + isSimpleMessage  ]
]
