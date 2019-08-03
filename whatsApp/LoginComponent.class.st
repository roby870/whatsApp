Class {
	#name : #LoginComponent,
	#superclass : #WAComponent,
	#instVars : [
		'number'
	],
	#category : #'whatsApp-UI'
}

{ #category : #checking }
LoginComponent >> nonEmptyText: aText [

^ (('\b[a-z]+\b' asRegex search: aText) |
('[a-z]+\b' asRegex search: aText)  | 
('\b[a-z]' asRegex search: aText))
]

{ #category : #accessing }
LoginComponent >> number [
	^ number
]

{ #category : #accessing }
LoginComponent >> number: anObject [
	number := anObject
]

{ #category : #rendering }
LoginComponent >> renderContentOn: html [

html div
  class: 'generic lightbox';
  with: [

	html heading: 'Login'.

	html form: [
    
		html table: [
     
			html
    		  tableRow: [html tableData: [html text: 'Número de teléfono: '];
	  								tableData: [html textInput on: #number of: self ]];
				tableRow: [html tableData:	[html submitButton
    													callback: [
															(self  nonEmptyText: self number ) 
																ifTrue: [self answer: true]
																ifFalse:[ self answer: false]];
														value: 'Guardar'.
													html submitButton
    													callback: [self answer: false];
    													value: 'Volver']
							].		
			
		].	
		
	].
	].				
					
						
						
		
]
