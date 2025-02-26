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

aCall state: Finished new.
aCall finishedAt: DateAndTime now.
(Server singleton getUserByNumber: aCall caller) chargeCall: aCall duration.

]

{ #category : #testing }
Active >> isActive [ 

^ true
]

{ #category : #testing }
Active >> isFinished [

^ false
]

{ #category : #testing }
Active >> isWaiting [

^ false
]
