Class {
	#name : #AddMemberComponent,
	#superclass : #ManageMembersComponent,
	#category : #'whatsApp-UI'
}

{ #category : #accessing }
AddMemberComponent >> filter [

self contactsList 
	filterBlock: [ :items | items select: [:contact | contact blocked not ] ]
]

{ #category : #initialization }
AddMemberComponent >> initializeContacts: aGroup [

self contacts: (aGroup admin contacts select: [:c | (aGroup isIn: c user) not ]) .
]

{ #category : #rendering }
AddMemberComponent >> renderContentOn: html [

		html heading: 'Agregar miembro al grupo ', self group name.
		html strong: 'Seleccione los contactos que desea agregar al grupo'.
		html form: [  			
 			html div
  				class: 'list';
  				with: self contactsList.
			html break.
			html submitButton on: #save of: self;
								   with: 'Agregar'.			
			].	
		html form: [ 
			html submitButton callback: [self answer: false];
    								value: 'Volver'.				
			 ]. 
]

{ #category : #rendering }
AddMemberComponent >> renderMember: aMember asRowOn: html [
html tableData: [ 
	(html text: aMember name, '  ').
 	       html checkbox 
   		       value: false;
     	       onTrue: [ self group addMember: aMember user]
				 onFalse: [ ]  ].
        html break.
]

{ #category : #sorting }
AddMemberComponent >> sortMethod [ 

self contactsList
  sortBlock: [:items |
   items sort: [:a :b | a name < b name ]].
]
