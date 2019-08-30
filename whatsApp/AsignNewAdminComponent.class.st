Class {
	#name : #AsignNewAdminComponent,
	#superclass : #WAComponent,
	#instVars : [
		'group',
		'members',
		'newAdmin',
		'admin'
	],
	#category : #'whatsApp-UI'
}

{ #category : #'instance creation' }
AsignNewAdminComponent class >> newWithGroup: aGroup [

^ self new 
initializeWithGroup: aGroup;
yourself.
]

{ #category : #accessing }
AsignNewAdminComponent >> admin [
	^ admin
]

{ #category : #accessing }
AsignNewAdminComponent >> admin: anObject [
	admin := anObject
]

{ #category : #accessing }
AsignNewAdminComponent >> atLeastOneMember [

(self members isNotEmpty) ifTrue: [ ^ true ] ifFalse: [ ^ false. ]. 
]

{ #category : #rendering }
AsignNewAdminComponent >> destroy [

self group admin: nil.
self answer: true.
]

{ #category : #rendering }
AsignNewAdminComponent >> getMemberName: aMember [

|name|

name:= ( self admin getContactName: aMember number).
name isNil ifTrue: [^aMember number]
			  ifFalse: [^name]
]

{ #category : #accessing }
AsignNewAdminComponent >> group [
	^ group
]

{ #category : #accessing }
AsignNewAdminComponent >> group: anObject [
	group := anObject
]

{ #category : #initialization }
AsignNewAdminComponent >> initializeWithGroup: aGroup [ 

self members: aGroup users.
self group: aGroup. 
self admin: aGroup admin.

]

{ #category : #accessing }
AsignNewAdminComponent >> members [
	^ members
]

{ #category : #accessing }
AsignNewAdminComponent >> members: anObject [
	members := anObject
]

{ #category : #accessing }
AsignNewAdminComponent >> newAdmin [
	^ newAdmin
]

{ #category : #accessing }
AsignNewAdminComponent >> newAdmin: anObject [
	newAdmin := anObject
]

{ #category : #rendering }
AsignNewAdminComponent >> renderContentOn: html [
|name| 		
		
	(self atLeastOneMember) ifTrue: [  
		
		html heading: 'Asignar nuevo admin'.
		html strong: 'Seleccione un nuevo admin antes de abandonar el grupo'.
		html form: [  			
			html text: 'Admin: '.
			html break.       	
      		html select 
				dispatchCallback;
       		with:[ 			
				  self members do:[:mem |
       		      name:= self getMemberName: mem.
      					html option
					 		label: name;              
							callback: [ self newAdmin: mem ].
               		    ] ].					       
			html break.
			html submitButton on: #save of: self;
								   with: 'Abandonar grupo'.
			html text: '   '.
			html submitButton callback: [self answer: false];
    								value: 'Volver'.				
			].
		] ifFalse: [ 
			html form: [ 
				html submitButton on: #destroy of: self;
									   with: 'cerrar grupo'.
				html text: '   '.
				html submitButton callback: [self answer: false];
   		 								value: 'Volver'.			
			 	]. 
			].		
]

{ #category : #rendering }
AsignNewAdminComponent >> save [ 

self group admin: self newAdmin.
self group removeMember: self newAdmin.
self answer: true.
]
