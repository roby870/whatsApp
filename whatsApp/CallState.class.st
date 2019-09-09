Class {
	#name : #CallState,
	#superclass : #Object,
	#category : #'whatsApp-Model'
}

{ #category : #accessing }
CallState >> duration: aCall [

^ self subclassResponsibility 
]

{ #category : #activity }
CallState >> finish: aCall [
]

{ #category : #testing }
CallState >> isActive [

^ self subclassResponsibility 
]

{ #category : #testing }
CallState >> isFinished [

^ self subclassResponsibility 
]

{ #category : #testing }
CallState >> isWaiting [

^ self subclassResponsibility 
]

{ #category : #activity }
CallState >> start: aCall [
]
