Class {
	#name : #Finished,
	#superclass : #CallState,
	#category : #'whatsApp-Model'
}

{ #category : #accessing }
Finished >> duration: aCall [

^  aCall finishedAt - aCall startedAt 
]

{ #category : #testing }
Finished >> isActive [ 

^ false
]

{ #category : #testing }
Finished >> isFinished [

^ true
]

{ #category : #testing }
Finished >> isWaiting [

^ false
]
