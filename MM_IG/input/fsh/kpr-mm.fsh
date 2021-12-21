Alias: VOL = https://volven.no // 2.16.578.1.12.4.1.1.<kodeverksid>.//
Alias: SCT = http://snomed.info/sct

Profile: KPRMiniMeldingBundle1
Parent: Bundle
Id: kpr-mm-iplos-i-kpr-bundle1
Title: "KPR minimelding Melding"
Description: "Resource bundle for the mini-melding"
* ^status = #draft
* identifier 1..1 // meldingGUID //
* ^type = "Message"

Profile:  KPRMiniMeldingMessageHeaderCommon
Parent: MessageHeader
Description:   "KPR minimelding Melding Message Header"
Id: kpr-mm-iplos-i-kpr-common-header
Title:  "Mini melding Message Header til nivå 1"
* eventUri = http://hddr.no/iplosikpr_felles (exactly)
* ^eventCoding = "K"
* insert CommonHeaderLevel1
* focus only Reference(KPRMiniMeldingBundle2)
* sender only Reference(XPRmunicipalityOrganization)

Profile: XPRmunicipalityOrganization
Parent:  Organization // https://fhir.simplifier.net/HL7Norwayno-basis/StructureDefinition/no-basis-Organization//  //http://hl7.no/fhir/StructureDefinition/no-basis-Organization//
Id: kpr-mm-iplos-i-kpr-kommune
Title: "KPR minimelding Kommune"
Description: "Helse- og omsorgstjenester definert i helse og omsorgsloven"
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

Profile: KPRMiniMeldingBundle2
Parent: Bundle
Id: kpr-mm-iplos-i-kpr-bundle2
Title: "KPR minimelding Notifikasjon"
Description: "Resource bundle for the mini-melding notifikasjon"
* ^status = #draft
* identifier 1..1 // notigikasjonGUID //
* ^type = "Message"
* link.relation[0] 1..1 //notifikasjonForrigeGUID//
* link.relation[0] 1..1 //http://hddr.no/kpr-mm-iplos-i-kpr-bundle2/<GUID>
* link.relation[1] 0..1 //notifikasjonFRef//
* link.relation[1] 1..1 //http://hddr.no/kpr-mm-iplos-i-kpr-bundle2/<GUID>

Profile:  KPRMiniMeldingMessageHeaderSubmission
Parent: MessageHeader
Description:   "KPR minimelding Melding Submission Header"
Id: kpr-mm-iplos-i-kpr-submission-header
Title:  "Mini melding Message Header til original innrapportering"
* eventUri = http://hddr.no/iplosikpr_submission (exactly)
* ^eventCoding = "N"
* insert CommonHeaderNotification
* focus only Reference(kpr-mm-iplos-encounter)

Profile:  KPRMiniMeldingMessageHeaderErstatt
Parent: MessageHeader
Description:   "KPR minimelding Melding KorrigerErstatt Header"
Id: kpr-mm-iplos-i-kpr-replace-header
Title:  "Mini melding Message Header til korriger erstatt"
* eventUri = http://hddr.no/iplosikpr_replace (exactly)
* ^eventCoding = "M"
* insert CommonHeaderNotification
* focus only Reference(kpr-mm-iplos-encounter)

Profile:  KPRMiniMeldingMessageHeaderSuppler
Parent: MessageHeader
Description:   "KPR minimelding Melding KorrigerSuppler Header"
Id: kpr-mm-iplos-i-kpr-supplement-header
Title:  "Mini melding Message Header til korriger suppler"
* eventUri = http://hddr.no/iplosikpr_update (exactly)
* ^eventCoding = "T"
* insert CommonHeaderNotification
* focus only Reference(kpr-mm-iplos-encounter)

Profile:  KPRMiniMeldingMessageHeaderAnnuler
Parent: MessageHeader
Description:   "KPR minimelding Melding KorrigerSuppler Header"
Id: kpr-mm-iplos-i-kpr-void-header
Title:  "Mini melding Message Header til korriger annuller"
* eventUri = http://hddr.no/iplosikpr_void (exactly)
* ^eventCoding = "C"
* insert CommonHeaderNotification
* focus only Reference(kpr-mm-iplos-encounter)

