Instance: 100mmMessageBundle1Fid638
InstanceOf: KPRMiniMeldingBundle1
Usage: #example
Description: "Enkelt notifikasjon om tjeneste for bruker fid 28077820638 - melding nivå 1"
* meta.id = "70e5a9f4-971b-44c5-807f-065400d60b56" // messageId //
* identifier.value = "8cca8e82-0b9b-1b37-92ee-b1ff0d2e0a37" // lokalident //
* type = #message // interpret as "IPLOS" at the receiving server via meta-profile? //
* identifier.value = "56.0.0" // versjon //
* entry.resource = 110mmMessageHeaderFid638
* entry.fullUrl = "http://hddr.no/fhir/MessageHeader/minimeldingMessageHeader1/1"
* entry.resource = 111XPRmunicipalityOrganizationFid638

// level 1 message header //
Instance: 110mmMessageHeaderFid638
InstanceOf: KPRMiniMeldingMessageHeader
Usage: #inline
Description: "Enkelt notifikasjon om tjeneste for bruker fid 28077820638 melding header nivå 1"
* eventCoding = #K "Original"
* destination.endpoint = "8139520" // toHerID //
* source.name = "McGlynn - Schinner" // navnEPJ //
* source.contact.value = "Johnston, Wilkinson and Kilback" // leverandør //
* source.software = "4.8.4" // versjonEPJ //
* source.endpoint = "8139519" //from HerID //
* source.version = "5.2.1" // versjonUt //
* sender.reference = "111XPRmunicipalityOrganizationFid638" // references to org //
* focus = Reference(120mmMessageBundle2Fid638) // references to first notification bundle //

// org/kommmune and contact details //
Instance: 111XPRmunicipalityOrganizationFid638
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

