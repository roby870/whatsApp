Class {
	#name : #Call,
	#superclass : #Object,
	#instVars : [
		'state',
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

{ #category : #'changing state' }
Call >> changeToFinished [ 

self state: Finished new.
self finishedAt: DateAndTime now.
]

{ #category : #'changing state' }
Call >> changeToStart [

self startedAt: DateAndTime now;
		  state: Active new.
]

{ #category : #'changing state' }
Call >> finish [ 

self state finish: self.
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
self state: Waiting new.
]

{ #category : #accessing }
Call >> receiver [
	^ receiver
]

{ #category : #accessing }
Call >> receiver: anObject [
	receiver := anObject
]

{ #category : #'changing state' }
Call >> start [ 

self state start: self.
]

{ #category : #accessing }
Call >> startedAt [
	^ startedAt
]

{ #category : #accessing }
Call >> startedAt: anObject [
	startedAt := anObject
]

{ #category : #accessing }
Call >> state [
	^ state
]

{ #category : #accessing }
Call >> state: anObject [
	state := anObject
]
