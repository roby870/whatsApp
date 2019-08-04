Class {
	#name : #User,
	#superclass : #Object,
	#instVars : [
		'number',
		'photo',
		'status',
		'contacts',
		'server',
		'notifications'
	],
	#category : #'whatsApp-Model'
}

{ #category : #'instance creation' }
User class >> newWithNumber: aNumber [
	
	"el parametro debe ser de tipo String"
	
	^ self new
	initializeWithNumber: aNumber;
	yourself

]

{ #category : #adding }
User >> addContactWithNumber: aNumber AndName: aName [

"Crea un contacto si no hay ninguno registrado con aNumber y si existe en el servidor aNumber, caso contrario no lo crea y retorna nil"

	|user newContact|

	self contacts detect: [ :contact | contact contactNumber = aNumber ] 
	ifFound: [ ^ nil ] 
	ifNone: [
				user:=Server singleton getUserByNumber: aNumber.
				(user isNil) ifTrue: [  
					^ nil.
					]
				ifFalse: [  
				newContact := Contact newWithUser: user AndName: aName. 
				self contacts add: newContact.		
				].
		]. 
]

{ #category : #adding }
User >> blockContact: aNumber [


|contact|

contact:=self contacts detect: [:c | c contactNumber == aNumber ] ifNone: [ ^nil ].
contact blocked: true.
]

{ #category : #accessing }
User >> contacts [
	^ contacts
]

{ #category : #accessing }
User >> contacts: anObject [
	contacts := anObject
]

{ #category : #adding }
User >> deleteContact: aNumber [

|contact|

contact:=self contacts detect: [:c | c contactNumber == aNumber ] ifNone: [ ^nil ].
self contacts remove: contact. 
]

{ #category : #initialization }
User >> initializeWithNumber: aNumber [

self number: aNumber.
self contacts: OrderedCollection new.
self notifications: OrderedCollection new.
self server: Server singleton.
Server singleton addUser: self.
]

{ #category : #accessing }
User >> notifications [
	^ notifications
]

{ #category : #accessing }
User >> notifications: anObject [
	notifications := anObject
]

{ #category : #accessing }
User >> number [
	^ number
]

{ #category : #accessing }
User >> number: anObject [
	number := anObject
]

{ #category : #accessing }
User >> photo [
	^ photo
]

{ #category : #accessing }
User >> photo: anObject [
	photo := anObject
]

{ #category : #accessing }
User >> server [
	^ server
]

{ #category : #accessing }
User >> server: anObject [
	server := anObject
]

{ #category : #accessing }
User >> status [
	^ status
]

{ #category : #accessing }
User >> status: anObject [
	status := anObject
]
