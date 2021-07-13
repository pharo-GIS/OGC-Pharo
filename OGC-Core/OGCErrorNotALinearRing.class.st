"
When a linear ring wants to be instantiate but is not simple or is not closed
"
Class {
	#name : #OGCErrorNotALinearRing,
	#superclass : #Error,
	#instVars : [
		'isSimple',
		'isClosed'
	],
	#category : #'OGC-Core-Errors'
}

{ #category : #signalling }
OGCErrorNotALinearRing class >> signal: answerIsClosed and: answerIsSimple [
	^ self new
		isSimple: answerIsClosed;
		isClosed: answerIsClosed;
		signal
]

{ #category : #accessing }
OGCErrorNotALinearRing >> isClosed: aBoolean [
	isClosed := aBoolean
]

{ #category : #accessing }
OGCErrorNotALinearRing >> isSimple: aBoolean [
	isSimple := aBoolean
]

{ #category : #accessing }
OGCErrorNotALinearRing >> messageText [
	"Overwritten to initialiaze the message text to a standard text if it has not yet been set"
	
	^ messageText ifNil: [ messageText := self standardMessageText ]
]

{ #category : #printing }
OGCErrorNotALinearRing >> standardMessageText [
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
