Class {
	#name : #ListComponent,
	#superclass : #WAComponent,
	#instVars : [
		'filterBlock',
		'items',
		'renderItemBlock',
		'sortBlock'
	],
	#category : #'whatsApp-UI'
}

{ #category : #accessing }
ListComponent >> filterBlock [
	^ filterBlock
]

{ #category : #accessing }
ListComponent >> filterBlock: anObject [
	filterBlock := anObject
]

{ #category : #accessing }
ListComponent >> items [
	^ items
]

{ #category : #accessing }
ListComponent >> items: anObject [
	items := anObject
]

{ #category : #rendering }
ListComponent >> renderContentOn: html [


html table: [(self sortBlock
  value: (self filterBlock value: self items))
  do: [:item | html tableRow: [self renderItemBlock
       value: item
       value: html]]].
]

{ #category : #accessing }
ListComponent >> renderItemBlock [
	^ renderItemBlock
]

{ #category : #accessing }
ListComponent >> renderItemBlock: anObject [
	renderItemBlock := anObject
]

{ #category : #accessing }
ListComponent >> sortBlock [
	^ sortBlock
]

{ #category : #accessing }
ListComponent >> sortBlock: anObject [
	sortBlock := anObject
]

{ #category : #rendering }
ListComponent >> style [ 
	^ 'tableData {
  				height: 100px;
			}'
]
