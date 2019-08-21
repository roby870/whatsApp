Class {
	#name : #Jscode,
	#superclass : #WAFileLibrary,
	#category : #'whatsApp-UI'
}

{ #category : #'as yet unclassified' }
Jscode >> focusChat [

^'
var chatDiv = document.getElementsByClassName(''messageslist'')[0];
chatDiv.scrollTop = chatDiv.scrollHeight;

(function () {
  document.getElementById("demo").innerHTML = "Hello! I called myself";
})();'
]
