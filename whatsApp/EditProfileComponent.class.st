Class {
	#name : #EditProfileComponent,
	#superclass : #WAComponent,
	#instVars : [
		'user'
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

self user: aUser
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

    html form multipart; with: [
        html fileUpload
            callback: [ :value | self receiveFile: value ].
		  html break.
		
        html submitButton 
				class: 'editProfile';
				with: 'Guardar foto de perfil'
			
			. ].
	 
	 html form: [ 
		html submitButton
    			callback: [self answer: false];
    			value: 'Volver'.
			].
		 
	
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

{ #category : #accessing }
EditProfileComponent >> user [
	^ user
]

{ #category : #accessing }
EditProfileComponent >> user: anObject [
	user := anObject
]
