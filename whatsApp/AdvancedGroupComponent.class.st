Class {
	#name : #AdvancedGroupComponent,
	#superclass : #GroupComponent,
	#category : #'whatsApp-UI'
}

{ #category : #'as yet unclassified' }
AdvancedGroupComponent >> attachAudio [

(self chat isNotNil)ifTrue:[
	self user sendAudio:  #audioPng ToChat: self chat id. 
	].
]

{ #category : #'as yet unclassified' }
AdvancedGroupComponent >> attachDocument [

(self chat isNotNil)ifTrue:[
	self user sendAudio:  #documentPng ToChat: self chat id. 
	].
]

{ #category : #'as yet unclassified' }
AdvancedGroupComponent >> attachLocation [

(self chat isNotNil)ifTrue:[
	self user sendLocation:  #locationPng ToChat: self chat id. 
	].
]

{ #category : #'as yet unclassified' }
AdvancedGroupComponent >> attachVideo [

(self chat isNotNil)ifTrue:[
	self user sendVideo:  #videoPng ToChat: self chat id. 
	].
]

{ #category : #'as yet unclassified' }
AdvancedGroupComponent >> receiveFile: aFile [
		
	 WhatsAppFileLibrary addFileNamed: aFile fileName contents: aFile rawContents.	
	 self user sendPhoto: (WhatsAppFileLibrary asSelector: aFile fileName) ToChat: self chat id.
]

{ #category : #rendering }
AdvancedGroupComponent >> renderContentOn: html [

html strong: ('Grupo ' , self chat name);
	  break; break.
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
AdvancedGroupComponent >> renderMessageInputOn: html [

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
               	html option
					 	label: 'Documento';              
						callback: [ self attachDocument ].
					html option
					 	label: 'Video';              
						callback: [ self attachVideo ].
					html option
					 	label: 'Ubicación';              
						callback: [ self attachLocation ].	
               		     ].		
			     ].					       
	
]
