Alias: VOL = https://volven.no // urn:oid:2.16.578.1.12.4.1.1.<kodeverksid>.//
Alias: SCT = http://snomed.info/sct

Profile: KPRMiniMeldingBundle1
Parent: Bundle
Id: kpr-mm-iplos-i-kpr-bundle1
Title: "KPR minimelding Melding"
Description: "Resource bundle for the mini-melding"
* ^status = #draft
* ^experimental = true
* identifier MS // meldingGUID //

Profile:  KPRMiniMeldingMessageHeader
Parent: MessageHeader
Description:   "KPR minimelding Melding Message Header"
Id: kpr-mm-iplos-i-kpr-common-header
Title:  "Mini melding Message Header til nivå 1"
//* eventUri = http://hddr.no/iplosikpr_felles (exactly) //
* ^status = #draft
* ^experimental = true
* eventCoding ^code.system = "urn:oid:2.16.578.1.12.4.1.1.7371"
* eventCoding ^code.display = "Volven kodeverk 7371 - Meldingstype"
* eventCoding ^code.code = #K "Original"
* destination MS //toHerID//
* source.name MS //navnEPJ//
* source.contact.value MS //leverandor//
* source.software MS  //versjonEPJ//
* source.version MS //versjonUt//
* source.endpoint MS //fromHerID//
* focus only Reference(Bundle) // KPRMiniMeldingBundle2 //
* sender only Reference(Organization) // KPRmunicipalityOrganization //

Profile: XPRmunicipalityOrganization
Parent:  Organization // https://fhir.simplifier.net/HL7Norwayno-basis/StructureDefinition/no-basis-Organization//  //http://hl7.no/fhir/StructureDefinition/no-basis-Organization//
Id: kpr-mm-iplos-i-kpr-kommune
Title: "KPR minimelding Kommune"
Description: "Helse- og omsorgstjenester definert i helse og omsorgsloven"
* ^status = #draft
* ^experimental = true
* identifier.system = "urn:oid:2.16.578.1.12.4.1.1.3403" (exactly)
* identifier.value MS //kommuneNr//
// TODO Contact slicing //
// Consider profiling to only accepted Volven 8471 codes //
* contact.name 0..1 //kontPerson//
* contact.purpose ^code.system = "urn:oid:2.16.578.1.12.4.1.1.8471"
* contact.purpose ^code.display = "Volven kodeverk 8471 - Kontaktperson type"
// telecom no constraints  meldTelefon, meldEpost1 & meldEpost2 //

Profile: KPRMiniMeldingBundle2
Parent: Bundle
Id: kpr-mm-iplos-i-kpr-bundle2
Title: "KPR minimelding Notifikasjon"
Description: "Resource bundle for the mini-melding notifikasjon"
* ^status = #draft
* ^experimental = true
* identifier MS // notigikasjonGUID //
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
* ^status = #draft
* ^experimental = true
* eventUri = "http://hddr.no/iplosikpr_submission" (exactly)
* eventCoding ^code.system = "urn:oid:2.16.578.1.12.4.1.1.7316"
* eventCoding ^code.display = "Volven kodeverk 7316 - status notifikasjon"
* eventCoding ^code.code = #N "Original"
* focus only Reference(Encounter)

Profile:  KPRMiniMeldingMessageHeaderErstatt
Parent: MessageHeader
Description:   "KPR minimelding Melding KorrigerErstatt Header"
Id: kpr-mm-iplos-i-kpr-replace-header
Title:  "Mini melding Message Header til korriger erstatt"
* ^status = #draft
* ^experimental = true
* eventUri = "http://hddr.no/iplosikpr_replace" (exactly)
* eventCoding ^code.system = "urn:oid:2.16.578.1.12.4.1.1.7316"
* eventCoding ^code.display = "Volven kodeverk 7316 - status notifikasjon"
* eventCoding ^code.code = #M "KorrigerErstatt"
* focus only Reference(Encounter)

