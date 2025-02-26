Class {
	#name : #EditProfileComponent,
	#superclass : #WAComponent,
	#instVars : [
		'user',
		'status'
	],
	#category : #'whatsApp-UI'
}

{ #category : #'instance creation' }
EditProfileComponent class >> newWith: aUser [

^ self new
  initializeWith: aUser;
	yourself
]

{ #category : #initialization }
EditProfileComponent >> initializeWith: aUser [

self user: aUser.
self status: aUser status.
]

{ #category : #'as yet unclassified' }
EditProfileComponent >> receiveFile: aFile [
		
	 WhatsAppFileLibrary addFileNamed: aFile fileName contents: aFile rawContents.	
    self user photo: (WhatsAppFileLibrary asSelector: aFile fileName).
    
	 self answer: true.
    
]

{ #category : #rendering }
EditProfileComponent >> renderContentOn: html [
	
	html heading 
		level: 2;
		with: 'Editar perfil'.
	html heading 
		level: 3;
		with: 'Foto de perfil:'.
	self renderUserPhotoOn: html.
    html form multipart; with: [
        html fileUpload
            callback: [ :value | self receiveFile: value ].
		  html break.	
        html submitButton 
				with: 'Guardar foto de perfil'.
			 ].
		
	html heading 
		level: 3;
		with: 'Estado:'. 
	html form: [    
		html table: [    
			html
    		  tableRow: [html tableData: [html text: 'Estado: '];
	  								tableData: [html textInput on: #status of: self ]];
			  tableRow: [html tableData:	[html submitButton
    													callback: [
															self updateStatus.];
															value: 'Guardar estado'.
												]
							].
						]
					].
	 html form: [ 
		html submitButton
    			callback: [self answer: false];
    			value: 'Volver'.
			].
		 
	
]

{ #category : #rendering }
EditProfileComponent >> renderUserPhotoOn: html [

(self user photo isNil)
	ifTrue: [ html image url: (WhatsAppFileLibrary urlOf: #blankPng);
		           height: 50;
					  width: 50. ] 
	ifFalse: [  
		html image url: (WhatsAppFileLibrary urlOf: self user photo);
		     height: 50;
			  width: 50. ].
]

{ #category : #accessing }
EditProfileComponent >> status [
	^ status
]

{ #category : #accessing }
EditProfileComponent >> status: anObject [
	status := anObject
]

{ #category : #hooks }
EditProfileComponent >> style [ 


^ 'input {  border: 2px solid MediumSeaGreen;
  				border-radius: 12px;								
				margin-top: 10px;
  				margin-bottom: 10px;
  				margin-right: 10px;
  				margin-left: 10px;
								 }'
]

{ #category : #rendering }
EditProfileComponent >> updateStatus [

self user status: self status.
self answer: true.

]

{ #category : #accessing }
EditProfileComponent >> user [
	^ user
]

{ #category : #accessing }
EditProfileComponent >> user: anObject [
	user := anObject
]
