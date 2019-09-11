Class {
	#name : #ClaroClient,
	#superclass : #MobileClient,
	#category : #'whatsApp-Model'
}

{ #category : #'as yet unclassified' }
ClaroClient >> chargeCall: aDuration [

self totalAmount: (self totalAmount + (aDuration minutes * 0.2))
]
