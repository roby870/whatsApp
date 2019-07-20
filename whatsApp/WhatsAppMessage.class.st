Class {
	#name : #WhatsAppMessage,
	#superclass : #Object,
	#instVars : [
		'sender',
		'chat'
	],
	#category : #'whatsApp-Model'
}

{ #category : #accessing }
WhatsAppMessage >> chat [
	^ chat
]

{ #category : #accessing }
WhatsAppMessage >> chat: anObject [
	chat := anObject
]

{ #category : #accessing }
WhatsAppMessage >> sender [
	^ sender
]

{ #category : #accessing }
WhatsAppMessage >> sender: anObject [
	sender := anObject
]
