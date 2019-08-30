Class {
	#name : #GroupComponent,
	#superclass : #ChatComponent,
	#instVars : [
		'contacts'
	],
	#category : #'whatsApp-UI'
}

{ #category : #accessing }
GroupComponent >> contacts [
	^ contacts
]

{ #category : #accessing }
GroupComponent >> contacts: anObject [
	contacts := anObject
]

{ #category : #rendering }
GroupComponent >> nameSender: aMessage [

|aContactName|

(aMessage sender number = self user number)
	ifTrue: [ ^ 'Yo: ' ]
	ifFalse: [ aContactName:=self user getContactName: aMessage sender number.
				  (aContactName isNil)ifTrue: [ ^  aMessage sender number, ': '  ] 
											ifFalse: [^ aContactName , ': ' ]].
]

{ #category : #rendering }
GroupComponent >> renderContentOn: html [

html strong: ('Grupo ' , self chat name);
	  break; break.
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
			  tableRow: [self renderButtonsOn: html	].					
		].	
	].
].		
	
]
