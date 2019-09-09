Class {
	#name : #ReceiveCallComponent,
	#superclass : #CallComponent,
	#category : #'whatsApp-UI'
}

{ #category : #accessing }
ReceiveCallComponent >> contact [ 
|caller|
caller:=self user getContactName: self theCall sender number. 
caller isNil ifTrue:[^ self theCall sender number] 
			ifFalse: [ ^ caller ].
]

{ #category : #initialization }
ReceiveCallComponent >> initializeWithCall:  aCall [ 

self theCall: aCall.
self user: aCall receiver.
]
