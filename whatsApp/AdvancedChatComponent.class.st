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
