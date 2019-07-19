"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestwhatsApp,
	#superclass : #PackageManifest,
	#category : #'whatsApp-Manifest'
}

{ #category : #'code-critics' }
ManifestwhatsApp class >> ruleRBNoClassCommentRuleV1FalsePositive [
	^ #(#(#(#RGPackage #(#whatsApp)) #'2019-04-08T17:49:17.501421-03:00') )
]
