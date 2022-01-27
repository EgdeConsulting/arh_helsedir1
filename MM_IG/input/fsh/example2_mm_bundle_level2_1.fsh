Instance: 220mmMessageBundle2Fid721 // Bundle of type Message for level 2 notifikasjon//
InstanceOf: KPRMiniMeldingBundle2
Usage: #example
Description: "Multi notifikasjon om tjeneste for bruker fid 04067359721 - notifikasjon bundle nivå 2"
* identifier.value = "fb19cda7-d15b-c38f-f39d-a00946fa563a" // notigikasjonGUID //
* type = #Message
* link[0].relation = #previous // notifikasjonForrigeGUID //
* link[0].url = "http://hddr.no/kpr-mm-iplos-i-kpr-bundle2/00000000-0000-0000-0000-000000000000"
* link[1].relation = #related // notifikasjonFRef //
* link[1].url = "http://hddr.no/kpr-mm-iplos-i-kpr-bundle2/00000000-0000-0000-0000-000000000000"
* entry.resource = 221mmMessageHeader2Fid721
* entry.fullUrl = "http://hddr.no/fhir/MessageHeader/minimeldingMessageHeader1/2"
* timestamp = "2022-01-26T05:32:52.8801236+00:00" // notifikasjonTid //

// level 2 message header //
Instance: 221mmMessageHeader2Fid721
InstanceOf: KPRMiniMeldingMessageHeaderSubmission
Usage: #inline
Description: "Enkelt notifikasjon om tjeneste for bruker fid 28077820721 melding header nivå 1"
* source.name = "Johnston, Wilkinson and Kilback"
* source.endpoint = "8139519"
* eventCoding = #N
* eventUri = "http://hddr.no/iplosikpr_submission"
* definition = "222mmMessageDefinitionFid721" // TODO should be a canonical reference //
* focus = Reference(230mmTjenesteFid721) // references to Encounter for this notification //

Instance: 222mmMessageDefinitionFid721
InstanceOf: MessageDefinition
Usage: #example
Description: "Provides the løpenummer"
* category = #notification
* version = "1" // løpenummer TODO this is being output as 0.1.0 even though defined as a string - very strange//
* status = #active
* eventCoding.system = "http://hddr.no/"
* eventCoding.code = #admin-notify
* date = "2022-01-26T05:32:52.8801236+00:00"

// Encounter level 3 //
Instance: 230mmTjenesteFid721
InstanceOf: KPRMiniMeldingTjeneste
Usage: #example
Description: "Enkelt notifikasjon om tjeneste for bruker fid 28077820721 - payload midlertidigStoppTil"
* identifier[+].type = #hendelseGUID 
* identifier[=].value = "92e2b895-ab71-76a7-ba7d-45cd9b16f926"
* identifier[+].type = #tjenesteID
* identifier[=].value = "4217"
* status = #planned // defines type of notification:'planned' = Midlertidlig stopp til //
// * serviceType from KPRMMtjenesteTypeVS tjenesteType not specified //
* class = #HH // not used //
* period.start = "2022-01-26T07:55:58.0508469+00:00" // hendelseRegTid //
* participant.period.start = "2022-01-26T07:01:37.2912106+00:00" //hendelseDato//
* subject = Reference(240XPRPatientFid721) // references to Patient //

// Patient level 4 //
Instance: 240XPRPatientFid721
InstanceOf: XPRPatient
Usage: #example
Description: "Enkelt notifikasjon om tjeneste for bruker fid 28077820721"
* identifier[+].system = "EPJ" 
* identifier[=].value = "9a8cc5b7-d5d0-8d71-43cb-60165acc4701" //pasientGUID//
* identifier[+].system = "urn:oid:2.16.578.1.12.4.1.4.1" // Fixed value (code for norwegian person identifier "fødselsnummer")
* identifier[=].value = "04067359721" //fid//
* identifier[+].system = "urn:oid:2.16.578.1.12.4.1.4.1" // Fixed value (code for norwegian person identifier "fødselsnummer")
* identifier[=].value = "845948267" //brukerNr//
* address.district.extension.url = "http://hl7.no/fhir/StructureDefinition/no-basis-bydelsnummer" 
* address.district.extension.valueCoding = urn:oid:2.16.578.1.12.4.1.1.3403#1097   // bydel //