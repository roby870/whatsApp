Class {
	#name : #MobileClient,
	#superclass : #Object,
	#instVars : [
		'clientNumber',
		'whatsapp'
	],
	#category : #'whatsApp-Model'
}

{ #category : #'as yet unclassified' }
MobileClient class >> newWithClientNumber: aNumber [

^ self new
	initializeWithClientNumber: aNumber;
	yourself
]

{ #category : #accessing }
MobileClient >> clientNumber [
	^ clientNumber
]

{ #category : #accessing }
MobileClient >> clientNumber: anObject [
	clientNumber := anObject
]

{ #category : #initialization }
MobileClient >> initializeWithClientNumber: aNumber [

self clientNumber: aNumber.
]

{ #category : #'as yet unclassified' }
MobileClient >> sendTextMessage:aMessage From: aNumber ToChat: aChatId [

self whatsapp receiveTextMessage:aMessage From: aNumber ToChat: aChatId
]

{ #category : #accessing }
MobileClient >> whatsapp [
	^ whatsapp
]

{ #category : #accessing }
MobileClient >> whatsapp: anObject [
	whatsapp := anObject
]
