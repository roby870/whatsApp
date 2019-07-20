Class {
	#name : #Chat,
	#superclass : #Object,
	#instVars : [
		'messages'
	],
	#category : #'whatsApp-Model'
}

{ #category : #accessing }
Chat >> messages [
	^ messages
]

{ #category : #accessing }
Chat >> messages: anObject [
	messages := anObject
]
