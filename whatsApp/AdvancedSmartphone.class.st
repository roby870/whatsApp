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

{ #category : #'as yet unclassified' }
AdvancedSmartphone >> sendDocument:aContent ToChat: aChatId [

self mobileClient sendDocument:aContent From: self user number ToChat: aChatId
]

{ #category : #'as yet unclassified' }
AdvancedSmartphone >> sendLocation:aContent ToChat: aChatId [

self mobileClient sendLocation:aContent From: self user number ToChat: aChatId
]

{ #category : #'as yet unclassified' }
AdvancedSmartphone >> sendPhoto:aContent ToChat: aChatId [

self mobileClient sendPhoto:aContent From: self user number ToChat: aChatId
]

{ #category : #'as yet unclassified' }
AdvancedSmartphone >> sendVideo:aContent ToChat: aChatId [

self mobileClient sendVideo:aContent From: self user number ToChat: aChatId
]
