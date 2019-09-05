Class {
	#name : #WhatsAppNotification,
	#superclass : #Object,
	#instVars : [
		'message',
		'read',
		'timestamp'
	],
	#category : #'whatsApp-Model'
}

{ #category : #'instance creation' }
WhatsAppNotification class >> newWithMessage: aMessage [
	
^ self new
initializeWithMessage: aMessage;
yourself 
]

{ #category : #initialization }
WhatsAppNotification >> initializeWithMessage: aMessage [

self message: aMessage.
self read: false.
self timestamp: DateAndTime now.
]

{ #category : #'as yet unclassified' }
WhatsAppNotification >> markAsRead [

self read: true.
]

{ #category : #accessing }
WhatsAppNotification >> message [
	^ message
]

{ #category : #accessing }
WhatsAppNotification >> message: anObject [
	message := anObject
]

{ #category : #accessing }
WhatsAppNotification >> read [
	^ read
]

{ #category : #accessing }
WhatsAppNotification >> read: anObject [
	read := anObject
]

{ #category : #accessing }
WhatsAppNotification >> timestamp [
	^ timestamp
]

{ #category : #accessing }
WhatsAppNotification >> timestamp: anObject [
	timestamp := anObject
]
