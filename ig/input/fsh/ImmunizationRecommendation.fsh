Profile: VPImmunizationRecommendation
Parent: ImmunizationRecommendation
Id: vp-immunization-recommendation
Title: "ImmunizationRecommendation"
Description: "ImmunizationRecommendation profile for use in FHIR Vaccination Pass."
* id 0..1 MS
* patient 1..1 MS
* patient only Reference(VPPatient)
* date 1..1 MS
* recommendation 1..1 MS
  * vaccineCode 1..1 MS
  * vaccineCode from http://fhir.de/CodeSystem/ifa/pzn
    * coding 1.. MS
      * system 1..1 MS
      * code 1..1 MS
  * targetDisease 1..1 MS
  * targetDisease from http://hl7.org/fhir/sid/icd-10
    * coding 1.. MS
      * system 1..1 MS
      * code 1..1 MS
  * forecastStatus 1..1 MS
  * forecastStatus from http://hl7.org/fhir/ValueSet/immunization-recommendation-status
    * coding 1.. MS
      * system 1..1 MS
      * code 1..1 MS
  * dateCriterion 1.. MS
    * code 1..1 MS
    * code from http://hl7.org/fhir/ValueSet/immunization-recommendation-date-criterion
      * coding 1.. MS
        * system 1..1 MS
        * code 1..1 MS
    * value 1..1 MS
  * supportingImmunization 0.. MS
  * supportingImmunization only Reference(VPImmunization)
* extension contains VPImmunizationRecommendationIsDeactivated named isDeactivated 1..1 MS
* extension contains VPFulfillingImmunization named fulfillingImmunization 0..1 MS
* extension contains VPSupportingPopulationRecommendation named supportingPopulationRecommendation 1..1 MS
* extension contains VPRecommendedVaccinationDose named recommendedVaccinationDose 1..1 MS

Extension: VPImmunizationRecommendationIsDeactivated
Id: vp-immunization-recommendation-is-deactivated
Title: "VPImmunizationRecommendationIsDeactivated"
Description: "Indicates if this ImmunizationRecommendation has been deactivated by a medical doctor."
* value[x] 1..1 MS
* value[x] only boolean

Extension: VPFulfillingImmunization
Id: vp-fulfilling-immunization
Title: "FulfillingImmunization"
Description: "Future Immunization that fulfills this ImmunizationRecommendation."
* value[x] 1..1 MS
* value[x] only Reference(VPImmunization)

Extension: VPSupportingPopulationRecommendation
Id: vp-supporting-population-recommendation
Title: "SupportingPopulationRecommendation"
Description: "PopulationRecommendation that is the reason for generating this ImmunizationRecommendation."
* value[x] 1..1 MS
* value[x] only Reference(VPPopulationRecommendation)

Extension: VPRecommendedVaccinationDose
Id: vp-recommended-vaccination-dose
Title: "VPRecommendedVaccinationDose"
Description: "VaccinationDose that has to be administered to fulfill this ImmunizationRecommendation."
* value[x] 1..1 MS
* value[x] only Reference(VPVaccinationDose)
