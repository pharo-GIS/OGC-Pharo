"
When a linear ring wants to be instantiate but is not simple or is not closed
"
Class {
	#name : #NotALinearRing,
	#superclass : #Error,
	#instVars : [
		'isSimple',
		'isClosed'
	],
	#category : #'OGC-Core-Errors'
}

{ #category : #signalling }
NotALinearRing class >> signal: answerIsClosed and: answerIsSimple [
	^ self new
		isSimple: answerIsClosed;
		isClosed: answerIsClosed;
		signal
]

{ #category : #accessing }
NotALinearRing >> isClosed: aBoolean [
	isClosed := aBoolean
]

{ #category : #accessing }
NotALinearRing >> isSimple: aBoolean [
	isSimple := aBoolean
]

{ #category : #accessing }
NotALinearRing >> messageText [
	"Overwritten to initialiaze the message text to a standard text if it has not yet been set"
	
	^ messageText ifNil: [ messageText := self standardMessageText ]
]

{ #category : #printing }
NotALinearRing >> standardMessageText [
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
