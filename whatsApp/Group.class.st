Class {
	#name : #Group,
	#superclass : #Chat,
	#instVars : [
		'name',
		'admin'
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

{ #category : #initialization }
Group >> initializeWithUsers: someUsers Admin: anAdmin AndName: aName [

super initializeWithUsers: someUsers.
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

{ #category : #removing }
Group >> removeMember: aMember [

self users remove: aMember.
]
