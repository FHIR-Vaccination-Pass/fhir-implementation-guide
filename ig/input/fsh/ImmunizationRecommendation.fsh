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
  * vaccineCode from http://fhir.de/ValueSet/ifa/pzn
    * coding 1.. MS
      * system 1..1 MS
      * code 1..1 MS
  * targetDisease 1..1 MS
  * targetDisease from VPICD10ValueSet
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


Instance: vp-immunization-recommendation-is-deactivated-parameter
InstanceOf: SearchParameter
Usage: #definition
* name = "ImmunizationRecommendationIsDeactivatedParameter"
* status = #active
* description = "Search for 'isDeactivated' in ImmunizationRecommendation."
* base = #ImmunizationRecommendation
* code = #isDeactivated
* type = #token
* expression = "extension('https://fhir-vaccination-pass.github.io/fhir-implementation-guide/StructureDefinition/vp-immunization-recommendation-is-deactivated').value"

Instance: vp-immunization-recommendation-fulfilling-immunization-parameter
InstanceOf: SearchParameter
Usage: #definition
* name = "ImmunizationRecommendationFulfillingImmunizationParameter"
* status = #active
* description = "Search for 'fulfillingImmunization' in ImmunizationRecommendation."
* base = #ImmunizationRecommendation
* code = #fulfillingImmunization
* type = #string
* expression = "extension('https://fhir-vaccination-pass.github.io/fhir-implementation-guide/StructureDefinition/vp-fulfilling-immunization').value.reference"

Instance: vp-immunization-recommendation-supporting-pop-rec-parameter
InstanceOf: SearchParameter
Usage: #definition
* name = "ImmunizationRecommendationSupportingPopulationRecommendationParameter"
* status = #active
* description = "Search for 'supportingPopulationRecommendation' in ImmunizationRecommendation."
* base = #ImmunizationRecommendation
* code = #supportingPopulationRecommendation
* type = #string
* expression = "extension('https://fhir-vaccination-pass.github.io/fhir-implementation-guide/StructureDefinition/vp-supporting-population-recommendation').value.reference"

Instance: vp-immunization-recommendation-reccommended-vac-dose-parameter
InstanceOf: SearchParameter
Usage: #definition
* name = "ImmunizationRecommendationRecommendedVaccinationDoseParameter"
* status = #active
* description = "Search for 'recommendedVaccinationDose' in ImmunizationRecommendation."
* base = #ImmunizationRecommendation
* code = #recommendedVaccinationDose
* type = #string
* expression = "extension('https://fhir-vaccination-pass.github.io/fhir-implementation-guide/StructureDefinition/vp-recommended-vaccination-dose').value.reference"
