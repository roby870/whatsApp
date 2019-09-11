Class {
	#name : #WhatsAppMessage,
	#superclass : #Object,
	#instVars : [
		'content',
		'sender',
		'timestamp'
	],
	#category : #'whatsApp-Model'
}

{ #category : #'instance creation' }
WhatsAppMessage class >> newWithContent: aContent AndSender: aSender [

^ self new 
	initializeWithContent: aContent AndSender: aSender;
	yourself
	
]

{ #category : #accessing }
WhatsAppMessage >> content [
	^ content 	
]

{ #category : #accessing }
WhatsAppMessage >> content: anObject [
	content := anObject
]

{ #category : #initialization }
WhatsAppMessage >> initializeWithContent: aContent AndSender: aSender [

self sender: aSender.
self content: aContent.
self timestamp: DateAndTime now.
]

{ #category : #testing }
WhatsAppMessage >> isEmoji [

^ false
]

{ #category : #testing }
WhatsAppMessage >> isText [ 

^ false
]

{ #category : #accessing }
WhatsAppMessage >> sender [
	^ sender
]

{ #category : #accessing }
WhatsAppMessage >> sender: anObject [
	sender := anObject
]

{ #category : #accessing }
WhatsAppMessage >> timestamp [
	^ timestamp
]

{ #category : #accessing }
WhatsAppMessage >> timestamp: anObject [
	timestamp := anObject
]
