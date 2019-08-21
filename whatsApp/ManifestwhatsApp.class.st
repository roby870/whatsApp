"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestwhatsApp,
	#superclass : #PackageManifest,
	#category : #'whatsApp-Manifest'
}

{ #category : #'code-critics' }
ManifestwhatsApp class >> ruleRBClassNotReferencedRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#Call)) #'2019-07-19T23:54:18.724952-03:00') )
]

{ #category : #'code-critics' }
ManifestwhatsApp class >> ruleRBNoClassCommentRuleV1FalsePositive [
	^ #(#(#(#RGPackage #(#whatsApp)) #'2019-04-08T17:49:17.501421-03:00') )
]

{ #category : #'code-critics' }
ManifestwhatsApp class >> ruleRBSelfSentNotImplementedRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#UserMenuComponent #initializeGroupsList #false)) #'2019-08-20T02:40:10.686947-03:00') )
]
