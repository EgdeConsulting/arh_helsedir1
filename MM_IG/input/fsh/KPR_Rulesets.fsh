//source based on https://github.com/nightingaleproject/vital_records_fhir_messaging_ig/blob/main/input/fsh/DEF_Rulesets.fsh //

RuleSet: CommonBundleElements
* ^status = #draft
* type  = #message
* id 1..1
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry ^slicing.description = "Slicing based on the profile conformance of the sliced element"

RuleSet: BundleEntry(name, min, max, short, def, class)
* entry contains {name} {min}..{max} MS
* entry[{name}] ^short = "{short}"
* entry[{name}] ^definition = "{def}"
* entry[{name}].resource only {class}
