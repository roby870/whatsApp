Class {
	#name : #AdvancedSmartphone,
	#superclass : #Smartphone,
	#category : #'whatsApp-Model'
}

{ #category : #'as yet unclassified' }
AdvancedSmartphone >> getChatComponent [

^ AdvancedChatComponent newWithUser: self user
]

{ #category : #'as yet unclassified' }
AdvancedSmartphone >> getGroupComponent [

^ AdvancedGroupComponent newWithUser: self user
]

{ #category : #'as yet unclassified' }
AdvancedSmartphone >> sendAudio:aContent ToChat: aChatId [

self mobileClient sendAudio:aContent From: self user number ToChat: aChatId
]
