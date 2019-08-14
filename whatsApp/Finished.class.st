Class {
	#name : #Finished,
	#superclass : #CallState,
	#category : #'whatsApp-Model'
}

{ #category : #accessing }
Finished >> duration: aCall [

^  aCall finishedAt - aCall startedAt 
]
