Alias: VOL = https://volven.no // 2.16.578.1.12.4.1.1.<kodeverksid>.//
Alias: SCT = http://snomed.info/sct

Profile: VKPMiniMelding
Parent: Bundle
Id: kpr-mm-iplos-i-kpr
Title: "KPR minimelding"
Description: "Resource bundle for the mini-melding"
* ^status = #draft
* identifier 0..1 // meldingGUID //
* type 1..1 = "Message"

Profile:  VKPMiniMeldingMessageHeader
Parent: MessageHeader
Id: kpr-mm-iplos-i-kpr-MessageHeader
Title:  "Melding Message Header"
Description:   "Melding Nivå 1 Message Header"
* eventUri = MessageHeader??#http://? (exactly)
* insert CommonHeaderStuff
* focus only Reference(??MessageParameters or ??MessageParameters )


Instance:   VKPMiniMelding
InstanceOf: Bundle
Title:      "KPR minimelding"
Usage: #example
* type #Message
* timestamp = 2021-12-13T13:50:50-05:00
* entry[+].resource = 
* entry[=].fullUrl = "urn:uuid:a"