Profile:  KPRMiniMeldingMessageHeaderSuppler
Parent: MessageHeader
Description:   "KPR minimelding Melding KorrigerSuppler Header"
Id: kpr-mm-iplos-i-kpr-supplement-header
Title:  "Mini melding Message Header til korriger suppler"
* ^status = #draft
* ^experimental = true
* eventUri = "http://hddr.no/iplosikpr_update" (exactly)
* eventCoding ^code.display = "Volven kodeverk 7316 - status notifikasjon"
* eventCoding ^code.code = #T "KorrigerSuppler"
* focus only Reference(Encounter) // KPRMiniMeldingTjeneste //

Profile:  KPRMiniMeldingMessageHeaderAnnuler
Parent: MessageHeader
Description:   "KPR minimelding Melding KorrigerSuppler Header"
Id: kpr-mm-iplos-i-kpr-void-header
Title:  "Mini melding Message Header til korriger annuller"
* ^status = #draft
* ^experimental = true
* eventUri = "http://hddr.no/iplosikpr_void" (exactly)
* eventCoding ^code.display = "Volven kodeverk 7316 - status notifikasjon"
* eventCoding ^code.code = #C "KorrigerAnnuller"
* focus only Reference(Encounter)

// payload for a notification of service//
Profile:  KPRMiniMeldingTjeneste
Parent: Encounter // https://fhir.simplifier.net/HL7Norwayno-basis/StructureDefinition/no-basis-Encounter //http://hl7.no/fhir/StructureDefinition/no-basis-Encounter//
Description:   "KPR minimelding tjeneste generisk"
Id: kpr-mm-iplos-i-kpr-tjeneste
Title:  "Mini melding tjeneste payload"
* ^status = #draft
* ^experimental = true
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
* serviceType ^code.system = "urn:oid:2.16.578.1.12.4.1.1.9151"
* serviceType ^code.display = "Volven kodeverk 9151 - Tjenestetype i helse- og omsorgstjenesten"
/* tjenesteType - TODO consider profiling to restrict allowable codes:
* #18 "Tidsbegrenset opphold - utredning/behandling"
* #19 "Tidsbegrenset opphold - habilitering/rehabilitering"
* #20 "Tidsbegrenset opphold - annet"
* #21 "Langtidsopphold i institusjon"
* #29 "Bolig som kommunen disponerer for helse- og omsorgsformål"
*/ 
* class = #HH // not used //
* period.start MS //hendelseRegTid//
* participant.period.start 1..1 //hendelseDato//
* serviceProvider only Reference(Organization) // kpr-mm-iplos-i-kpr-tjeneste-org //

// org //
Profile: KPRMiniMeldingServiceOrganization
Parent:  Organization // https://fhir.simplifier.net/HL7Norwayno-basis/StructureDefinition/no-basis-Organization //http://hl7.no/fhir/StructureDefinition/no-basis-Organization//
Id: kpr-mm-iplos-i-kpr-tjeneste-org
Title: "KPR minimelding utøvende organisasjon"
Description: "Organisasjonsnummer for organisasjon som utfører tjenesten"
* ^status = #draft
* ^experimental = true
* identifier MS //kommuneNr//

// patient/user - probably not needed - IG can use example instance //
Profile: XPRPatient
Parent:  Patient // https://fhir.simplifier.net/HL7Norwayno-basis/StructureDefinition/no-basis-Patient //http://hl7.no/fhir/StructureDefinition/no-basis-Patient//
Id: xpr-pasient
Title: "XPR bruker/pasient" //potentially XPR rather than IPLOS KPR?//
Description: "Bruker eller pasient"
* ^status = #draft
* ^experimental = true
/* 
identifiers are sliced to provide
brukerNr, fid, FNR etc. Volven 9032 
additional id needed for pasientGUID from EPJ
This slicing copied from no-basis-patient but should be changed to reference the real version
This is missing inclusion of SE, DK numbers - what about the TIN tax id?//
*/
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^short = "Identifier for this patient"
* identifier ^definition = "An identifier for this patient. Should be at Fødselsnummer, Felles hjelpenummer, D-nummer or locally assigned H-nummer"
* identifier contains
    FNR 0..* and
    FHN 0..* and
    DNR 0..* and
    HNR 0..*
