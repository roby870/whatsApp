Class {
	#name : #Smartphone,
	#superclass : #Object,
	#instVars : [
		'imei',
		'user',
		'mobileClient'
	],
	#category : #'whatsApp-Model'
}

{ #category : #'instance creation' }
Smartphone class >> newWithImei: anImei [

^ self new 
	initializeWithImei: anImei;
	yourself
]

{ #category : #visiting }
Smartphone >> acceptCall: aCall [

aCall start.
^ aCall
]

{ #category : #'as yet unclassified' }
Smartphone >> callNumber: aNumber [

^ self mobileClient callNumber: aNumber
]

{ #category : #'as yet unclassified' }
Smartphone >> chargeCall: aDuration [ 

self mobileClient chargeCall: aDuration
]

{ #category : #'as yet unclassified' }
Smartphone >> getChatComponentFor: aUser [

^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
Smartphone >> getGroupComponentFor: aUser [

^ self subclassResponsibility
]

{ #category : #visiting }
Smartphone >> hangUpCall: aCall [

aCall finish.

]

{ #category : #accessing }
Smartphone >> imei [
	^ imei
]

{ #category : #accessing }
Smartphone >> imei: anObject [
	imei := anObject
]

{ #category : #'as yet unclassified' }
Smartphone >> incomingCall: aNumber [

^ self user incomingCall: aNumber
]

{ #category : #initialization }
Smartphone >> initializeWithImei: anImei [

self imei: anImei
]

{ #category : #accessing }
Smartphone >> mobileClient [
	^ mobileClient
]

{ #category : #accessing }
Smartphone >> mobileClient: anObject [
	mobileClient := anObject
]

{ #category : #accessing }
Smartphone >> number [

^ self user number
]

{ #category : #'as yet unclassified' }
Smartphone >> sendEmoji:aContent ToChat: aChatId [

self mobileClient sendEmoji:aContent From: self user number ToChat: aChatId
]

{ #category : #'as yet unclassified' }
Smartphone >> sendTextMessage:aMessage ToChat: aChatId [

self mobileClient sendTextMessage:aMessage From: self user number ToChat: aChatId
]

{ #category : #accessing }
Smartphone >> user [
	^ user
]

{ #category : #accessing }
Smartphone >> user: anObject [
	user := anObject
]
