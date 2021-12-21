//source based on https://github.com/nightingaleproject/vital_records_fhir_messaging_ig/blob/main/input/fsh/DEF_Rulesets.fsh //

RuleSet: CommonBundleElements
* ^status = #draft
* type  = #message
* id 1..1
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry ^slicing.description = "Slicing based on the profile conformance of the sliced element"

RuleSet: CommonHeaderLevel1
* destination 1..1 //to be defined//
* source.name 1..1 //leverandor//
* source.software 1..1  //navnEPJ//
* source.version 1..1 //versjonEPJ//
* source.endpoint 1..1 //to be defined//
* destination.name 1..1 //versjonUt since this is a string - simpler than referring to a Device//

RuleSet: CommonHeaderNotification
* timestamp 1..1 //notifikasjonTid//
* entry[0].resource.MessageDefinition.category = notification
* entry[0].resource.MessageDefinition.category 1..1 

RuleSet: BundleEntry(name, min, max, short, def, class)
* entry contains {name} {min}..{max} MS
* entry[{name}] ^short = "{short}"
* entry[{name}] ^definition = "{def}"
* entry[{name}].resource only {class}
