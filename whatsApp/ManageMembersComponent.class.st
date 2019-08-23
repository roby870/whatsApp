Class {
	#name : #ManageMembersComponent,
	#superclass : #WAComponent,
	#instVars : [
		'group',
		'contacts',
		'contactsList'
	],
	#category : #'whatsApp-UI'
}

{ #category : #'instance creation' }
ManageMembersComponent class >> newWithGroup: aGroup [

^ self new 
initializeWithGroup: aGroup;
yourself.
]

{ #category : #accessing }
ManageMembersComponent >> contacts [
	^ contacts
]

{ #category : #accessing }
ManageMembersComponent >> contacts: anObject [
	contacts := anObject
]

{ #category : #accessing }
ManageMembersComponent >> contactsList [
	^ contactsList
]

{ #category : #accessing }
ManageMembersComponent >> contactsList: anObject [
	contactsList := anObject
]

{ #category : #accessing }
ManageMembersComponent >> filter [ 

^ self subclassResponsibility 
]

{ #category : #accessing }
ManageMembersComponent >> group [
	^ group
]

{ #category : #accessing }
ManageMembersComponent >> group: anObject [
	group := anObject
]

{ #category : #initialization }
ManageMembersComponent >> initializeContacts: aGroup [

^ self subclassResponsibility 
]

{ #category : #initialization }
ManageMembersComponent >> initializeContactsList [

 self contactsList: ListComponent new.
 self sortMethod.
 self contactsList
  renderItemBlock: [:aMember :html |
   self renderMember: aMember asRowOn: html].
 self filter.
self contactsList items: self contacts.
]

{ #category : #initialization }
ManageMembersComponent >> initializeWithGroup: aGroup [

self initializeContacts: aGroup.
self group: aGroup.
self initializeContactsList.
]

{ #category : #rendering }
ManageMembersComponent >> renderContentOn: html [
 		
	^ self subclassResponsibility 
]

{ #category : #rendering }
ManageMembersComponent >> renderMember: aMember asRowOn: html [

^ self subclassResponsibility 
]

{ #category : #save }
ManageMembersComponent >> save [ 
 
self answer: true.
]

{ #category : #sorting }
ManageMembersComponent >> sortMethod [

^ self subclassResponsibility 
]
