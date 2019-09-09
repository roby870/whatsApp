Class {
	#name : #Waiting,
	#superclass : #CallState,
	#category : #'whatsApp-Model'
}

{ #category : #accessing }
Waiting >> duration: aCall [

^ Duration new:0.
]

{ #category : #activity }
Waiting >> finish: aCall [

aCall state: Finished new.
aCall startedAt: DateAndTime now.
aCall finishedAt: aCall startedAt.
]

{ #category : #testing }
Waiting >> isActive [

^ false
]

{ #category : #testing }
Waiting >> isFinished [

^ false
]

{ #category : #testing }
Waiting >> isWaiting [ 

^ true
]

{ #category : #accessing }
Waiting >> start: aCall [

aCall startedAt: DateAndTime now;
		state: Active new.
]
