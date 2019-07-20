Class {
	#name : #User,
	#superclass : #Object,
	#instVars : [
		'number',
		'photo',
		'status',
		'contacts',
		'server',
		'notifications'
	],
	#category : #'whatsApp-Model'
}

{ #category : #'instance creation' }
User class >> newWithNumber: aNumber [
	
	"retorna un nuevo usuario con numero aNumber o nil si el numero aNumber ya existe"
	
	(Server singleton existsNumber: aNumber)
	ifTrue: [ ^nil ]
	ifFalse: [  
	^ self new
	initializeWithNumber: aNumber;
	yourself
	].
]

{ #category : #accessing }
User >> contacts [
	^ contacts
]

{ #category : #accessing }
User >> contacts: anObject [
	contacts := anObject
]

{ #category : #initialization }
User >> initializeWithNumber: aNumber [

self number: aNumber
]

{ #category : #accessing }
User >> notifications [
	^ notifications
]

{ #category : #accessing }
User >> notifications: anObject [
	notifications := anObject
]

{ #category : #accessing }
User >> number [
	^ number
]

{ #category : #accessing }
User >> number: anObject [
	number := anObject
]

{ #category : #accessing }
User >> photo [
	^ photo
]

{ #category : #accessing }
User >> photo: anObject [
	photo := anObject
]

{ #category : #accessing }
User >> server [
	^ server
]

{ #category : #accessing }
User >> server: anObject [
	server := anObject
]

{ #category : #accessing }
User >> status [
	^ status
]

{ #category : #accessing }
User >> status: anObject [
	status := anObject
]
