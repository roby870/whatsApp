Class {
	#name : #User,
	#superclass : #Object,
	#instVars : [
		'number',
		'photo',
		'status',
		'contacts',
		'server',
		'notifications',
		'smartphone'
	],
	#category : #'whatsApp-Model'
}

{ #category : #'instance creation' }
User class >> newWithNumber: aNumber AndSmartphone: aSmartphone [
	
	"el parametro debe ser de tipo String"
	
	^ self new
	initializeWithNumber: aNumber AndSmartphone: aSmartphone;
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
User >> addNotification: aNotification [

self notifications add: aNotification
]

{ #category : #adding }
User >> blockContact: aNumber [


|contact|

contact:=self contacts detect: [:c | c contactNumber == aNumber ] ifNone: [ ^nil ].
contact blocked: true.
]

{ #category : #'as yet unclassified' }
User >> chargeCall: aDuration [ 

self smartphone chargeCall: aDuration
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

self contacts remove:  (self contacts detect: [ :contact | contact contactNumber = aNumber ]) .
]

{ #category : #adding }
User >> deleteNotification: aNotification [

self notifications remove: aNotification.
]

{ #category : #'as yet unclassified' }
User >> getChatComponent [ 

^ self smartphone getChatComponent 
]

{ #category : #'as yet unclassified' }
User >> getContactName: aNumber [

^ (self contacts detect: [ :contact | contact contactNumber = aNumber  ]
					  ifNone: [^ nil] ) name.
]

{ #category : #'as yet unclassified' }
User >> getGroupComponent [ 

^ self smartphone getGroupComponent 
]

{ #category : #'as yet unclassified' }
User >> incomingCall: aNumber [

^ self server callWithCaller: aNumber AndReceiver: self number
]

{ #category : #initialization }
User >> initializeWithNumber: aNumber AndSmartphone: aSmartphone [

self number: aNumber.
self smartphone: aSmartphone.
self contacts: OrderedCollection new.
self notifications: OrderedCollection new.
self status: ''.
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

{ #category : #'as yet unclassified' }
User >> sendAudio:aContent ToChat: aChatId [

self smartphone sendAudio:aContent ToChat: aChatId.
]

{ #category : #'as yet unclassified' }
User >> sendDocument: aContent ToChat: aChatId [

self smartphone sendDocument:aContent ToChat: aChatId.
]

{ #category : #'as yet unclassified' }
User >> sendEmoji:aContent ToChat: aChatId [

self smartphone sendEmoji:aContent ToChat: aChatId.
]

{ #category : #'as yet unclassified' }
User >> sendLocation:aContent ToChat: aChatId [

self smartphone sendLocation:aContent ToChat: aChatId.
]

{ #category : #'as yet unclassified' }
User >> sendPhoto:aContent ToChat: aChatId [

self smartphone sendPhoto:aContent ToChat: aChatId.
]

{ #category : #'as yet unclassified' }
User >> sendTextMessage:aMessage ToChat: aChatId [

self smartphone sendTextMessage:aMessage ToChat: aChatId.
]

{ #category : #'as yet unclassified' }
User >> sendVideo:aContent ToChat: aChatId [

self smartphone sendVideo:aContent ToChat: aChatId.
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
User >> smartphone [
	^ smartphone
]

{ #category : #accessing }
User >> smartphone: anObject [
	smartphone := anObject
]

{ #category : #accessing }
User >> status [
	^ status
]

{ #category : #accessing }
User >> status: anObject [
	status := anObject
]
