Class {
	#name : #CallComponent,
	#superclass : #WAComponent,
	#instVars : [
		'theCall',
		'user'
	],
	#category : #'whatsApp-UI'
}

{ #category : #'instance creation' }
CallComponent class >> newWithCall: aCall [ 

^ self new
	initializeWithCall: aCall;
	yourself 
]

{ #category : #accessing }
CallComponent >> contact [ 

^ self user getContactName: self theCall receiver 
]

{ #category : #'as yet unclassified' }
CallComponent >> finishCall [

self theCall finish.
self answer: true.
]

{ #category : #initialization }
CallComponent >> initializeWithCall:  aCall [ 

self theCall: aCall.
self user: (Server singleton getUserByNumber: aCall caller).

]

{ #category : #rendering }
CallComponent >> renderContentOn: html [

html heading: 'Llamada con ', self contact.
(self theCall isFinished)ifTrue: [ self renderFinishedOn: html  ] 
								ifFalse: [ self renderNotFinishedOn: html ].
]

{ #category : #'as yet unclassified' }
CallComponent >> renderFinishedOn:html [

html table: [ 
	html tableRow: [
		html tableData: [ html text: 'Duración: ', self theCall duration humanReadablePrintString  ]. 
		html tableData: [ 
			html anchor 
					callback: [  self answer: true.
									  ];
					with: 'Volver'. ].
		 ]
	]
]

{ #category : #rendering }
CallComponent >> renderNotFinishedOn:html [

html table: [ 
	html tableRow: [
		html tableData: [ html text: 'Duración: ', self theCall duration humanReadablePrintString  ]. 
		html tableData: [ 
			html anchor 
					callback: [  self finishCall.
									  ];
					with: 'Colgar'. ].
		 ]
	]
]

{ #category : #accessing }
CallComponent >> theCall [
	^ theCall
]

{ #category : #accessing }
CallComponent >> theCall: anObject [
	theCall := anObject
]

{ #category : #accessing }
CallComponent >> user [
	^ user
]

{ #category : #accessing }
CallComponent >> user: anObject [
	user := anObject
]
