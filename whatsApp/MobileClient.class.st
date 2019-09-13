Class {
	#name : #MobileClient,
	#superclass : #Object,
	#instVars : [
		'clientNumber',
		'whatsapp',
		'totalAmount',
		'smartphone',
		'mobileclients'
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
MobileClient >> callNumber: aNumber [

^ (self mobileclients detect: [ :mobileclient | mobileclient smartphone number = aNumber ])
	smartphone incomingCall: self smartphone number
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
self mobileclients: OrderedCollection new.
]

{ #category : #accessing }
MobileClient >> mobileclients [
	^ mobileclients
]

{ #category : #accessing }
MobileClient >> mobileclients: anObject [
	mobileclients := anObject
]

{ #category : #'as yet unclassified' }
MobileClient >> sendEmoji:aContent From: aNumber ToChat: aChatId [

self whatsapp receiveEmoji:aContent From: aNumber ToChat: aChatId
]

{ #category : #'as yet unclassified' }
MobileClient >> sendTextMessage:aMessage From: aNumber ToChat: aChatId [

self whatsapp receiveTextMessage:aMessage From: aNumber ToChat: aChatId
]

{ #category : #accessing }
MobileClient >> smartphone [
	^ smartphone
]

{ #category : #accessing }
MobileClient >> smartphone: anObject [
	smartphone := anObject
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
