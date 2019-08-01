Class {
	#name : #Group,
	#superclass : #Chat,
	#instVars : [
		'name'
	],
	#category : #'whatsApp-Model'
}

{ #category : #accessing }
Group >> name [
	^ name
]

{ #category : #accessing }
Group >> name: anObject [
	name := anObject
]
