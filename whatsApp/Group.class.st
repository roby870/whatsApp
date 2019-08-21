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

{ #category : #accessing }
Group >> name [
	^ name
]

{ #category : #accessing }
Group >> name: anObject [
	name := anObject
]
