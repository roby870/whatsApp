Class {
	#name : #Active,
	#superclass : #CallState,
	#category : #'whatsApp-Model'
}

{ #category : #activity }
Active >> duration: aCall [

^ DateAndTime now  - aCall startedAt 
]

{ #category : #activity }
Active >> finish: aCall [

aCall changeToFinished
]
