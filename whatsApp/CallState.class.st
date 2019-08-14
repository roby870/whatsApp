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

{ #category : #activity }
CallState >> start: aCall [
]
