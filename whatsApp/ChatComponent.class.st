Class {
	#name : #ChatComponent,
	#superclass : #WAComponent,
	#instVars : [
		'user',
		'chat',
		'messages',
		'messagesList'
	],
	#category : #'whatsApp-UI'
}

{ #category : #'instance creation' }
ChatComponent class >> newWithUser: aUser [

^ self new
initializeWith: aUser;
yourself 
]

{ #category : #accessing }
ChatComponent >> chat [
	^ chat
]

{ #category : #accessing }
ChatComponent >> chat: anObject [
	chat := anObject
]

{ #category : #initialization }
ChatComponent >> initializeMessagesList [

 self messagesList: ListComponent new.
 self messagesList
  sortBlock: [:items |
   items sort: [:a :b | a timestamp < b timestamp ]];
  renderItemBlock: [:message :html |
   self renderMessage: message asRowOn: html].
self messagesList 
	filterBlock: [ :items | items select: [:message | message timestamp > (self chat userTimestamp: self user) ] ].
self messagesList items: self messages.
]

{ #category : #initialization }
ChatComponent >> initializeWith: aUser [

self user: aUser.
]

{ #category : #accessing }
ChatComponent >> messages [
	^ messages
]

{ #category : #accessing }
ChatComponent >> messages: anObject [
	messages := anObject
]

{ #category : #accessing }
ChatComponent >> messagesList [
	^ messagesList
]

{ #category : #accessing }
ChatComponent >> messagesList: anObject [
	messagesList := anObject
]

{ #category : #rendering }
ChatComponent >> renderContentOn: html [
html div
  			class: 'list';
  			with: self messagesList.
]

{ #category : #rendering }
ChatComponent >> renderMessage: message asRowOn: html [

html tableData: [html
	tableData: message sender number;
	tableData: message content.
	
	  ].
]

{ #category : #accessing }
ChatComponent >> user [
	^ user
]

{ #category : #accessing }
ChatComponent >> user: anObject [
	user := anObject
]
