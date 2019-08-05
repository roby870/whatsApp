Class {
	#name : #LoginComponent,
	#superclass : #WAComponent,
	#instVars : [
		'number'
	],
	#category : #'whatsApp-UI'
}

{ #category : #accessing }
LoginComponent >> number [
	^ number
]

{ #category : #accessing }
LoginComponent >> number: anObject [
	number := anObject
]

{ #category : #rendering }
LoginComponent >> renderButtonsOn: html [

html tableData:	[html submitButton
    						callback: [self answer: true];
							value: 'Guardar'.
					html submitButton
    						callback: [self answer: false];
    						value: 'Volver'].
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
    		  tableRow: [self renderNumberInputOn: html];
			  tableRow: [self renderButtonsOn: html	].		
			
		].	
		
	].
 ].				
					
						
						
		
]

{ #category : #rendering }
LoginComponent >> renderNumberInputOn: html [

html tableData: [html text: 'Número de teléfono: '];
	  						tableData: [html textInput on: #number of: self ]
]
