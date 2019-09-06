Class {
	#name : #AddMemberComponent,
	#superclass : #ManageMembersComponent,
	#instVars : [
		'oldMembers'
	],
	#category : #'whatsApp-UI'
}

{ #category : #'as yet unclassified' }
AddMemberComponent >> broadcastMemberAdded: aMember [


aMember addNotification: (WhatsAppNotification newWithMessage: 'Te agregaron al grupo ', self group name).
self oldMembers do: [ :user | (user ~= aMember) ifTrue: [user addNotification: (WhatsAppNotification newWithMessage: 'El usuario con numero ', aMember number, ' fue agregado al grupo ', self group name) ]].
]

{ #category : #accessing }
AddMemberComponent >> filter [

self contactsList 
	filterBlock: [ :items | items select: [:contact | contact blocked not ] ]
]

{ #category : #initialization }
AddMemberComponent >> initializeContacts: aGroup [

self contacts: (aGroup admin contacts select: [:c | (aGroup isIn: c user) not ]) .
self oldMembers: aGroup users copy.
]

{ #category : #accessing }
AddMemberComponent >> oldMembers [
	^ oldMembers
]

{ #category : #accessing }
AddMemberComponent >> oldMembers: anObject [
	oldMembers := anObject
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
     	       onTrue: [ self broadcastMemberAdded: aMember user. self group addMember: aMember user]
				 onFalse: [ ]  ].
        html break.
]

{ #category : #sorting }
AddMemberComponent >> sortMethod [ 

self contactsList
  sortBlock: [:items |
   items sort: [:a :b | a name < b name ]].
]
