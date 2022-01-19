Instance: minimeldingMessageBundle1Example1
InstanceOf: KPRMiniMeldingBundle1
Usage: #example
Description: "Enkelt notifikasjon om tjeneste for bruker fid 28077820638 - melding nivå 1"
* meta.id = "70e5a9f4-971b-44c5-807f-065400d60b56" // messageId //
* identifier.value = "8cca8e82-0b9b-1b37-92ee-b1ff0d2e0a37" // lokalident //
* type = #message // interpret as "IPLOS" at the receiving server via meta-profile? //
* identifier.value = "56.0.0" // versjon //
* entry.resource = minimeldingMessageHeaderExample1
* entry.fullUrl = "http://hddr.no/fhir/MessageHeader/minimeldingMessageHeader1/1"

// level 1 message header //
Instance: minimeldingMessageHeaderExample1
InstanceOf: KPRMiniMeldingMessageHeader
Usage: #example
Description: "Enkelt notifikasjon om tjeneste for bruker fid 28077820638 melding header nivå 1"
* eventCoding = #K
* destination.endpoint = "8139520" // toHerID //
* source.name = "McGlynn - Schinner" // navnEPJ //
* source.contact.value = "Johnston, Wilkinson and Kilback" // leverandør //
* source.software = "4.8.4" // versjonEPJ //
* source.endpoint = "8139519" //from HerID //
* source.version = "5.2.1" // versjonUt //
* sender.reference = "XPRmunicipalityOrganizationExample1" // references to org //
* focus[0].reference = "KPRminiMeldingMessageBundle2Example1" // references to first notification bundle //

// org/kommmune and contact details //
Instance: XPRmunicipalityOrganizationExample1
InstanceOf: XPRmunicipalityOrganization
Usage: #example
Description: "Enkelt notifikasjon om tjeneste for bruker fid 28077820638 - organisasjonsdetaljer nivå 2"
* identifier.system = "urn:oid:2.16.578.1.12.4.1.1.3403"
* identifier.value = "1857" //kommuneNr//
* contact[0].name.text = "Sofie Haugen" //kontPerson//
* contact[0].purpose = #16 //typeKontaktperson//
* contact[0].telecom[0].system = #phone
* contact[0].telecom[0].value = "+47 19 96 36 67"  //meldTelefon// 
* contact[0].telecom[1].system = #email
* contact[0].telecom[1].value = "Karoline_Eide@gmail.com" //meldEpost1//
* contact[0].telecom[2].system = #email
* contact[0].telecom[2].value = "Emma.Stensrud50@yahoo.co" //meldEpost2//
* contact[1].name.text = "Lars Berge" //kontPerson//
* contact[1].purpose = #17 //typeKontaktperson//
* contact[1].telecom.value = "+47 78 91 29 29"  //meldTelefon// 
* contact[1].telecom[0].system = #email
* contact[1].telecom[0].value = "Sindre99@gmail.com" //meldEpost1//
* contact[1].telecom[1].system = #email
* contact[1].telecom[1].value = "Sindre.Edvardsen92@gmail.com" //meldEpost2//

// Bundle of type Message for level 2 notifikasjon//
Instance: KPRminiMeldingMessageBundle2Example1
InstanceOf: KPRMiniMeldingBundle2
Usage: #example
Description: "Enkelt notifikasjon om tjeneste for bruker fid 28077820638 - notifikasjon bundle nivå 2"
* identifier.value = "e86318da-b16b-5023-0e7a-d129b6835feb" // notigikasjonGUID //
* type = #Message
* link[0].relation = #previous // notifikasjonForrigeGUID //
* link[0].url = "http://hddr.no/kpr-mm-iplos-i-kpr-bundle2/00000000-0000-0000-0000-000000000000"
* link[1].relation = #related // notifikasjonFRef //
* link[1].url = "http://hddr.no/kpr-mm-iplos-i-kpr-bundle2/00000000-0000-0000-0000-000000000000"
* entry.resource = minimeldingMessageHeader2Example1
* entry.fullUrl = "http://hddr.no/fhir/MessageHeader/minimeldingMessageHeader1/1"
* timestamp = "2021-12-06T06:37:30.7379426+00:00" // notifikasjonTid //

// level 2 message header //
Instance: minimeldingMessageHeader2Example1
InstanceOf: KPRMiniMeldingMessageHeaderSubmission
Usage: #example
Description: "Enkelt notifikasjon om tjeneste for bruker fid 28077820638 melding header nivå 1"
* source.name = "Johnston, Wilkinson and Kilback"
* source.endpoint = "8139519"
* eventCoding = #N
* eventUri = "http://hddr.no/iplosikpr_submission"
* definition = "minimeldingMessageDefinitionExample1"
* focus[0].reference = "KPRMiniMeldingTjenesteExample1" // references to Encounter for this notification //

Instance: minimeldingMessageDefinitionExample1
InstanceOf: MessageDefinition
Usage: #example
Description: "Enkelt notifikasjon om "
* category = #notification
* version = "3" // løpenummer //
* status = #active
* eventCoding.system = "http://hddr.no/"
* eventCoding.code = #admin-notify
* date = "2021-12-06T06:37:30.7379426+00:00"

// Encounter level 3 //
Instance: KPRMiniMeldingTjenesteExample1
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

// Patient level 4 //
Instance: XPRPatientExample1
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