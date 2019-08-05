Class {
	#name : #UserMenuComponent,
	#superclass : #WAComponent,
	#instVars : [
		'user',
		'mainMenu',
		'addContact',
		'contactsList'
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

	self addContact: AddContactComponent new.
	self initializeMainMenu.
	self user: aUser.
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
	tableData: aContact contactNumber  ].
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
	



]

{ #category : #accessing }
UserMenuComponent >> user [
	^ user
]

{ #category : #accessing }
UserMenuComponent >> user: anObject [
	user := anObject
]
