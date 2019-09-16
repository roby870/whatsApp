Class {
	#name : #Server,
	#superclass : #Object,
	#instVars : [
		'users',
		'chats',
		'calls',
		'groups'
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
Server class >> singleton: anObject [
	singleton := anObject
]

{ #category : #adding }
Server >> addCall: aCall [

self calls add: aCall.
]

{ #category : #adding }
Server >> addChat: aChat [

self chats add: aChat.
]

{ #category : #adding }
Server >> addGroup: aGroup [

self groups add: aGroup.
]

{ #category : #adding }
Server >> addUser: aUser [

self users add: aUser.
]

{ #category : #'as yet unclassified' }
Server >> callWithCaller: aCaller AndReceiver: aReceiver [

|aCall|

aCall:= Call newWithCaller: aCaller AndReceiver: aReceiver.
self addCall: aCall.
^ aCall
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
Server >> getChatById: aNumber [
	"chequea si el id del chat ya se encuentra registrado en el servidor y retorna el chat correspondiente o nil si no existe"

^	self chats detect: [ :chat | chat id = aNumber ] ifNone: [ self groups detect: [ :group | group id = aNumber ] ]. 
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
Server >> getGroups: aUser [

^ self groups select: [ :g | (g users includes: aUser) | (g admin = aUser)  ]
]

{ #category : #'as yet unclassified' }
Server >> getIncomingCall: aUser [

^ self calls detect: [:call | call receiver = aUser number & call isWaiting ] 
			  ifNone: [ ^ nil ].
]

{ #category : #'as yet unclassified' }
Server >> getUserByNumber: aNumber [
	"chequea si el numero de telefono ya se encuentra registrado en el servidor y retorna el usuario correspondiente o nil si no existe"

^	self users detect: [ :user | user number = aNumber ] ifNone: [ ^ nil ]. 
]

{ #category : #accessing }
Server >> groups [
	^ groups
]

{ #category : #accessing }
Server >> groups: anObject [
	groups := anObject
]

{ #category : #initialization }
Server >> initialize [ 
	
	self calls: OrderedCollection new.
	self chats: OrderedCollection new.
	self users: OrderedCollection new.
	self groups: OrderedCollection new.
]

{ #category : #'as yet unclassified' }
Server >> receiveAudio:aContent From: aNumber ToChat: aChatId [

|chat user|

user:=self getUserByNumber: aNumber.
chat:= self getChatById: aChatId.
chat addMessage: (Audio newWithContent: aContent AndSender: user).
]

{ #category : #'as yet unclassified' }
Server >> receiveEmoji:aContent From: aNumber ToChat: aChatId [

|chat user|

user:=self getUserByNumber: aNumber.
chat:= self getChatById: aChatId.
chat addMessage: (Emoji newWithContent: aContent AndSender: user).
]

{ #category : #'as yet unclassified' }
Server >> receivePhoto:aContent From: aNumber ToChat: aChatId [

|chat user|

user:=self getUserByNumber: aNumber.
chat:= self getChatById: aChatId.
chat addMessage: (Photo newWithContent: aContent AndSender: user).
]

{ #category : #'as yet unclassified' }
Server >> receiveTextMessage:aMessage From: aNumber ToChat: aChatId [

|chat user|

user:=self getUserByNumber: aNumber.
chat:= self getChatById: aChatId.
chat addMessage: (WhatsAppText newWithContent: aMessage AndSender: user).
]

{ #category : #accessing }
Server >> users [
	^ users
]

{ #category : #accessing }
Server >> users: anObject [
	users := anObject
]
