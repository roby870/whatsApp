Class {
	#name : #Server,
	#superclass : #Object,
	#instVars : [
		'users',
		'chats',
		'calls'
	],
	#classInstVars : [
		'singleton'
	],
	#category : #'whatsApp-Model'
}

{ #category : #accessing }
Server class >> singleton [
	^singleton ifNil: [ singleton := self new ]
]

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

{ #category : #'as yet unclassified' }
Server >> existsNumber: aNumber [
	"chequea si el numero de telefono ya se encuentra registrado en el servidor"

	self users detect: [ :user | user number == aNumber ] ifFound: [ ^ true ] ifNone: [ ^ false ]. 
]

{ #category : #initialization }
Server >> initialize [ 
	
	self calls: OrderedCollection new.
	self chats: OrderedCollection new.
	self users: OrderedCollection new.
]

{ #category : #accessing }
Server >> users [
	^ users
]

{ #category : #accessing }
Server >> users: anObject [
	users := anObject
]
