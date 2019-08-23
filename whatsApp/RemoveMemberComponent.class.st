"
en esta sublcase la variable de instancia ""contacts"" hace referencia a todos los miembros del grupo, sean contactos del admin o no. Si bien el admin solamente puede crear un grupo con sus contactos, luego podria borrar algunos de esos contactos de su agenda pero seguirian siendo parte del grupo. 
"
Class {
	#name : #RemoveMemberComponent,
	#superclass : #ManageMembersComponent,
	#category : #'whatsApp-UI'
}

{ #category : #'instance creation' }
RemoveMemberComponent class >> newWithGroup: aGroup [

^ self new 
initializeWithGroup: aGroup;
yourself.
]

{ #category : #accessing }
RemoveMemberComponent >> filter [ 

self contactsList 
	filterBlock: [ :items | items  ]
]

{ #category : #initialization }
RemoveMemberComponent >> initializeContacts: aGroup [

self contacts: aGroup users.
]

{ #category : #rendering }
RemoveMemberComponent >> renderContentOn: html [

		html heading: 'Borrar miembros del grupo ', self group name.
		html strong: 'Seleccione los miembros del grupo que desea borrar'.
		html form: [  			
 			html div
  				class: 'list';
  				with: self contactsList.
			html break.
			html submitButton on: #save of: self;
								   with: 'Borrar'.
			html text: '   '.
			html submitButton callback: [self answer: false];
    								value: 'Volver'.				
			].	
]

{ #category : #rendering }
RemoveMemberComponent >> renderMember: aMember asRowOn: html [

|name|

name:=self group admin getContactName: aMember number.
name isNil ifTrue: [html tableData: aMember number] ifFalse: [html tableData: name].

html tableData: [ 
			
			html text: '  '.
 	       html checkbox 
   		       value: false;
     	       onTrue: [ self group removeMember: aMember ]
				 onFalse: [ ]  ].
        html break.
]

{ #category : #sorting }
RemoveMemberComponent >> sortMethod [ 

self contactsList
  sortBlock: [:items |
   items sort: [:a :b | a number < b number ]].
]
