Class {
	#name : #AdvancedChatComponent,
	#superclass : #ChatComponent,
	#category : #'whatsApp-UI'
}

{ #category : #'as yet unclassified' }
AdvancedChatComponent >> attachAudio [

(self chat isNotNil)ifTrue:[
	self user sendAudio:  #audioPng ToChat: self chat id. 
	].
]

{ #category : #'as yet unclassified' }
AdvancedChatComponent >> receiveFile: aFile [
		
	 WhatsAppFileLibrary addFileNamed: aFile fileName contents: aFile rawContents.	
	 self user sendPhoto: (WhatsAppFileLibrary asSelector: aFile fileName) ToChat: self chat id.
]

{ #category : #rendering }
AdvancedChatComponent >> renderContentOn: html [

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
	].
html form multipart; with: [
        html fileUpload
            callback: [ :value | self receiveFile: value ].
		  html break.	
        html submitButton 
				with: 'Enviar foto'.
			 ].
	].
]

{ #category : #rendering }
AdvancedChatComponent >> renderMessageInputOn: html [

html tableData: [html text: 'Nuevo mensaje: '];
	  						tableData: [html textInput on: #newMessageText of: self ].
html break.
html tableRow: [  			
			html text: 'Adjuntar: '.       	
      		html select 
				selected: '';
				dispatchCallback;
       		with:[ 			
					html option
					 	label: '';              
						callback: [  ].            		     
    				html option
					 	label: 'Audio';              
						callback: [ self attachAudio ].
               		     ].					       				
		].
]
