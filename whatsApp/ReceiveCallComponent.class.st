Class {
	#name : #ReceiveCallComponent,
	#superclass : #CallComponent,
	#category : #'whatsApp-UI'
}

{ #category : #accessing }
ReceiveCallComponent >> contact [ 
|caller|
caller:=self user getContactName: self theCall caller. 
caller isNil ifTrue:[^ self theCall caller] 
			ifFalse: [ ^ caller ].
]

{ #category : #initialization }
ReceiveCallComponent >> initializeWithCall:  aCall [ 

self theCall: aCall.
self user: (Server singleton getUserByNumber: aCall receiver).
aCall start.
]
