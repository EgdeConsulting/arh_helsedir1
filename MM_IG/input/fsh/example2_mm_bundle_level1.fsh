Instance: 200mmMessageBundle1Fid721
InstanceOf: KPRMiniMeldingBundle1
Usage: #example
Description: "Multi notifikasjon om tjeneste for bruker fid 04067359721 - melding nivå 1"
* meta.id = "748b-8352b637-480f-8454-9f3bb761e932" // messageId //
* identifier.value = "676d9e02-ba31-40f4-7f40-7936e4ca01a0" // lokalident //
* type = #message // interpret as "IPLOS" at the receiving server via meta-profile? //
* identifier.value = "56.0.0" // versjon //
* entry.resource = 201mmMessageHeaderFid721
* entry.fullUrl = "http://hddr.no/fhir/MessageHeader/minimeldingMessageHeader1/1"
* entry.resource = 202XPRmunicipalityOrganizationFid721

// level 1 message header //
Instance: 201mmMessageHeaderFid721
InstanceOf: KPRMiniMeldingMessageHeader
Usage: #inline
Description: "Enkelt notifikasjon om tjeneste for bruker fid 28077820721 melding header nivå 1"
* eventCoding = #K "Original"
* destination.endpoint = "8139520" // toHerID //
* source.name = "Bogisich, Yundt and Balistreri" // navnEPJ //
* source.contact.value = "O'Kon Group" // leverandør //
* source.software = "6.9.2" // versjonEPJ //
* source.endpoint = "8139519" //from HerID //
* source.version = "3.2.9" // versjonUt //
* sender.reference = "202XPRmunicipalityOrganizationFid721" // references to org //
* focus = Reference(220mmMessageBundle2Fid721) // references to first notification bundle //
* focus = Reference(220mmMessageBundle2Fid652) // references to second notification bundle //

// org/kommmune and contact details //
Instance: 202XPRmunicipalityOrganizationFid721
InstanceOf: XPRmunicipalityOrganization
Usage: #example
Description: "Enkelt notifikasjon om tjeneste for bruker fid 28077820721 - organisasjonsdetaljer nivå 2"
* identifier.system = "urn:oid:2.16.578.1.12.4.1.1.3403"
* identifier.value = "1816" //kommuneNr//
* contact[0].name.text = "Fredrik Jørgensen" //kontPerson//
* contact[0].purpose = #16 //typeKontaktperson//
* contact[0].telecom[0].system = #phone
* contact[0].telecom[0].value = "+47 40 95 72 87"  //meldTelefon// 
* contact[0].telecom[1].system = #email
* contact[0].telecom[1].value = "Fredrik_Roed@gmail.com" //meldEpost1//
* contact[0].telecom[2].system = #email
* contact[0].telecom[2].value = "Erik_Jacobsen53@hotmail.com" //meldEpost2//
* contact[1].name.text = "Odd Ryan" //kontPerson//
* contact[1].purpose = #17 //typeKontaktperson//
* contact[1].telecom.value = "+47 84 87 09 41"  //meldTelefon// 
* contact[1].telecom[0].system = #email
* contact[1].telecom[0].value = "Malin37@gmail.com" //meldEpost1//
* contact[1].telecom[1].system = #email
* contact[1].telecom[1].value = "Ingrid_Arnesen94@yahoo.com" //meldEpost2//