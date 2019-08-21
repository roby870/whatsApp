Class {
	#name : #UserMenuComponent,
	#superclass : #WAComponent,
	#instVars : [
		'user',
		'mainMenu',
		'addContact',
		'contactsList',
		'chat',
		'blockedContactsList',
		'groupsList',
		'addGroup'
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

{ #category : #accessing }
UserMenuComponent >> addGroup [
	^ addGroup
]

{ #category : #accessing }
UserMenuComponent >> addGroup: anObject [
	addGroup := anObject
]

{ #category : #accessing }
UserMenuComponent >> blockedContactsList [
	^ blockedContactsList
]

{ #category : #accessing }
UserMenuComponent >> blockedContactsList: anObject [
	blockedContactsList := anObject
]

{ #category : #calling }
UserMenuComponent >> callAddContact [

  | answer |
 answer := self call: self addContact.
 answer ifTrue: [self user addContactWithNumber:  self addContact number AndName: self addContact name].



]

{ #category : #calling }
UserMenuComponent >> callAddGroup [

 | answer |
 answer := self call: self addGroup.
 answer ifTrue: [ self groupsList items: (Server singleton getGroups: self user). ].
]

{ #category : #calling }
UserMenuComponent >> callBlockedContacts [

self call: self blockedContactsList
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

{ #category : #accessing }
UserMenuComponent >> groupsList [
	^ groupsList
]

{ #category : #accessing }
UserMenuComponent >> groupsList: anObject [
	groupsList := anObject
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
UserMenuComponent >> initializeGroupsList [

 self groupsList: ListComponent new.
 self groupsList
  sortBlock: [:items |
   items sort: [:a :b | a name < b name ]];
  renderItemBlock: [:group :html |
   self renderGroup: group asRowOn: html].
self groupsList  
	filterBlock: [:items | items ].
self groupsList items: (Server singleton getGroups: self user).

]

{ #category : #initialization }
UserMenuComponent >> initializeMainMenu [

self mainMenu: (MainMenuComponent new
  		addEntry: 'Agregar contacto' withAction: [self callAddContact];
		addEntry: 'Agregar grupo' withAction: [self callAddGroup ];
		addEntry: 'Ver contactos bloqueados' withAction: [self callBlockedContacts];
		yourself).
]

{ #category : #initialization }
UserMenuComponent >> initializeWithUser: aUser [

	super initialize.
	self addContact: AddContactComponent new.
	self addGroup: (AddGroupComponent newWithAdmin: aUser).
	self blockedContactsList: (BlockedListComponent newWithContacts: aUser contacts).
	self initializeMainMenu.
	self user: aUser.
	self initializeContactsList.
	self chat: (ChatComponent newWithUser: aUser).
	self initializeGroupsList.
	

]

{ #category : #accessing }
UserMenuComponent >> mainMenu [
	^ mainMenu
]

{ #category : #accessing }
UserMenuComponent >> mainMenu: anObject [
	mainMenu := anObject
]

{ #category : #rendering }
UserMenuComponent >> renderContact: aContact asRowOn: html [

html tableData: [html
	tableData: aContact name;
	tableData: 'Número de teléfono: ', aContact contactNumber;
	tableData: [html anchor 
					callback: [  self setChatComponent: aContact.
									  ];
					with: 'Abrir chat'.
					];
	tableData: [html anchor 
					callback: [  aContact block.
									self resetChat.
									  ];
					with: 'bloquear'.
					];
	tableData: [html anchor 
					callback: [  self user deleteContact: aContact contactNumber.
									self resetChat.
									  ];
					with: 'eliminar'.
					]
	  ].

]

{ #category : #rendering }
UserMenuComponent >> renderContentOn: html [

html heading: 'Contactos y chats';
	  break; break.
	  html div
  			class: 'menu';
  			with: self mainMenu.
	  html break; break.
 		html div
  			class: 'list';
  			with: self contactsList.
		html break; break.		
		html div
  			class: 'list';

  			with: self groupsList.
html render: self chat.
	



]

{ #category : #rendering }
UserMenuComponent >> renderGroup: group asRowOn: html [

html tableData: [html
	tableData: group name;
	tableData: [html anchor 
					callback: [  self setGroupComponent: group.
									  ];
					with: 'Abrir grupo'.
					].]
				
]

{ #category : #rendering }
UserMenuComponent >> resetChat [

self chat: (ChatComponent newWithUser: self user).
]

{ #category : #initialization }
UserMenuComponent >> setChatComponent: aContact [

| aChat anotherUser|

anotherUser:= Server singleton getUserByNumber: aContact contactNumber.
aChat:= Server singleton getChatFrom: anotherUser And: self user.
(aChat isNil) ifTrue: [ aChat:= Chat newWithUsers: (Array with: self user with: anotherUser) ]. 
self chat: (ChatComponent newWithUser: self user).
self chat messages: aChat messages. 
self chat chat: aChat.
self chat contact: aContact.
self chat initializeMessagesList.
								
]

{ #category : #initialization }
UserMenuComponent >> setGroupComponent: aGroup [

self chat: (GroupComponent newWithUser: self user).
self chat messages: aGroup messages. 
self chat group: aGroup.
self chat initializeMessagesList.
								
]

{ #category : #accessing }
UserMenuComponent >> user [
	^ user
]

{ #category : #accessing }
UserMenuComponent >> user: anObject [
	user := anObject
]
