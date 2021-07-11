"
Error used when too many points are given to instanciate a Line.
"
Class {
	#name : #IncorrectNumberOfPoints,
	#superclass : #Error,
	#instVars : [
		'size'
	],
	#category : #'OGC-Core-Errors'
}

{ #category : #signalling }
IncorrectNumberOfPoints class >> signalWith: anInteger [
	^ self new
		size: anInteger;
		signal
]

{ #category : #accessing }
IncorrectNumberOfPoints >> messageText [
	"Overwritten to initialiaze the message text to a standard text if it has not yet been set"
	
	^ messageText ifNil: [ messageText := self standardMessageText ]
]

{ #category : #accessing }
IncorrectNumberOfPoints >> size: anInteger [
	size := anInteger
]

{ #category : #printing }
IncorrectNumberOfPoints >> standardMessageText [
	"Generate a standard textual description"
	
	^ String streamContents: [ :stream |
		stream print: size.
		stream << ' points were given instead of 2 to define a Line' ]
]
