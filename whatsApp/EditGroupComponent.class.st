Class {
	#name : #EditGroupComponent,
	#superclass : #WAComponent,
	#instVars : [
		'group',
		'name'
	],
	#category : #'whatsApp-UI'
}

{ #category : #'instance creation' }
EditGroupComponent class >> newWith: aGroup [

^ self new
  initializeWith: aGroup;
	yourself
]

{ #category : #accessing }
EditGroupComponent >> group [
	^ group
]

{ #category : #accessing }
EditGroupComponent >> group: anObject [
	group := anObject
]

{ #category : #initialization }
EditGroupComponent >> initializeWith: aGroup [

self group: aGroup.
self name: aGroup name.
]

{ #category : #accessing }
EditGroupComponent >> name [
	^ name
]

{ #category : #accessing }
EditGroupComponent >> name: anObject [
	name := anObject
]

{ #category : #'as yet unclassified' }
EditGroupComponent >> receiveFile: aFile [
		
	 WhatsAppFileLibrary addFileNamed: aFile fileName contents: aFile rawContents.	
    self group photo: (WhatsAppFileLibrary asSelector: aFile fileName).
    self group broadcastPhotoChange.
	 self answer: true.
]

{ #category : #rendering }
EditGroupComponent >> renderContentOn: html [
	
	html heading 
		level: 2;
		with: 'Editar perfil del grupo ', self group name.
	html heading 
		level: 3;
		with: 'Foto de perfil:'.
	self renderGroupPhotoOn: html.
    html form multipart; with: [
        html fileUpload
            callback: [ :value | self receiveFile: value ].
		  html break.	
        html submitButton 
				with: 'Guardar foto de perfil'.
			 ].
		
	html heading 
		level: 3;
		with: 'Nombre del grupo:'. 
	html form: [    
		html table: [    
			html
    		  tableRow: [html tableData: [html text: 'Nombre: '];
	  								tableData: [html textInput on: #name of: self ]];
			  tableRow: [html tableData:	[html submitButton
    													callback: [
															self updateName.];
															value: 'Guardar nombre'.
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
EditGroupComponent >> renderGroupPhotoOn: html [

(self group photo isNil)
	ifTrue: [ html image url: (WhatsAppFileLibrary urlOf: #blankPng);
		           height: 50;
					  width: 50. ] 
	ifFalse: [  
		html image url: (WhatsAppFileLibrary urlOf: self group photo);
		     height: 50;
			  width: 50. ].
]

{ #category : #hooks }
EditGroupComponent >> style [ 


^ 'input {  border: 2px solid MediumSeaGreen;
  				border-radius: 12px;								
				margin-top: 10px;
  				margin-bottom: 10px;
  				margin-right: 10px;
  				margin-left: 10px;
								 }'
]

{ #category : #'as yet unclassified' }
EditGroupComponent >> updateName [
|oldName|

oldName:=self group name.
self group name: self name.
self group broadcastNameChange: oldName.
self answer: true.
]
