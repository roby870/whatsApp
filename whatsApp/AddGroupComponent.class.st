Class {
	#name : #AddGroupComponent,
	#superclass : #WAComponent,
	#instVars : [
		'admin',
		'contacts',
		'members',
		'contactsList',
		'name'
	],
	#category : #'whatsApp-UI'
}

{ #category : #'instance creation' }
AddGroupComponent class >> newWithAdmin: aUser [

^ self new 
initializeWithAdmin: aUser;
yourself.
]

{ #category : #accessing }
AddGroupComponent >> admin [
	^ admin
]

{ #category : #accessing }
AddGroupComponent >> admin: anObject [
	admin := anObject
]

{ #category : #accessing }
AddGroupComponent >> contacts [
	^ contacts
]

{ #category : #accessing }
AddGroupComponent >> contacts: anObject [
	contacts := anObject
]

{ #category : #accessing }
AddGroupComponent >> contactsList [
	^ contactsList
]

{ #category : #accessing }
AddGroupComponent >> contactsList: anObject [
	contactsList := anObject
]

{ #category : #contactListFilters }
AddGroupComponent >> filterBlocked [

self contactsList 
	filterBlock: [ :items | items select: [:contact | contact blocked not ] ]
]

{ #category : #initialization }
AddGroupComponent >> initializeContactsList [

 self contactsList: ListComponent new.
 self contactsList
  sortBlock: [:items |
   items sort: [:a :b | a name < b name ]];
  renderItemBlock: [:contact :html |
   self renderContact: contact asRowOn: html].
 self filterBlocked.
self contactsList items: self admin contacts.
]

{ #category : #initialization }
AddGroupComponent >> initializeWithAdmin: aUser [

self admin: aUser.
self members: OrderedCollection new.
self contacts: aUser contacts.
self initializeContactsList.
]

{ #category : #accessing }
AddGroupComponent >> members [
	^ members
]

{ #category : #accessing }
AddGroupComponent >> members: anObject [
	members := anObject
]

{ #category : #accessing }
AddGroupComponent >> name [
	^ name
]

{ #category : #accessing }
AddGroupComponent >> name: anObject [
	name := anObject
]

{ #category : #rendering }
AddGroupComponent >> renderContact: aContact asRowOn: html [
html tableData: [ 
	(html text: aContact name, '  ').
 	       html checkbox 
   		       value: false;
     	       onTrue: [ self members add: aContact user]
				 onFalse: [ ]  ].
        html break.


"html select 
  	          list: #(#Si #No);
   		       selected: #No;
     	       callback: [ :value |
                	value = #Si
                   ifTrue: [ self members add: aContact user ]
                    ]."
]

{ #category : #rendering }
AddGroupComponent >> renderContentOn: html [
 		
		html strong: 'Seleccione los contactos que desea agregar al grupo'.
		html form: [  			
 			html div
  				class: 'list';
  				with: self contactsList.
			html break.
			html text: 'Nombre del grupo: '.
	 		html textInput on: #name of: self.
			html break.
			html submitButton on: #save of: self;
								   with: 'Crear grupo'.
			html text: '   '.
			html submitButton callback: [self answer: false];
    								value: 'Volver'.				
			].		
		
	
		
]

{ #category : #save }
AddGroupComponent >> save [ 

Group newWithUsers: self members Admin: self admin AndName: self name. 
self answer: true.
]
