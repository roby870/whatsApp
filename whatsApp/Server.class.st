Class {
	#name : #Server,
	#superclass : #Object,
	#instVars : [
		'users',
		'chats',
		'calls'
	],
	#category : #whatsApp
}

{ #category : #accessing }
Server >> calls [
	^ calls
]

{ #category : #accessing }
Server >> calls: anObject [
	calls := anObject
]

{ #category : #accessing }
Server >> chats [
	^ chats
]

{ #category : #accessing }
Server >> chats: anObject [
	chats := anObject
]

{ #category : #accessing }
Server >> users [
	^ users
]

{ #category : #accessing }
Server >> users: anObject [
	users := anObject
]
