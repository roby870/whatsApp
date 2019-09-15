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
self renderEmojiOn: html.  
html form: [
	html table: [
		html	 
			  tableRow: [self renderMessageInputOn: html];
			  break;
			  tableRow: [self renderButtonsOn: html	].					
		].	
	]
	].
]

{ #category : #rendering }
ChatComponent >> renderEmojiOn: html [
(self chat isNotNil)ifTrue:[
html form: [  
		html imageButton url:  (WhatsAppFileLibrary urlOf: #smilingPng);
						width: 20;
					 	height: 20;
					  callback: [ self user sendEmoji: #smilingPng ToChat: self chat id. ].
		html imageButton url:  (WhatsAppFileLibrary urlOf: #upsidedownPng);
					   width: 20;
					   height: 20;
					  callback: [ self user sendEmoji: #upsidedownPng ToChat: self chat id ].
		html imageButton url:  (WhatsAppFileLibrary urlOf: #tonguePng);
					   width: 20;
					 	height: 20;
					  callback: [ self user sendEmoji: #tonguePng ToChat: self chat id ].	
		html imageButton url:  (WhatsAppFileLibrary urlOf: #blushedPng);
					   width: 20;
					 	height: 20;
					  callback: [ self user sendEmoji: #blushedPng ToChat: self chat id. ].
		html imageButton url:  (WhatsAppFileLibrary urlOf: #flushedPng);
					   width: 20;
					 	height: 20;
					  callback: [ self user sendEmoji: #flushedPng ToChat: self chat id. ].	
		html imageButton url:  (WhatsAppFileLibrary urlOf: #unamusedPng);
						width: 20;
					 	height: 20;
					  callback: [ self user sendEmoji: #unamusedPng ToChat: self chat id ].
	 	html imageButton url:  (WhatsAppFileLibrary urlOf: #verysadPng);
					   width: 20;
					 	height: 20;
					  callback: [ self user sendEmoji: #verysadPng ToChat: self chat id. ].  
		html imageButton url:  (WhatsAppFileLibrary urlOf: #cryingPng);
					   width: 20;
					 	height: 20;
					  callback: [ self user sendEmoji: #cryingPng ToChat: self chat id. ].
		html break.
		html imageButton url:  (WhatsAppFileLibrary urlOf: #angryPng);
					   width: 20;
					   height: 20;
					  callback: [ self user sendEmoji: #angryPng ToChat: self chat id ].
		html imageButton url:  (WhatsAppFileLibrary urlOf: #thinkingPng);
					   width: 20;
					 	height: 20;
					  callback: [ self user sendEmoji: #thinkingPng ToChat: self chat id. ].
		html imageButton url:  (WhatsAppFileLibrary urlOf: #scaredPng);
					   width: 20;
					 	height: 20;
					  callback: [ self user sendEmoji: #scaredPng ToChat: self chat id. ].
		html imageButton url:  (WhatsAppFileLibrary urlOf: #neutralPng);
					   width: 20;
					 	height: 20;
					  callback: [ self user sendEmoji: #neutralPng ToChat: self chat id. ].
		html imageButton url:  (WhatsAppFileLibrary urlOf: #coolPng);
					   width: 20;
					 	height: 20;
					  callback: [ self user sendEmoji: #coolPng ToChat: self chat id. ].			
		html imageButton url:  (WhatsAppFileLibrary urlOf: #tearsofjoyPng);
					   width: 20;
					 	height: 20;
					  callback: [ self user sendEmoji: #tearsofjoyPng ToChat: self chat id. ].
		html imageButton url:  (WhatsAppFileLibrary urlOf: #expressionlessPng);
					   width: 20;
					 	height: 20;
					  callback: [ self user sendEmoji: #expressionlessPng ToChat: self chat id. ].
		html imageButton url:  (WhatsAppFileLibrary urlOf: #supersmilingPng);
					   width: 20;
					 	height: 20;
					  callback: [ self user sendEmoji: #supersmilingPng ToChat: self chat id. ].
		html break.
		html text: 'Seleccione el emoji que desea enviar'.
		] ]
]

{ #category : #rendering }
ChatComponent >> renderMessage: message asRowOn: html [

html tableData: (self nameSender: message).
	(message isText)
		ifTrue: [ html tableData: message content ].
	(message isEmoji) 
		ifTrue: [ html tableData: [html image url: (WhatsAppFileLibrary urlOf: message content); 
														  width: 20;
														  height: 20.
													] ].
	(message isText not & message isEmoji not)ifTrue: [ html tableData: [html image url: (WhatsAppFileLibrary urlOf: message content); 
														  width: 50;
														  height: 50.
													] ]
	
	
]

{ #category : #rendering }
ChatComponent >> renderMessageInputOn: html [

html tableData: [html text: 'Nuevo mensaje: '];
	  						tableData: [html textInput on: #newMessageText of: self ].

]

{ #category : #initialization }
ChatComponent >> sendNewMessageText [

(self chat isNotNil)ifTrue:[
	(self newMessageText = '')ifFalse: [  
	self user sendTextMessage: self newMessageText ToChat: self chat id]. 
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
										top: 310px;
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
