Class {
	#name : #ChatComponent,
	#superclass : #WAComponent,
	#instVars : [
		'user',
		'contact',
		'chat',
		'messages',
		'messagesList',
		'newMessageText'
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

{ #category : #accessing }
ChatComponent >> contact [
	^ contact
]

{ #category : #accessing }
ChatComponent >> contact: anObject [
	contact := anObject
]

{ #category : #'as yet unclassified' }
ChatComponent >> deleteChat [

self chat updateUserTimestamp: self user.
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
ChatComponent >> nameSender: aMessage [

(aMessage sender number = self user number)
	ifTrue: [ ^ 'Yo: ' ]
	ifFalse: [ ^ self contact name, ': ' ].
]

{ #category : #accessing }
ChatComponent >> newMessageText [
	^ newMessageText
]

{ #category : #accessing }
ChatComponent >> newMessageText: anObject [
	newMessageText := anObject
]

{ #category : #rendering }
ChatComponent >> renderButtonsOn: html [

html tableData:	[html submitButton
    						callback: [self sendNewMessageText];
							value: 'Enviar'.
					html break.
					html submitButton
    						callback: [self deleteChat ];
							value: 'Borrar chat'.
					]
]

{ #category : #rendering }
ChatComponent >> renderContentOn: html [
(self contact isNotNil)ifTrue:[

html strong: ('Chat con ' , self contact name);
	  break.
	].
html div
  			class: 'messageslist';
  			with: self messagesList. 
html div
  			class: 'newTextMessage';
			with: [  
html form: [
	html table: [
		html	 
			  tableRow: [self renderMessageInputOn: html];
			  break;
			  tableRow: [self renderButtonsOn: html	].					
		].	
	].		
	].
]

{ #category : #rendering }
ChatComponent >> renderMessage: message asRowOn: html [

html
	tableData: (self nameSender: message);
	tableData: message content.
	
]

{ #category : #rendering }
ChatComponent >> renderMessageInputOn: html [

html tableData: [html text: 'Nuevo mensaje: '];
	  						tableData: [html textInput on: #newMessageText of: self ]
]

{ #category : #'as yet unclassified' }
ChatComponent >> sendNewMessageText [

|aWhatsAppText|
(self chat isNotNil)ifTrue:[
	aWhatsAppText:=WhatsAppText newWithContent: self newMessageText AndSender: self user. 
	self chat addMessage: aWhatsAppText.
	].
self newMessageText: ''.

]

{ #category : #hooks }
ChatComponent >> style [
    ^ ' 
			body {background-color: MediumSeaGreen; }
			strong {  position: absolute;
  					top: 80px;		
					right: 240px;
					 }
			div.messageslist { 
				   position: absolute;
					top: 100px;
  					right: 60px;
					width: 400px;
  					height: 200px;
					overflow: scroll; }							

			div.newTextMessage { 	position: absolute;
										top: 350px;
  										right: 135px;
									 }
			'
					
			
			
				
]

{ #category : #accessing }
ChatComponent >> user [
	^ user
]

{ #category : #accessing }
ChatComponent >> user: anObject [
	user := anObject
]
