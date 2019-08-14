Class {
	#name : #Waiting,
	#superclass : #CallState,
	#category : #'whatsApp-Model'
}

{ #category : #accessing }
Waiting >> duration: aCall [

^ 0
]

{ #category : #activity }
Waiting >> finish: aCall [

aCall changeToFinished 
]

{ #category : #accessing }
Waiting >> start: aCall [

aCall changeToStart.
]
