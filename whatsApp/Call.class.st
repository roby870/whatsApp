Class {
	#name : #Call,
	#superclass : #Object,
	#instVars : [
		'caller',
		'receiver',
		'startedAt',
		'finishedAt'
	],
	#category : #'whatsApp-Model'
}

{ #category : #'instance creation' }
Call class >> newWithCaller: aCaller AndReceiver: aReceiver [

^ self new 
  initializeWithCaller: aCaller AndReceiver: aReceiver;
	yourself. 

]

{ #category : #accessing }
Call >> caller [
	^ caller
]

{ #category : #accessing }
Call >> caller: anObject [
	caller := anObject
]

{ #category : #accessing }
Call >> finishedAt [
	^ finishedAt
]

{ #category : #accessing }
Call >> finishedAt: anObject [
	finishedAt := anObject
]

{ #category : #initialization }
Call >> initializeWithCaller: aCaller AndReceiver: aReceiver [

self caller: aCaller.
self receiver: aReceiver.
]

{ #category : #accessing }
Call >> receiver [
	^ receiver
]

{ #category : #accessing }
Call >> receiver: anObject [
	receiver := anObject
]

{ #category : #accessing }
Call >> startedAt [
	^ startedAt
]

{ #category : #accessing }
Call >> startedAt: anObject [
	startedAt := anObject
]
