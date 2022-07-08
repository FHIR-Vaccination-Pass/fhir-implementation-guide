Profile: VPImmunizationRecommendation
Parent: ImmunizationRecommendation
Id: vp-immunization-recommendation
Title: "ImmunizationRecommendation"
Description: "ImmunizationRecommendation profile for use in FHIR Vaccination Pass"
* recommendation.vaccineCode 1..1
* recommendation.vaccineCode only CodeableConcept
* recommendation.vaccineCode from http://fhir.de/CodeSystem/ifa/pzn
* recommendation.targetDisease 1..1
* recommendation.targetDisease from http://hl7.org/fhir/sid/icd-10
* recommendation.dateCriterion 1..1
* recommendation.extension contains VPFulfillingImmunization named fulfillingImmunization 0..1

Extension: VPFulfillingImmunization
Id: vp-fulfilling-immunization
Title: "FulfillingImmunization"
Description: ""
* value[x] only Reference(VPImmunization)
