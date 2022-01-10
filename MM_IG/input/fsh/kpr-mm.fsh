Alias: VOL = https://volven.no // 2.16.578.1.12.4.1.1.<kodeverksid>.//
Alias: SCT = http://snomed.info/sct

Profile: KPRMiniMeldingBundle1
Parent: Bundle
Id: kpr-mm-iplos-i-kpr-bundle1
Title: "KPR minimelding Melding"
Description: "Resource bundle for the mini-melding"
* ^status = #draft
* identifier 1..1 // meldingGUID //
/* see example instance for these details:
* destination 1..1 //to be defined//
* source.name 1..1 //navnEPJ//
* source.contact.value 1..1 //leverandor//
* source.software 1..1  //versjonEPJ//
* source.version 1..1 //versjonUt//
* source.endpoint 1..1 //to be defined//
* destination.name 1..1 //versjonUt since this is a string - simpler than referring to a Device//
*/

Profile:  KPRMiniMeldingMessageHeader
Parent: MessageHeader
Description:   "KPR minimelding Melding Message Header"
Id: kpr-mm-iplos-i-kpr-common-header
Title:  "Mini melding Message Header til nivå 1"
//* eventUri = http://hddr.no/iplosikpr_felles (exactly) //
* eventCoding = #K
* focus only Reference(Bundle) // KPRMiniMeldingBundle2 //
* sender only Reference(Organization) // KPRmunicipalityOrganization //

Profile: XPRmunicipalityOrganization
Parent:  Organization // https://fhir.simplifier.net/HL7Norwayno-basis/StructureDefinition/no-basis-Organization//  //http://hl7.no/fhir/StructureDefinition/no-basis-Organization//
Id: kpr-mm-iplos-i-kpr-kommune
Title: "KPR minimelding Kommune"
Description: "Helse- og omsorgstjenester definert i helse og omsorgsloven"
* identifier 1..1 //kommuneNr//
// TODO Contact slicing //
* contact.name 0..1 //kontPerson//
* contact.purpose from KPRMMKontaktTypeVS //typeKontaktperson//
// telecom no constraints  meldTelefon, meldEpost1 & meldEpost2 //

Profile: KPRMiniMeldingBundle2
Parent: Bundle
Id: kpr-mm-iplos-i-kpr-bundle2
Title: "KPR minimelding Notifikasjon"
Description: "Resource bundle for the mini-melding notifikasjon"
* ^status = #draft
* identifier 1..1 // notigikasjonGUID //
* type = #Message
// link are sliced - see example //
* link 0..*
// link.relation  #previous = notifikasjonForrigeGUID #related = notifikasjonRef//
// link.uri  "http://hddr.no/kpr-mm-iplos-i-kpr-bundle2/<GUID>" //

// These are the 'statusNotifikasjon' types from Volven 7316 targetd at a URI endpoint event //
Profile:  KPRMiniMeldingMessageHeaderSubmission
Parent: MessageHeader
Description: "KPR minimelding Melding Submission Header"
Id: kpr-mm-iplos-i-kpr-submission-header
Title:  "Mini melding Message Header til original innrapportering"
* eventUri = "http://hddr.no/iplosikpr_submission" (exactly)
* eventCoding = #N
* focus only Reference(Encounter)

Profile:  KPRMiniMeldingMessageHeaderErstatt
Parent: MessageHeader
Description:   "KPR minimelding Melding KorrigerErstatt Header"
Id: kpr-mm-iplos-i-kpr-replace-header
Title:  "Mini melding Message Header til korriger erstatt"
* eventUri = "http://hddr.no/iplosikpr_replace" (exactly)
* eventCoding = #M
* focus only Reference(Encounter)

Profile:  KPRMiniMeldingMessageHeaderSuppler
Parent: MessageHeader
Description:   "KPR minimelding Melding KorrigerSuppler Header"
Id: kpr-mm-iplos-i-kpr-supplement-header
Title:  "Mini melding Message Header til korriger suppler"
* eventUri = "http://hddr.no/iplosikpr_update" (exactly)
* eventCoding = #T
* focus only Reference(Encounter) // KPRMiniMeldingTjeneste //

Profile:  KPRMiniMeldingMessageHeaderAnnuler
Parent: MessageHeader
Description:   "KPR minimelding Melding KorrigerSuppler Header"
Id: kpr-mm-iplos-i-kpr-void-header
Title:  "Mini melding Message Header til korriger annuller"
* eventUri = "http://hddr.no/iplosikpr_void" (exactly)
* eventCoding = #C
* focus only Reference(Encounter)

// payload for a notification of service//
Profile:  KPRMiniMeldingTjeneste
Parent: Encounter // https://fhir.simplifier.net/HL7Norwayno-basis/StructureDefinition/no-basis-Encounter //http://hl7.no/fhir/StructureDefinition/no-basis-Encounter//
Description:   "KPR minimelding tjeneste generisk"
Id: kpr-mm-iplos-i-kpr-tjeneste
Title:  "Mini melding tjeneste payload"
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains
    hendelseGUID 1..1 and
    tjenesteID 1..1
* status 1..1 /* defines type of notification:
   'arrived' = TjenesteStart; 
   'onleave' = Midlertidlig stopp fra; 
   'planned' = Midlertidlig stopp til 
   'finished' = Tjeneste Slutt
   'entered-in-error' = Tjenesteutfører endret   */
* serviceType from KPRMMtjenesteTypeVS //tjenesteType//
* class = #HH // not used //
* period.start 1..1 //hendelseRegTid//
* participant.period.start 1..1 //hendelseDato//
* serviceProvider only Reference(Organization) // kpr-mm-iplos-i-kpr-tjeneste-org //

// org //
Profile: KPRMiniMeldingServiceOrganization
Parent:  Organization // https://fhir.simplifier.net/HL7Norwayno-basis/StructureDefinition/no-basis-Organization //http://hl7.no/fhir/StructureDefinition/no-basis-Organization//
Id: kpr-mm-iplos-i-kpr-tjeneste-org
Title: "KPR minimelding utøvende organisasjon"
Description: "Organisasjonsnummer for organisasjon som utfører tjenesten"
* identifier 1..1 //kommuneNr//

// patient/user //
Profile: XPRPatient
Parent:  Patient // https://fhir.simplifier.net/HL7Norwayno-basis/StructureDefinition/no-basis-Patient //http://hl7.no/fhir/StructureDefinition/no-basis-Patient//
Id: xpr-pasient
Title: "XPR bruker/pasient" //potentially XPR rather than IPLOS KPR?//
Description: "Bruker eller pasient"
/* identifiers are sliced to provide
* identifier[0] 1..1 //brukerNr//
* identifier[0].system 1..1 //??//
* identifier[1] 1..1 //fid//
* identifier[1].system 1..1 //typeID FNR etc. Volven 9032//
* identifier[2] 0..1 //pasientGUID//
* identifier[2].system = #EPJ //???//
* address.no-basis-Address.extension.urbanDistrict from TODO volven 3403
*/
