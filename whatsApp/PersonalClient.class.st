Class {
	#name : #PersonalClient,
	#superclass : #MobileClient,
	#category : #'whatsApp-Model'
}

{ #category : #'as yet unclassified' }
PersonalClient >> chargeCall: aDuration [

self totalAmount: (self totalAmount + (aDuration minutes * 0.75))
]
