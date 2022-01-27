Instance: 220mmMessageBundle2Fid652 // Bundle of type Message for level 2 notifikasjon//
InstanceOf: KPRMiniMeldingBundle2
Usage: #example
Description: "Multi notifikasjon om tjeneste for bruker fid 04067359652 - notifikasjon bundle nivå 2"
* identifier.value = "fb19cda7-d15b-c38f-f39d-a00946fa563a" // notigikasjonGUID //
* type = #Message
* link[0].relation = #previous // notifikasjonForrigeGUID //
* link[0].url = "http://hddr.no/kpr-mm-iplos-i-kpr-bundle2/00000000-0000-0000-0000-000000000000"
* link[1].relation = #related // notifikasjonFRef //
* link[1].url = "http://hddr.no/kpr-mm-iplos-i-kpr-bundle2/00000000-0000-0000-0000-000000000000"
* entry.resource = 221mmMessageHeader2Fid652
* entry.fullUrl = "http://hddr.no/fhir/MessageHeader/minimeldingMessageHeader1/2"
* timestamp = "2022-01-26T05:32:52.8801236+00:00" // notifikasjonTid //

// level 2 message header //
Instance: 221mmMessageHeader2Fid652
InstanceOf: KPRMiniMeldingMessageHeaderSubmission
Usage: #inline
Description: "Enkelt notifikasjon om tjeneste for bruker fid 28077820652 melding header nivå 1"
* source.name = "Johnston, Wilkinson and Kilback"
* source.endpoint = "8139519"
* eventCoding = #N
* eventUri = "http://hddr.no/iplosikpr_submission"
* definition = "222mmMessageDefinitionFid652" // TODO should be a canonical reference //
* focus = Reference(230mmTjenesteFid652) // references to Encounter for this notification //

Instance: 222mmMessageDefinitionFid652
InstanceOf: MessageDefinition
Usage: #example
Description: "Provides the løpenummer"
* category = #notification
* version = "1" // løpenummer TODO this is being output as 0.1.0 even though defined as a string - very strange//
* status = #active
* eventCoding.system = "http://hddr.no/"
* eventCoding.code = #admin-notify
* date = "2021-12-06T06:37:30.7379426+00:00"

// Encounter level 3 //
Instance: 230mmTjenesteFid652
InstanceOf: KPRMiniMeldingTjeneste
Usage: #example
Description: "Enkelt notifikasjon om tjeneste for bruker fid 28077820652 - payload tjenesteStart"
* identifier[+].type = #hendelseGUID 
* identifier[=].value = "677875f0-2012-6516-b575-16446c0ec4d9"
* identifier[+].type = #tjenesteID
* identifier[=].value = "2567"
* status = #arrived // defines type of notification:'arrived' = TjenesteStart //
// * serviceType from KPRMMtjenesteTypeVS tjenesteType not specified //
* class = #HH // not used //
* period.start = "2022-01-26T03:02:11.8220311+00:00" // hendelseRegTid //
* participant.period.start = "2022-01-26T09:09:45.2738678+00:00" //hendelseDato//
* subject = Reference(240XPRPatientFid652) // references to Patient //

// Patient level 4 //
Instance: 240XPRPatientFid652
InstanceOf: XPRPatient
Usage: #example
Description: "Enkelt notifikasjon om tjeneste for bruker fid 28077820652"
* identifier[+].system = "EPJ" 
* identifier[=].value = "10cb070c-7369-29e2-583f-8557c780c2f6" //pasientGUID//
* identifier[+].system = "urn:oid:2.16.578.1.12.4.1.4.1" // Fixed value (code for norwegian person identifier "fødselsnummer")
* identifier[=].value = "16096055652" //fid//
* identifier[+].system = "urn:oid:2.16.578.1.12.4.1.4.1" // Fixed value (code for norwegian person identifier "fødselsnummer")
* identifier[=].value = "unspecified" //brukerNr//
* address.district.extension.url = "http://hl7.no/fhir/StructureDefinition/no-basis-bydelsnummer" 
* address.district.extension.valueCoding = urn:oid:2.16.578.1.12.4.1.1.3403#1986   // bydel //