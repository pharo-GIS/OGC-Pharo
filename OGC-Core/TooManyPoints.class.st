"
Error used when too many points are given to instanciate a Line.
"
Class {
	#name : #TooManyPoints,
	#superclass : #Error,
	#instVars : [
		'size'
	],
	#category : #'OGC-Core-Errors'
}

{ #category : #signalling }
TooManyPoints class >> signalWith: anInteger [
	^ self new
		size: anInteger;
		signal
]

{ #category : #accessing }
TooManyPoints >> messageText [
	"Overwritten to initialiaze the message text to a standard text if it has not yet been set"
	
	^ messageText ifNil: [ messageText := self standardMessageText ]
]

{ #category : #accessing }
TooManyPoints >> size: anInteger [
	size := anInteger
]

{ #category : #printing }
TooManyPoints >> standardMessageText [
	"Generate a standard textual description"
	
	^ String streamContents: [ :stream |
		stream print: size.
		stream << ' points were given instead of 2 to define a Line' ]
]
