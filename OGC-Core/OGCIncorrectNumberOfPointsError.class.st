"
Error used when too many points are given to instanciate a Line.
"
Class {
	#name : #OGCIncorrectNumberOfPointsError,
	#superclass : #Error,
	#instVars : [
		'size'
	],
	#category : #'OGC-Core-Errors'
}

{ #category : #signalling }
OGCIncorrectNumberOfPointsError class >> signalWith: anInteger [
	^ self new
		size: anInteger;
		signal
]

{ #category : #accessing }
OGCIncorrectNumberOfPointsError >> messageText [
	"Overwritten to initialiaze the message text to a standard text if it has not yet been set"
	
	^ messageText ifNil: [ messageText := self standardMessageText ]
]

{ #category : #accessing }
OGCIncorrectNumberOfPointsError >> size: anInteger [
	size := anInteger
]

{ #category : #printing }
OGCIncorrectNumberOfPointsError >> standardMessageText [
	"Generate a standard textual description"
	
	^ String streamContents: [ :stream |
		stream print: size.
		stream << ' points were given instead of 2 to define a Line' ]
]
