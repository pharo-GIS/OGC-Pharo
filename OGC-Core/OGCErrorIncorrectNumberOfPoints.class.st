"
Error used when too many points are given to instanciate a Line.
"
Class {
	#name : #OGCErrorIncorrectNumberOfPoints,
	#superclass : #Error,
	#instVars : [
		'size'
	],
	#category : #'OGC-Core-Errors'
}

{ #category : #signalling }
OGCErrorIncorrectNumberOfPoints class >> signalWith: anInteger [
	^ self new
		size: anInteger;
		signal
]

{ #category : #accessing }
OGCErrorIncorrectNumberOfPoints >> messageText [
	"Overwritten to initialiaze the message text to a standard text if it has not yet been set"
	
	^ messageText ifNil: [ messageText := self standardMessageText ]
]

{ #category : #accessing }
OGCErrorIncorrectNumberOfPoints >> size: anInteger [
	size := anInteger
]

{ #category : #printing }
OGCErrorIncorrectNumberOfPoints >> standardMessageText [
	"Generate a standard textual description"
	
	^ String streamContents: [ :stream |
		stream print: size.
		stream << ' points were given instead of 2 to define a Line' ]
]
