Class {
	#name : #WhatsAppNotification,
	#superclass : #Object,
	#instVars : [
		'message',
		'read',
		'user'
	],
	#category : #'whatsApp-Model'
}

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
WhatsAppNotification >> user [
	^ user
]

{ #category : #accessing }
WhatsAppNotification >> user: anObject [
	user := anObject
]
