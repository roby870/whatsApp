Class {
	#name : #Group,
	#superclass : #Chat,
	#instVars : [
		'name',
		'admin',
		'photo'
	],
	#category : #'whatsApp-Model'
}

{ #category : #'instance creation' }
Group class >> newWithUsers: someUsers Admin: anAdmin AndName: aName [

^ self new
initializeWithUsers: someUsers Admin: anAdmin AndName: aName;
yourself 
]

{ #category : #adding }
Group >> addInSingleton [

Server singleton addGroup: self.
]

{ #category : #adding }
Group >> addMember: aMember [

self users add: aMember.
]

{ #category : #accessing }
Group >> admin [
	^ admin
]

{ #category : #accessing }
Group >> admin: anObject [
	admin := anObject
]

{ #category : #'as yet unclassified' }
Group >> broadcastNameChange: oldName [

self admin addNotification: (WhatsAppNotification newWithMessage: 'Se ha modificado el nombre del grupo ', oldName, ', ahora se llama ', self name).
self users do: [ :user | user addNotification: (WhatsAppNotification newWithMessage: 'Se ha modificado el nombre del grupo ', oldName, ', ahora se llama ', self name) ].
]

{ #category : #'as yet unclassified' }
Group >> broadcastPhotoChange [

self admin addNotification: (WhatsAppNotification newWithMessage: 'Se ha modificado la foto del grupo ', self name).
self users do: [ :user | user addNotification: (WhatsAppNotification newWithMessage: 'Se ha modificado la foto del grupo ', self name )  ].
]

{ #category : #initialization }
Group >> initializeWithUsers: someUsers Admin: anAdmin AndName: aName [

super initializeWithUsers: someUsers.
self usersTimestamps add: (Array with: anAdmin with: DateAndTime now ).
self name: aName.
self admin: anAdmin.
]

{ #category : #testing }
Group >> isIn: aUser [

^ self users includes: aUser.
]

{ #category : #accessing }
Group >> name [
	^ name
]

{ #category : #accessing }
Group >> name: anObject [
	name := anObject
]

{ #category : #accessing }
Group >> photo [
	^ photo
]

{ #category : #accessing }
Group >> photo: anObject [
	photo := anObject
]

{ #category : #removing }
Group >> removeMember: aMember [

self users remove: aMember.
]
