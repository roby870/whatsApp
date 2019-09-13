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
		'notificationsList'
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

{ #category : #rendering }
UserMenuComponent >> answerTheCall: aCall [

self call: (ReceiveCallComponent newWithCall: (self user smartphone acceptCall: aCall)).

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
UserMenuComponent >> broadcastMemberLeftGroup: aGroup [

aGroup users do: [ :member | (member ~= self user) ifTrue: [member addNotification: (WhatsAppNotification newWithMessage: 'El usuario con numero ', self user number, ' abandonó el grupo ', aGroup name) ]].
aGroup admin addNotification: (WhatsAppNotification newWithMessage: 'El usuario con numero ', self user number, ' abandonó el grupo ', aGroup name).
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
 answer := self call: (AddGroupComponent newWithAdmin: self user).
 answer ifTrue: [ self groupsList items: (Server singleton getGroups: self user)].


]

{ #category : #calling }
UserMenuComponent >> callBlockedContacts [

self call: self blockedContactsList
]

{ #category : #calling }
UserMenuComponent >> callEditGroupProfile: aGroup [

 self call: (EditGroupComponent newWith: aGroup).
]

{ #category : #calling }
UserMenuComponent >> callEditProfile [

 self call: (EditProfileComponent newWith: self user).
]

{ #category : #calling }
UserMenuComponent >> callMakeAPhoneCall: aContact [

 | aCall |
 
 
 aCall:= self user smartphone callNumber: aContact contactNumber.
 self call: (CallComponent newWithCall: aCall).

 


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

{ #category : #calling }
UserMenuComponent >> exitGroup: aGroup [

(self user = aGroup admin)ifTrue:[ self call: (AsignNewAdminComponent newWithGroup: aGroup) ]
								 ifFalse: [ aGroup removeMember: self user. 
												self broadcastMemberLeftGroup: aGroup ].

self groupsList items: (Server singleton getGroups: self user).
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

{ #category : #rendering }
UserMenuComponent >> incomingCallOn: html [
	| call |
	call := Server singleton getIncomingCall: self user.
	call isNotNil
		ifFalse: [ ^ self ].
	html
		text: 'Llamada entrante de ' , (self referenceCaller: call caller), '  '.
	html anchor
		callback: [ self answerTheCall: call ];
		with: 'Atender'.
	html break.
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
		addEntry: 'Editar perfil' withAction: [ self callEditProfile ];
		yourself).
]

{ #category : #initialization }
UserMenuComponent >> initializeNotificationsList [

 self notificationsList: ListComponent new.
 self notificationsList
  sortBlock: [:items |
   items sort: [:a :b | a timestamp > b timestamp ]];
  renderItemBlock: [:message :html |
   self renderNotification: message asRowOn: html].
self notificationsList 
	filterBlock: [:items | items ].
self notificationsList items: self user notifications.
]

{ #category : #initialization }
UserMenuComponent >> initializeWithUser: aUser [

	super initialize.
	self addContact: AddContactComponent new.
	self blockedContactsList: (BlockedListComponent newWithContacts: aUser contacts).
	self initializeMainMenu.
	self user: aUser.
	self initializeContactsList.
	self chat: (ChatComponent newWithUser: aUser).
	self initializeGroupsList.
	self initializeNotificationsList.
]

{ #category : #accessing }
UserMenuComponent >> mainMenu [
	^ mainMenu
]

{ #category : #accessing }
UserMenuComponent >> mainMenu: anObject [
	mainMenu := anObject
]

{ #category : #accessing }
UserMenuComponent >> notificationsList [
	^ notificationsList
]

{ #category : #accessing }
UserMenuComponent >> notificationsList: anObject [
	notificationsList := anObject
]

{ #category : #'as yet unclassified' }
UserMenuComponent >> referenceCaller: aCaller [

|contact|

contact:=self user getContactName: aCaller.
contact isNil ifTrue: [ ^ aCaller ]
				  ifFalse: [ ^ contact ].
]

{ #category : #rendering }
UserMenuComponent >> renderContact: aContact PhotoOn: html [

(aContact user photo isNil) 
	ifTrue: [ html image url: (WhatsAppFileLibrary urlOf: #blankPng);
		height: 30;
		width: 30. ] 
	ifFalse: [ (html image url: (WhatsAppFileLibrary urlOf: aContact user photo);
		    		      height: 30;
					  		width: 30) ]
]

{ #category : #rendering }
UserMenuComponent >> renderContact: aContact asRowOn: html [

html tableData: [html
	tableData: [ self renderContact: aContact PhotoOn: html ];
	tableData: aContact name;
	tableData: 'Número de teléfono: ', aContact contactNumber;
	tableData: [html anchor 
					callback: [  self setChatComponent: aContact.
									  ];
					with: 'Abrir chat'.
					];
	tableData: [html anchor 
					callback: [  self callMakeAPhoneCall: aContact.
									  ];
					with: 'Llamar'.
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
					];
	tableData: [ html text: 'estado: ', aContact contactStatus. ].
	  ].

]

{ #category : #rendering }
UserMenuComponent >> renderContentOn: html [

	  html heading: 'WhatsApp'.
	  self renderUserPhotoOn: html.	
	  html heading level: 4; with: 'Estado: ', self user status.  
	  self incomingCallOn: html.
	  html div
  			class: 'menu';
  			with: self mainMenu.
	  html break.
	  html heading level: 4; with: 'notificaciones'.
	  html render: self notificationsList.
	  html break.
	  html heading level: 4; with: 'contactos'.
 		html div
  			class: 'list';
  			with: self contactsList.
		html break.
		html heading level: 4; with: 'grupos'.		
		html div
  			class: 'list';
  			with: self groupsList.
html render: self chat.
]

{ #category : #rendering }
UserMenuComponent >> renderGroup: group asRowOn: html [

html tableData: [html
	tableData: [ self renderGroupPhoto: group On: html ];
	tableData: group name;
	tableData: [html anchor 
					callback: [  self setGroupComponent: group.
									  ];
					with: 'Abrir grupo'.
					];
	tableData: [html anchor 
					callback: [  self exitGroup: group.
									  ];
					with: 'Salir del grupo'.
					];
	tableData: [html anchor 
						callback: [ self callEditGroupProfile: group ];
						with: 'Editar perfil'].
	(self user = group admin)
		ifTrue:[ html tableData: [html anchor 
												callback: [self call: (AddMemberComponent newWithGroup: group)];
												with: 'Agregar miembro'.
	   									].			
					html tableData: [html anchor 
												callback: [ self call: (RemoveMemberComponent newWithGroup: group) ];
												with: 'Borrar miembro'.
	   									].									
			 	]. ].
]

{ #category : #rendering }
UserMenuComponent >> renderGroupPhoto: aGroup On: html [

(aGroup photo isNil)
	ifTrue: [ html image url: (WhatsAppFileLibrary urlOf: #blankPng);
		           height: 50;
					  width: 50. ] 
	ifFalse: [  
		html image url: (WhatsAppFileLibrary urlOf: aGroup photo);
		     height: 50;
			  width: 50. ].
				
]

{ #category : #initialization }
UserMenuComponent >> renderNotification: aNotification asRowOn: html [

html
	tableData: aNotification timestamp asDate;
	tableData: aNotification message;
	tableData: [html anchor 
					callback: [  self user deleteNotification: aNotification.
									  ];
					with: 'Eliminar'.
					].
	(aNotification read not)ifTrue: [  			
	html tableData: [html anchor 
					callback: [  aNotification markAsRead.
									  ];
					with: 'Marcar como leida'.
					].
				] ifFalse: [ 
					html tableData: 'Leída'.
				 ].
]

{ #category : #rendering }
UserMenuComponent >> renderUserPhotoOn: html [

(self user photo isNil)
	ifTrue: [ html image url: (WhatsAppFileLibrary urlOf: #blankPng);
		           height: 50;
					  width: 50. ] 
	ifFalse: [  
		html image url: (WhatsAppFileLibrary urlOf: self user photo);
		     height: 50;
			  width: 50. ].
				
]

{ #category : #rendering }
UserMenuComponent >> resetChat [

self chat: (ChatComponent newWithUser: self user).
]

{ #category : #hooks }
UserMenuComponent >> script [ 


^ 'items = document.querySelectorAll(".messageslist");
    last = items[items.length-1];
    last.scrollIntoView();'
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
self chat chat: aGroup.
self chat initializeMessagesList.
								
]

{ #category : #hooks }
UserMenuComponent >> style [ 


^ 'input {  border: 2px solid MediumSeaGreen;
  				border-radius: 12px;								
				margin-top: 10px;
  				margin-bottom: 10px;
  				margin-right: 10px;
  				margin-left: 10px;
								 }'
]

{ #category : #accessing }
UserMenuComponent >> user [
	^ user
]

{ #category : #accessing }
UserMenuComponent >> user: anObject [
	user := anObject
]
