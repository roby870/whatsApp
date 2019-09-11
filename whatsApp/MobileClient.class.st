Class {
	#name : #MobileClient,
	#superclass : #Object,
	#instVars : [
		'clientNumber',
		'whatsapp',
		'totalAmount'
	],
	#category : #'whatsApp-Model'
}

{ #category : #'as yet unclassified' }
MobileClient class >> newWithClientNumber: aNumber [

^ self new
	initializeWithClientNumber: aNumber;
	yourself
]

{ #category : #'as yet unclassified' }
MobileClient >> chargeCall: aDuration [

^ self subclassResponsibility 
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
self totalAmount: 0.
]

{ #category : #'as yet unclassified' }
MobileClient >> sendTextMessage:aMessage From: aNumber ToChat: aChatId [

self whatsapp receiveTextMessage:aMessage From: aNumber ToChat: aChatId
]

{ #category : #accessing }
MobileClient >> totalAmount [
	^ totalAmount
]

{ #category : #accessing }
MobileClient >> totalAmount: anObject [
	totalAmount := anObject
]

{ #category : #accessing }
MobileClient >> whatsapp [
	^ whatsapp
]

{ #category : #accessing }
MobileClient >> whatsapp: anObject [
	whatsapp := anObject
]