Profile:  KPRMiniMeldingTjeneste
Parent: https://fhir.simplifier.net/HL7Norwayno-basis/StructureDefinition/no-basis-Encounter //http://hl7.no/fhir/StructureDefinition/no-basis-Encounter//
Description:   "KPR minimelding tjeneste generisk"
Id: kpr-mm-iplos-i-kpr-tjeneste
Title:  "Mini melding tjeneste payload"
* identifier[0] 1..1 //hendelseGUID//
* identifier[1] 1..1 //tjenesteID//
* serviceType from KPRMMtjenesteTypeVS //tjenesteType//
* class = 1 //not needed here - expanded code use needed in norsk profil or change to 0..1//
* period.start 1..1 //hendelseRegTid//
* participant.period.start 1..1 //hendelseDato//
* status = planned //not used by mini-melding//
* serviceProvider only Reference(kpr-mm-iplos-i-kpr-tjeneste-org)

Profile: KPRMiniMeldingServiceOrganization
Parent:  https://fhir.simplifier.net/HL7Norwayno-basis/StructureDefinition/no-basis-Organization //http://hl7.no/fhir/StructureDefinition/no-basis-Organization//
Id: kpr-mm-iplos-i-kpr-tjeneste-org
Title: "KPR minimelding utøvende organisasjon"
Description: "Organisasjonsnummer for organisasjon som utfører tjenesten"
* identifier:ENH 0..1 //kommuneNr//

Profile: XPRPatient
Parent:  https://fhir.simplifier.net/HL7Norwayno-basis/StructureDefinition/no-basis-Organization //http://hl7.no/fhir/StructureDefinition/no-basis-Patient//
Id: xpr-pasient
Title: "XPR bruker/pasient" //potentially XPR rather than IPLOS KPR?//
Description: "Bruker eller pasient"
* identifier[0] 1..1 //brukerNr//
* identifier[0].system 1..1 //??//
* identifier[1] 1..1 //fid//
* identifier[1].system 1..1 //typeID FNR etc. Volven 9032//
* identifier[2] 0..1 //pasientGUID//
* ^identifier[2].system = EPJ //???//
* address.no-basis-Address.extension.urbanDistrict from //TODO volven 3403//


ValueSet: KPRMM1eventCodingVS
Id: Volven-IPLOSiKPR-7371
Title: "Status notifikasjon"
Description: "Angivelse av status på denne innrapoerterte notifikasjon"
* VOL#7371:K "Melding for kontinuerlig oppdatering"

ValueSet: KPRMM2eventCodingVS
Id: Volven-IPLOSiKPR-7316
Title: "Status notifikasjon"
Description: "Angivelse av status på denne innrapoerterte notifikasjon"
* VOL#7316:N "Original"
* VOL#7316:M "KorrigerErstatt"
* VOL#7316:T "KorrigerSuppler"
* VOL#7316:C "KorrigerAnnuller"

ValueSet: KPRMMKontaktTypeVS
Id: Volven-IPLOSiKPR-8471
Title: "Kontaktperson type"
Description: "Hvilken sektor innen Helseinstitusjon eller tjeneste innen den kommunale helsetjenesten denne kontaktperson dekker."
* VOL#8471:#1 "Teknisk produksjon"
* VOL#8471:#15 "EPJ-leverandør, meldingsvalidering"

ValueSet: KPRMMtjenesteTypeVS
Id: Volven-IPLOSiKPR-9151
Title: "Tjenestetype i helse- og omsorgstjenesten"
Description: "Tjenester som skal rapporteres til KPR i helse- og omsorgsmelding"
* VOL#9151:#18 "Tidsbegrenset opphold - utredning/behandling"
* VOL#9151:#19 "Tidsbegrenset opphold - habilitering/rehabilitering"
* VOL#9151:#20 "Tidsbegrenset opphold - annet"
* VOL#9151:#21 "Langtidsopphold i institusjon"
* VOL#9151:#29 "Bolig som kommunen disponerer for helse- og omsorgsformål"

