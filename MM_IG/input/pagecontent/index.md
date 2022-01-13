# MM_IG Minimelding experimental IG   &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;     [Return to top level](/arh_helsedir1/)

This IG is an example of how the XPR minimelding can be modelled with FHIR Resources.
The diagram below shows the data content from the original alongside an equivalent FHIR structure.

# Notes on functional strucucture:

## 1. Overall structure
To model the levels of the xpr structure this version uses a top level FHIR Bundle resource of type "Message" to represent the "Melding". In order to model one to many Notifications within the "Melding" we use a new Bundle of type "Message" under the Melding bundle. This Bundle is described using a MessageHeader MessageDefinition resources and provides 'focus' for 1 payload "Encounter" resource.

## 2. Message protocol considerations
XPR uses the statusNotifikasjon to determine if the message is an original or a correction. In this FHIR example we have used an Event in the Notifikasjon MessageHeader to target an endpoint URL.

Example:
- Kodeverk 7316 = N "Original" is sent to the receiving server EventUri = "http://hddr.no/iplosikpr_submission"
- Kodeverk 7316 = M "KorrigerErstatt" to EventUri = "http://hddr.no/iplosikpr_replace"

## 3. Notification types
XPR Minimelding has 5 types of notification which are defined within the Encounter resource using the standard FHIR status flags:
- 'arrived' = TjenesteStart; 
- 'onleave' = Midlertidlig stopp fra; 
- 'planned' = Midlertidlig stopp til 
- 'finished' = Tjeneste Slutt
- 'entered-in-error' = Tjenesteutfører endret

<img src="../assets/images/MinimeldingModel1.png">

TODO Checklist:
1. Profiling needs improved slicing definitions
2. Work required to refer to no-basis profiles where possible
3. Add multi-notification example
4. Add bydel from no-basis address structure
5. Model a HST version