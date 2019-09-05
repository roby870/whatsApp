Class {
	#name : #NotificationsComponent,
	#superclass : #WAComponent,
	#instVars : [
		'user',
		'notificationsList'
	],
	#category : #'whatsApp-UI'
}

{ #category : #'instance creation' }
NotificationsComponent class >> newWithUser: aUser [

^ self new
initializeWith: aUser;
yourself 
]

{ #category : #initialization }
NotificationsComponent >> initializeNotificationsList [

 self notificationsList: ListComponent new.
 self notificationsList
  sortBlock: [:items |
   items sort: [:a :b | a timestamp < b timestamp ]];
  renderItemBlock: [:message :html |
   self renderNotification: message asRowOn: html].
self notificationsList 
	filterBlock: [ :items | items select: [:notification | notification read not ] ].
self notificationsList items: self user notifications.
]

{ #category : #initialization }
NotificationsComponent >> initializeWith: aUser [

self user: aUser.
self initializeNotificationsList.
]

{ #category : #accessing }
NotificationsComponent >> notificationsList [
	^ notificationsList
]

{ #category : #accessing }
NotificationsComponent >> notificationsList: anObject [
	notificationsList := anObject
]

{ #category : #rendering }
NotificationsComponent >> renderContentOn: html [

html heading level: 4; with: 'notificaciones'.
html div
  	class: 'notificationsList';
  	with: self notificationsList. 
]

{ #category : #rendering }
NotificationsComponent >> renderNotification: aNotification asRowOn: html [

html
	tableData: aNotification timestamp asDate;
	tableData: aNotification message;
	tableData: [html anchor 
					callback: [  self deleteNotification: aNotification.
									  ];
					with: 'Eliminar'.
					];
	tableData: [html anchor 
					callback: [  self readNotification: aNotification.
									  ];
					with: 'Marcar como leida'.
					].
]

{ #category : #accessing }
NotificationsComponent >> user [
	^ user
]

{ #category : #accessing }
NotificationsComponent >> user: anObject [
	user := anObject
]
