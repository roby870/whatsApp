Class {
	#name : #BlockedListComponent,
	#superclass : #WAComponent,
	#instVars : [
		'contacts',
		'contactsList'
	],
	#category : #'whatsApp-UI'
}

{ #category : #'instance creation' }
BlockedListComponent class >> newWithContacts: someContacts [

^ self new 
	initializeWithContacts: someContacts;
	yourself.
]

{ #category : #accessing }
BlockedListComponent >> contacts [
	^ contacts
]

{ #category : #accessing }
BlockedListComponent >> contacts: anObject [
	contacts := anObject
]

{ #category : #accessing }
BlockedListComponent >> contactsList [
	^ contactsList
]

{ #category : #accessing }
BlockedListComponent >> contactsList: anObject [
	contactsList := anObject
]

{ #category : #initialization }
BlockedListComponent >> initializeContactsList [ 

 self contactsList: ListComponent new.
 self contactsList
  sortBlock: [:items |
   items sort: [:a :b | a name < b name ]];
  renderItemBlock: [:message :html |
   self renderContact: message asRowOn: html].
self contactsList 
	filterBlock: [ :items | items select: [:contact | contact blocked ] ].
self contactsList items: self contacts.
]

{ #category : #initialization }
BlockedListComponent >> initializeWithContacts: someContacts [

self contacts: someContacts.
self initializeContactsList.
]

{ #category : #rendering }
BlockedListComponent >> renderContact: aContact asRowOn: html [

html tableData: [html
	tableData: aContact name;
	tableData: aContact contactNumber;
	tableData: [html anchor 
					callback: [  aContact unblock.
									  ];
					with: 'Desbloquear'.
					]
	  ].
]

{ #category : #rendering }
BlockedListComponent >> renderContentOn: html [

html heading: 'Contactos bloqueados';
	  break; break.
html form: [   
		html submitButton
    		callback: [self answer];
    		value: 'Volver'.
		];
	  break; break.
html  div
  		class: 'list';
  		with: self contactsList.

	
]
