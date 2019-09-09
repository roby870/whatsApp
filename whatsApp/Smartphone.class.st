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

{ #category : #'as yet unclassified' }
Smartphone >> getChatComponentFor: aUser [

^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
Smartphone >> getGroupComponentFor: aUser [

^ self subclassResponsibility
]

{ #category : #accessing }
Smartphone >> imei [
	^ imei
]

{ #category : #accessing }
Smartphone >> imei: anObject [
	imei := anObject
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
