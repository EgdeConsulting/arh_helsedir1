Instance: 120mmMessageBundle2Fid638 // Bundle of type Message for level 2 notifikasjon//
InstanceOf: KPRMiniMeldingBundle2
Usage: #example
Description: "Enkelt notifikasjon om tjeneste for bruker fid 28077820638 - notifikasjon bundle nivå 2"
* identifier.value = "e86318da-b16b-5023-0e7a-d129b6835feb" // notigikasjonGUID //
* type = #Message
* link[0].relation = #previous // notifikasjonForrigeGUID //
* link[0].url = "http://hddr.no/kpr-mm-iplos-i-kpr-bundle2/00000000-0000-0000-0000-000000000000"
* link[1].relation = #related // notifikasjonFRef //
* link[1].url = "http://hddr.no/kpr-mm-iplos-i-kpr-bundle2/00000000-0000-0000-0000-000000000000"
* timestamp = "2021-12-06T06:37:30.7379426+00:00" // notifikasjonTid //
* entry.fullUrl = "http://hddr.no/fhir/MessageHeader/minimeldingMessageHeader1/1"
* entry.resource = 121mmMessageHeader2Fid638

// level 2 message header //
Instance: 121mmMessageHeader2Fid638
InstanceOf: KPRMiniMeldingMessageHeaderSubmission
Usage: #inline
Description: "Enkelt notifikasjon om tjeneste for bruker fid 28077820638 melding header nivå 1"
* source.name = "Johnston, Wilkinson and Kilback"
* source.endpoint = "8139519"
* eventCoding = #N
* eventUri = "http://hddr.no/iplosikpr_submission"
* definition = "122mmMessageDefinitionFid638" // TODO should be a canonical reference //
* focus = Reference(130mmTjenesteFid638) // references to Encounter for this notification //

Instance: 122mmMessageDefinitionFid638
InstanceOf: MessageDefinition
Usage: #example
Description: "Provides the løpenummer"
* category = #notification
* version = "3" // løpenummer TODO this is being output as 0.1.0 even though defined as a string - very strange//
* status = #active
* eventCoding.system = "http://hddr.no/"
* eventCoding.code = #admin-notify
* date = "2021-12-06T06:37:30.7379426+00:00"

// Encounter level 3 //
Instance: 130mmTjenesteFid638
InstanceOf: KPRMiniMeldingTjeneste
Usage: #example
Description: "Enkelt notifikasjon om tjeneste for bruker fid 28077820638 - payload midlertidigStoppTil"
* identifier[+].type = #hendelseGUID 
* identifier[=].value = "aa88951c-0b23-62ad-022d-260650878388"
* identifier[+].type = #tjenesteID
* identifier[=].value = "1383"
* status = #planned // defines type of notification:'planned' = Midlertidlig stopp til //
// * serviceType from KPRMMtjenesteTypeVS tjenesteType not specified //
* class = #HH // not used //
* period.start = "2021-12-05T13:54:58.8866505+00:00" // hendelseRegTid //
* participant.period.start = "2021-12-05T16:31:15.9323956+00:00" //hendelseDato//
* subject = Reference(140XPRPatientFid638) // references to Patient //

// Patient level 4 //
Instance: 140XPRPatientFid638
InstanceOf: XPRPatient
Usage: #example
Description: "Enkelt notifikasjon om tjeneste for bruker fid 28077820638"
* identifier[+].system = "EPJ" 
* identifier[=].value = "538bad1b-6bb8-ec67-8f4e-27d4f430c087" //pasientGUID//
* identifier[+].system = "urn:oid:2.16.578.1.12.4.1.4.1" // Fixed value (code for norwegian person identifier "fødselsnummer")
* identifier[=].value = "3397091298" //fid//
* identifier[+].system = "urn:oid:2.16.578.1.12.4.1.4.1" // Fixed value (code for norwegian person identifier "fødselsnummer")
* identifier[=].value = "unspecified" //brukerNr//
* address.district.extension.url = "http://hl7.no/fhir/StructureDefinition/no-basis-bydelsnummer" 
* address.district.extension.valueCoding = urn:oid:2.16.578.1.12.4.1.1.3403#7   // bydel //