Class {
	#name : #Contact,
	#superclass : #Object,
	#instVars : [
		'name',
		'blocked',
		'user'
	],
	#category : #'whatsApp-Model'
}

{ #category : #'instance creation' }
Contact class >> newWithUser: aUser AndName: aName [

	^ self new
		initializeWithUser: aUser AndName: aName;
		yourself
]

{ #category : #accessing }
Contact >> blocked [
	^ blocked
]

{ #category : #accessing }
Contact >> blocked: anObject [
	blocked := anObject
]

{ #category : #'as yet unclassified' }
Contact >> contactNumber [

^ self user number 
]

{ #category : #'as yet unclassified' }
Contact >> contactPhoto [

^ self user photo
]

{ #category : #'as yet unclassified' }
Contact >> contactStatus [

^ self user status
]

{ #category : #initialization }
Contact >> initializeWithUser: aUser AndName: aName [

self blocked: false.
self name: aName.
self user: aUser.
]

{ #category : #accessing }
Contact >> name [
	^ name
]

{ #category : #accessing }
Contact >> name: anObject [
	name := anObject
]

{ #category : #accessing }
Contact >> user [
	^ user
]

{ #category : #accessing }
Contact >> user: anObject [
	user := anObject
]
