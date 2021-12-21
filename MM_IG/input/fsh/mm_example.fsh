Instance: minimeldingMessageBundleExample1
InstanceOf: KPRMiniMeldingBundle1
Usage: #example
Description: "Enkelt notifikasjon om tjeneste for bruker fid 28077820638"
* identifier.value = ""70e5a9f4-971b-44c5-807f-065400d60b56""
* type = #message // interpret as "IPLOS" at the receiving server via meta-profile? //
* meta.id = "56.0.0" // can this be used for this purpose? //
* destination = "8139520"
* source.name = "Johnston, Wilkinson and Kilback"
* source.software = "McGlynn - Schinner"
* source.version = "4.8.4"
* source.endpoint = http://acme.com/epj
* destination.name = "5.2.1"
* focus only Reference(KPRMiniMeldingBundle2)
* sender only Reference(XPRmunicipalityOrganization)
// level 1 message header //
* entry[0].fullUrl = "http://hddr.no/fhir/MessageHeader/minimeldingMessageBundleExample1"
* entry[0].resource.resourceType = "MessageHeader"
* entry[0].resource.id = "minimeldingMessageHeaderExample"
* entry[0].resource.focus[0].fullUrl = "http://hddr.no/fhir/MessageHeader/minimeldingNotoficationMessageBundleExample1"
* entry[0].resource.focus[0].resourceType = "Bundle"
// level 1 referral to Notification bundle //
* entry[1].fullUrl = "http://hddr.no/fhir/MessageHeader/minimeldingNotificationBundleExample1"
* entry[1].resource.resourceType = "MessageHeader"
* entry[1].resource.id = "minimeldingMessageHeaderExample"
* entry[1].resource.eventUri = http://hddr.no/iplosikpr_felles (exactly)
* entry[1].resource.eventCoding = "K"

/* profile for 
* identifier 1..1 // notigikasjonGUID //
* ^type = "Message"
* link.relation[0] 1..1 //notifikasjonForrigeGUID//
* link.relation[0] 1..1 //http://hddr.no/kpr-mm-iplos-i-kpr-bundle2/<GUID>
* link.relation[1] 0..1 //notifikasjonFRef//
* link.relation[1] 0..1 //http://hddr.no/kpr-mm-iplos-i-kpr-bundle2/<GUID>
*/

* identifier:ENH 1..1 //kommuneNr//
* contact[0].name 1..1 //kontPerson//
* contact[0].purpose from KPRMMKontaktTypeVS //typeKontaktperson//
* contact[0].telecom.ContactPoint.system = phone
* contact[0].telecom.ContactPoint.value 1..1  //meldTelefon//
* contact[0].telecom.ContactPoint.system = email
* contact[0].telecom.ContactPoint.value 1..1 //meldEpost1//
* contact[1].name 0..1 //kontPerson//
* contact[1].purpose from KPRMMKontaktTypeVS //typeKontaktperson//
* contact[1].telecom.ContactPoint.system = email
* contact[1].telecom.ContactPoint.value 0..1 //meldEpost2//



Instance: meldingheader1-example-1
InstanceOf: KPRMiniMeldingBundle1
Usage: #example
Description: "Enkelt melding om tjeneste for bruker fid 28077820638"

  "fromHerId": 8139519,
        "toHerId": 8139520,
        "messageType": "IPLOS",
        "messageVersion": "56.0.0",
        "messageId": "70e5a9f4-971b-44c5-807f-065400d60b56"

/* XPR version as JSON
{
    "messageHeader": {
        "fromHerId": 8139519,
        "toHerId": 8139520,
        "messageType": "IPLOS",
        "messageVersion": "56.0.0",
        "messageId": "70e5a9f4-971b-44c5-807f-065400d60b56"
    },
    "payload": {
        "notifikasjon": [
            {
                "midlertidigStoppTil": {
                    "bruker": {
                        "pasientGUID": "538bad1b-6bb8-ec67-8f4e-27d4f430c087",
                        "brukerNr": "3397091298",
                        "bydel": "   7",
                        "fid": "28077820638",
                        "typeID": "5"
                    },
                    "hendelseRegTid": "2021-12-05T13:54:58.8866505+00:00",
                    "hendelseDato": "2021-12-05T16:31:15.9323956+00:00",
                    "tjenesteID": "1383",
                    "hendelseGUID": "aa88951c-0b23-62ad-022d-260650878388",
                    "midlertidigStoppID": "4578b89c-91ed-f1e0-a8d0-c549a1c8aad3"
                },
                "statusNotifikasjon": "N",
                "notifikasjonTid": "2021-12-06T06:37:30.7379426+00:00",
                "notifikasjonGUID": "e86318da-b16b-5023-0e7a-d129b6835feb",
                "notifikasjonForrigeGUID": "00000000-0000-0000-0000-000000000000",
                "notifikasjonLopeNr": "3"
            }
        ],
        "notifikasjonSpecified": true,
        "kontaktperson": [
            {
                "kontPerson": "Sofie Haugen",
                "meldTelefon": "+47 19 96 36 67",
                "meldEpost1": Karoline_Eide@gmail.com,
                "meldEpost2": Emma.Stensrud50@yahoo.com,
                "typeKontaktperson": "16"
            },
            {
                "kontPerson": "Lars Berge",
                "meldTelefon": "+47 78 91 29 29",
                "meldEpost1": Sindre99@gmail.com,
                "meldEpost2": Sindre.Edvardsen92@gmail.com,
                "typeKontaktperson": "17"
            }
        ],
        "kommune": [
            {
                "kommuneNr": "1857"
            }
        ],
        "versjon": "56.0.0",
        "meldingstype": "K",
        "leverandor": "Johnston, Wilkinson and Kilback",
        "navnEPJ": "McGlynn - Schinner",
        "versjonEPJ": "4.8.4",
        "versjonUt": "5.2.1",
        "lokalident": "8cca8e82-0b9b-1b37-92ee-b1ff0d2e0a37"
    }
}

*/