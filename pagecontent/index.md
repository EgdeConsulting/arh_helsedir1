# VJ_IG Evjeklinikken     &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;     [Return to top level](/egde-health-gateway/)

The Egde Health Platform provides the patient data backend, clinic admininstration, secure and compliant data storage and authentication for the VJ service.

A Smile CDR implementation of the HAPI FHIR server is used.

<img src="../../assets/images/Evjeklinikken-poster-A4.png" width="1100">

Checklist:

vjpasient
- [TODO] src/app/components/goals-longterm/goals-longterm.model <!-- bundle combining Goal and QuestionnaireResponse ?-->
- [TODO] src/app/components/goals-shortterm/goals-shortterm.model <!-- bundle combining Goal and QuestionnaireResponse ?-->
- [TODO] src/app/components/mental-challenges/mental-challenges.model <!-- bundle combining Observation and QuestionnaireResponse ?-->
- [I] src/app/components/profile/profile.model <!-- same as Patient -->
- [TODO] src/app/components/weekly-evaluation/weekly-evaluation.model <!-- bundle combining Observation and QuestionnaireResponse ?-->
- [TODO] src/app/components/weekly-evaluation/weekly-evaluation-reply.model <!-- bundle combining Observation and QuestionnaireResponse ?-->
- [X] src/app/fhirInterface/models/vj-patient.model
- [X] src/app/fhirInterface/models/vj-practitioner.model
- [X] src/app/fhirInterface/models/vj-group.model
- [X] src/app/fhirInterface/models/common/vj-practitioner-role
- [X] src/app/fhirInterface/models2/vj-goal.model
- [TODO] src/app/fhirInterface/models2/vj-questionnaireresponse.model
- [X] src/app/fhirInterface/models2/vj-communication.model
- [TODO] src/app/fhirInterface/models2/vj-observation.model
- [X] src/app/fhirInterface/models2/vj-practitioner.model
- [X] src/app/fhirInterface/models2/vj-patient.model
- [X] src/app/fhirInterface/models2/vj-group.model
- [TODO] src/app/fhirInterface/models2/vj-procedure.model


vjveileder

- [TODO] src/app/components/patient/goals/goals.model <!-- bundle combining Goal and QuestionnaireResponse ?-->
- [TODO] src/app/components/weekly-evaluation/weekly-evaluation.model <!-- bundle combining Observation and QuestionnaireResponse ?-->
- [TODO] src/app/components/weekly-evaluation/weekly-evaluation-reply.model <!-- bundle combining Observation and QuestionnaireResponse ?-->
- [X] src/app/fhirInterface/models/common/vj-careteam.model
- [X] src/app/fhirInterface/models/common/vj-careplan.model
- [X] src/app/fhirInterface/models/vj-group.model
- [X] src/app/fhirInterface/models/vj-patient.model
- [X] src/app/fhirInterface/models/vj-communication.model
- [X] src/app/fhirInterface/models/vj-practitioner.model
- [X] src/app/fhirInterface/models2/vj-appointment.model
- [X] src/app/fhirInterface/models2/vj-patient.model
- [X] src/app/fhirInterface/models2/vj-goal.model
- [TODO] src/app/fhirInterface/models2/vj-questionnaireresponse.model
- [X] src/app/fhirInterface/models2/vj-communication.model
- [X] src/app/fhirInterface/models/common/vj-careplan.model
- [X] src/app/fhirInterface/models/common/vj-careteam.model
