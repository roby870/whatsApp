Class {
	#name : #WhatsAppRootComponent,
	#superclass : #WAComponent,
	#instVars : [
		'login',
		'mainMenu'
	],
	#category : #'whatsApp-UI'
}

{ #category : #testing }
WhatsAppRootComponent class >> canBeRoot [

 ^true
]

{ #category : #'class initialization' }
WhatsAppRootComponent class >> initialize [

WAAdmin register: self asApplicationAt: 'WhatsApp'
]

{ #category : #'as yet unclassified' }
WhatsAppRootComponent >> callLogin [

 | answer userMenu|
 answer := self call: self login.
 answer ifTrue: [(Server singleton existsNumber: self login number)
						ifTrue: [
							userMenu := Server singleton getUserByNumber: self login number.
							self call: (UserMenuComponent newWithUser: userMenu).
							].	
						].
]

{ #category : #initialization }
WhatsAppRootComponent >> initialize [ 

	super initialize.
	self login: LoginComponent new.
	self mainMenu: (ToDoMenuComponent new
  		addEntry: 'Login' withAction: [self callLogin];
		yourself).
]

{ #category : #accessing }
WhatsAppRootComponent >> login [
	^ login
]

{ #category : #accessing }
WhatsAppRootComponent >> login: anObject [
	login := anObject
]

{ #category : #accessing }
WhatsAppRootComponent >> mainMenu [
	^ mainMenu
]

{ #category : #accessing }
WhatsAppRootComponent >> mainMenu: anObject [
	mainMenu := anObject
]

{ #category : #rendering }
WhatsAppRootComponent >> renderContentOn: html [
	  
	   html heading: 'WhatsApp'.
		html break; break.
		html div
  			class: 'menu';
  			with: self mainMenu.
		
]