* identifier[FNR] ^short = "Norwegian FNR"
* identifier[FNR] ^definition = "Fødselsnummer for the patient. Fødselsnummer as one of the possible patient identifier, should at least be sent unless there is a reason not to. Reasons for not sending the Fødselsnummer include but are not limited to, research and apps without a contract for processing data.\r\n\r\nMultiple FNR can exist for a person. If several FNR is provided the time period that each identifier is valid should be provided. No information about period is required when only one FNR is provided."
* identifier[FNR].system 1..
* identifier[FNR].system = "urn:oid:2.16.578.1.12.4.1.4.1" (exactly)
* identifier[FNR].system ^short = "Identification of the Norwegian FNR"
* identifier[FNR].system ^definition = "Identifies that this is a Norwegian Fødselsnummer"
* identifier[FNR].value 1..
* identifier[FNR].value ^short = "The actual Fødselsnummer"
* identifier[FNR].value ^definition = "The Norwegian Fødselsnummer"
* identifier[FNR].value ^alias = "Fødselsnummer"
* identifier[FNR].value ^example.label = "Fødselsnummer"
* identifier[FNR].value ^example.valueString = "13057444850"
* identifier[FHN] ^short = "Felles hjelpenummer used for the patient"
* identifier[FHN] ^definition = "Felles hjelpenummer for the patient. Felles hjelpenummer as one of the possible patient identification numbers. The norwegian Felles hjelpenummer shoud only be used when the Fødselsnummer og D-number is unknown."
* identifier[FHN].system 1..
* identifier[FHN].system = "urn:oid:2.16.578.1.12.4.1.4.3" (exactly)
* identifier[FHN].system ^short = "Identification of the Norwegian felles hjelpenummer"
* identifier[FHN].system ^definition = "Norwegian felles hjelpenummer"
* identifier[FHN].value 1..
* identifier[FHN].value ^short = "The actual Hjelpenummer"
* identifier[FHN].value ^definition = "The actual Norwegian Hjelpenummer"
* identifier[DNR] ^short = "The D-nummer of the patient"
* identifier[DNR] ^definition = "The D-nummer of the patient. (assigned by the norwegian Skatteetaten)"
* identifier[DNR].system 1..
* identifier[DNR].system = "urn:oid:2.16.578.1.12.4.1.4.2" (exactly)
* identifier[DNR].system ^short = "The identification of the D-nummer"
* identifier[DNR].system ^definition = "The identification of the Norwegian D-nummer"
* identifier[DNR].value 1..
* identifier[DNR].value ^short = "The actual D-nummer"
* identifier[DNR].value ^definition = "The actual Norwegian D-nummer"
* identifier[HNR] ^short = "A locally assigned H-nummer"
* identifier[HNR] ^definition = "A locally assigned H-nummer. If this identifier is used, information about the assigner is mandatory."
* identifier[HNR].type.coding.system 1..
* identifier[HNR].type.coding.system = "urn:oid:2.16.578.1.12.4.1.1.8327" (exactly)
* identifier[HNR].type.coding.system ^definition = "CodeSystem on Volven for official personal identifiers.\r\nThe identification of the code system that defines the meaning of the symbol in the code."
* identifier[HNR].type.coding.code 1..
* identifier[HNR].type.coding.code = #HNR (exactly)
* identifier[HNR].type.coding.code ^definition = "The code for local Hjelpenummer in the CodeSystem\r\n\r\nA symbol in syntax defined by the system. The symbol may be a predefined code or an expression in a syntax defined by the coding system (e.g. post-coordination)."
* identifier[HNR].system = "HNR" (exactly)
* identifier[HNR].value 1..
* identifier[HNR].value ^definition = "The actual Hjelpenummer.\r\n\r\nThe portion of the identifier typically relevant to the user and which is unique within the context of the system."
* identifier[HNR].assigner 1..
* identifier[HNR].assigner ^definition = "Assigner is mandatory for localy assigne Hjelpenummer.\r\n\r\nOrganization that issued/manages the identifier."
/* bydel is added in the example from the no-basis extension:
* address.district.extension.url = "http://hl7.no/fhir/StructureDefinition/no-basis-bydelsnummer" 
* address.district.extension.valueCoding = urn:oid:2.16.578.1.12.4.1.1.3403#7   // bydel //
*/