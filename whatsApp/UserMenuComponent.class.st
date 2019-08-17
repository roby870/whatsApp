Class {
	#name : #UserMenuComponent,
	#superclass : #WAComponent,
	#instVars : [
		'user',
		'mainMenu',
		'addContact',
		'contactsList',
		'chat'
	],
	#category : #'whatsApp-UI'
}

{ #category : #'instance creation' }
UserMenuComponent class >> newWithUser: aUser [

^ self new
		initializeWithUser: aUser;
		yourself
]

{ #category : #accessing }
UserMenuComponent >> addContact [
	^ addContact
]

{ #category : #accessing }
UserMenuComponent >> addContact: anObject [
	addContact := anObject
]

{ #category : #calling }
UserMenuComponent >> callAddContact [

 | answer |
 answer := self call: self addContact.
 answer ifTrue: [self user addContactWithNumber:  self addContact number AndName: self addContact name].
]

{ #category : #accessing }
UserMenuComponent >> chat [
	^ chat
]

{ #category : #accessing }
UserMenuComponent >> chat: anObject [
	chat := anObject
]

{ #category : #hooks }
UserMenuComponent >> children [ 


^ Array with: self chat   
]

{ #category : #accessing }
UserMenuComponent >> contactsList [
	^ contactsList
]

{ #category : #accessing }
UserMenuComponent >> contactsList: anObject [
	contactsList := anObject
]

{ #category : #contactListFilters }
UserMenuComponent >> filterBlocked [

self contactsList 
	filterBlock: [ :items | items select: [:contact | contact blocked not ] ]
]

{ #category : #initialization }
UserMenuComponent >> initializeContactsList [

 self contactsList: ListComponent new.
 self contactsList
  sortBlock: [:items |
   items sort: [:a :b | a name < b name ]];
  renderItemBlock: [:contact :html |
   self renderContact: contact asRowOn: html].
 self filterBlocked.
self contactsList items: self user contacts.
]

{ #category : #initialization }
UserMenuComponent >> initializeMainMenu [

self mainMenu: (MainMenuComponent new
  		addEntry: 'Agregar contacto' withAction: [self callAddContact];
		yourself).
]

{ #category : #initialization }
UserMenuComponent >> initializeWithUser: aUser [

	super initialize.
	self addContact: AddContactComponent new.
	self initializeMainMenu.
	self user: aUser.
	self chat: (ChatComponent newWithUser: aUser).
	self initializeContactsList.

]

{ #category : #accessing }
UserMenuComponent >> mainMenu [
	^ mainMenu
]

{ #category : #accessing }
UserMenuComponent >> mainMenu: anObject [
	mainMenu := anObject
]

{ #category : #initialization }
UserMenuComponent >> renderContact: aContact asRowOn: html [

html tableData: [html
	tableData: aContact name;
	tableData: aContact contactNumber;
	tableData: [html anchor 
					callback: [  self setChatComponent: aContact.
									  ];
					with: 'Abrir chat'.
					]
	  ].

]

{ #category : #rendering }
UserMenuComponent >> renderContentOn: html [

html heading: 'Contactos';
	  break; break.
	  html div
  			class: 'menu';
  			with: self mainMenu.
	  html break; break.
 		html div
  			class: 'list';
  			with: self contactsList.
html render: self chat.
	



]

{ #category : #initialization }
UserMenuComponent >> setChatComponent: aContact [

| aChat anotherUser|

anotherUser:= Server singleton getUserByNumber: aContact contactNumber.
aChat:= Server singleton getChatFrom: anotherUser And: self user.
(aChat isNil) ifTrue: [ "crear un chat vacio entre los dos usuarios y show" ] 
				ifFalse: [ self chat messages: aChat messages. 
							  self chat chat: aChat.
		    				  self chat initializeMessagesList.
								].
]

{ #category : #accessing }
UserMenuComponent >> user [
	^ user
]

{ #category : #accessing }
UserMenuComponent >> user: anObject [
	user := anObject
]
