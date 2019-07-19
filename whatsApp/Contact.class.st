Class {
	#name : #Contact,
	#superclass : #Object,
	#instVars : [
		'name',
		'blocked',
		'user'
	],
	#category : #whatsApp
}

{ #category : #accessing }
Contact >> blocked [
	^ blocked
]

{ #category : #accessing }
Contact >> blocked: anObject [
	blocked := anObject
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
