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

{ #category : #adding }
Server >> addChat: aChat [

self chats add: aChat.
]

{ #category : #adding }
Server >> addUser: aUser [

self users add: aUser.
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

	self users detect: [ :user | user number = aNumber ] ifFound: [ ^ true ] ifNone: [ ^ false ]. 
]

{ #category : #'as yet unclassified' }
Server >> getChatFrom: aUser And: anotherUser [

^ self chats detect: [ :chat | (chat users includes: aUser) & (chat users includes: anotherUser) ]
				ifNone: [ nil ].
]

{ #category : #'as yet unclassified' }
Server >> getChats: aUser [

^ self chats collect: [ :c | c users includes: aUser ]
]

{ #category : #'as yet unclassified' }
Server >> getUserByNumber: aNumber [
	"chequea si el numero de telefono ya se encuentra registrado en el servidor y retorna el usuario correspondiente o nil si no existe"

^	self users detect: [ :user | user number = aNumber ] ifNone: [ ^ nil ]. 
]

{ #category : #initialization }
Server >> initialize [ 
	
	self calls: OrderedCollection new.
	self chats: OrderedCollection new.
	self users: OrderedCollection new.
]

{ #category : #'as yet unclassified' }
Server >> sendWithChat: aChat AndMessage: aWhatsAppMessage [

aChat addMessage: aWhatsAppMessage 

]

{ #category : #accessing }
Server >> users [
	^ users
]

{ #category : #accessing }
Server >> users: anObject [
	users := anObject
]
