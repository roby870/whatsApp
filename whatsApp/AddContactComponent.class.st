Class {
	#name : #AddContactComponent,
	#superclass : #WAComponent,
	#instVars : [
		'name',
		'number'
	],
	#category : #'whatsApp-UI'
}

{ #category : #accessing }
AddContactComponent >> name [
	^ name
]

{ #category : #accessing }
AddContactComponent >> name: anObject [
	name := anObject
]

{ #category : #accessing }
AddContactComponent >> number [
	^ number
]

{ #category : #accessing }
AddContactComponent >> number: anObject [
	number := anObject
]

{ #category : #rendering }
AddContactComponent >> renderContentOn: html [

html div
  class: 'generic lightbox';
  with: [

	html heading: 'Agregar contacto'.

	html form: [
    
		html table: [
     
			html
    		  tableRow: [html tableData: [html text: 'Número de teléfono: '];
	  								tableData: [html textInput on: #number of: self ]];
				tableRow: [html tableData: [html text: 'Nombre: '];
	  								tableData: [html textInput on: #name of: self ]];
				tableRow: [html tableData:	[html submitButton
    													callback: [
															self answer: true];
														value: 'Guardar'.
													html submitButton
    													callback: [self answer: false];
    													value: 'Volver']
							].		
			
		].	
		
	].
	].		
]
