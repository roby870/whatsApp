Class {
	#name : #ChatComponent,
	#superclass : #WAComponent,
	#instVars : [
		'messages'
	],
	#category : #'whatsApp-UI'
}

{ #category : #'instance creation' }
ChatComponent class >> newWith: aChat [

^ self new
initializeWith: aChat;
yourself 
]

{ #category : #initialization }
ChatComponent >> initializeWith: aChat [

self messages: aChat messages.
]

{ #category : #accessing }
ChatComponent >> messages [
	^ messages
]

{ #category : #accessing }
ChatComponent >> messages: anObject [
	messages := anObject
]
