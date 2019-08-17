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
Chat >> addMessage: aMessage [

self messages add: aMessage 
]

{ #category : #initialization }
Chat >> initializeWithUsers: someUsers [

"usersTimestamps es una coleccion con tuplas (implementadas en forma de arreglos) que contienen
desde qué fecha se deben mostrar los mensajes del chat al usuario. Está se actualizará cada vez 
que el usuario borre el chat."

self users: (Array with: (someUsers at: 1) with: (someUsers at: 2)).
self usersTimestamps: OrderedCollection new.
self usersTimestamps add: (Array with: (someUsers at: 1) with: DateAndTime now ).
self usersTimestamps add: (Array with: (someUsers at: 2) with: DateAndTime now ).
self messages: OrderedCollection new.
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
Chat >> userTimestamp: aUser [

|userTimestamp|
userTimestamp:=self usersTimestamps detect: [ :aUserTimestamp | aUserTimestamp includes: aUser  ].
^ userTimestamp at: 2.

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
