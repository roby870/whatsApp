Class {
	#name : #MovistarClient,
	#superclass : #MobileClient,
	#category : #'whatsApp-Model'
}

{ #category : #'as yet unclassified' }
MovistarClient >> chargeCall: aDuration [

self totalAmount: (self totalAmount + (aDuration minutes * 0.5))
]
