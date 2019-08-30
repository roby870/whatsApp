Class {
	#name : #Chat,
	#superclass : #Object,
	#instVars : [
		'messages',
		'users',
		'usersTimestamps'
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
Chat >> addInSingleton [

Server singleton addChat: self.
]

{ #category : #adding }
Chat >> addMessage: aMessage [

self messages add: aMessage 
]

{ #category : #initialization }
Chat >> initializeWithUsers: someUsers [

"usersTimestamps es una coleccion con tuplas (implementadas en forma de arreglos) que contienen
desde qué fecha se deben mostrar los mensajes del chat al usuario. Esta se actualizará cada vez 
que el usuario borre el chat."
self users: OrderedCollection new.
self usersTimestamps: OrderedCollection new.
someUsers do: [ :u | self users add: u. self usersTimestamps add: (Array with: u with: DateAndTime now ) ].
self messages: OrderedCollection new.
self addInSingleton.
]

{ #category : #accessing }
Chat >> messages [
	^ messages
]

{ #category : #accessing }
Chat >> messages: anObject [
	messages := anObject
]

{ #category : #'as yet unclassified' }
Chat >> tupleUserTimestamp: aUser [

^ self usersTimestamps detect: [ :aUserTimestamp | aUserTimestamp includes: aUser  ].
]

{ #category : #'as yet unclassified' }
Chat >> updateUserTimestamp: aUser [

(self tupleUserTimestamp: aUser) at: 2 put: DateAndTime now.
]

{ #category : #accessing }
Chat >> userTimestamp: aUser [


^ (self tupleUserTimestamp: aUser) at: 2.

]

{ #category : #accessing }
Chat >> users [
	^ users
]

{ #category : #accessing }
Chat >> users: anObject [
	users := anObject
]

{ #category : #accessing }
Chat >> usersTimestamps [
	^ usersTimestamps
]

{ #category : #accessing }
Chat >> usersTimestamps: anObject [
	usersTimestamps := anObject
]
