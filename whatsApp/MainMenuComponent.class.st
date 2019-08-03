Class {
	#name : #MainMenuComponent,
	#superclass : #WAComponent,
	#instVars : [
		'entries'
	],
	#category : #'whatsApp-UI'
}

{ #category : #accessing }
MainMenuComponent >> addEntry: aString withAction: aBlock [
 
 ^ self entries add: aString -> aBlock
]

{ #category : #accessing }
MainMenuComponent >> entries [
	^ entries
]

{ #category : #accessing }
MainMenuComponent >> entries: anObject [
	entries := anObject
]

{ #category : #accessing }
MainMenuComponent >> initialize [

 super initialize.
 self entries: OrderedCollection new.
]

{ #category : #rendering }
MainMenuComponent >> renderContentOn: html [

self entries
  do: [:entry |
   html anchor
    callback: entry value;
    with: entry key]
  separatedBy: [html space].
]
