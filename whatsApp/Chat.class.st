Class {
	#name : #Chat,
	#superclass : #Object,
	#instVars : [
		'messages',
		'users'
	],
	#category : #'whatsApp-Model'
}

{ #category : #'instance creation' }
Chat class >> newWithUsers: someUsers [ 

	^ self new
	initializeWithUsers: someUsers;
	yourself
]

{ #category : #adding }
Chat >> addMessage: aMessage [

self messages add: aMessage 
]

{ #category : #initialization }
Chat >> initializeWithUsers: someUsers [

self users: (Array with: (someUsers at: 1) with: (someUsers at: 2)).
Server singleton addChat: self.
]

{ #category : #accessing }
Chat >> messages [
	^ messages
]

{ #category : #accessing }
Chat >> messages: anObject [
	messages := anObject
]

{ #category : #accessing }
Chat >> users [
	^ users
]

{ #category : #accessing }
Chat >> users: anObject [
	users := anObject
]
