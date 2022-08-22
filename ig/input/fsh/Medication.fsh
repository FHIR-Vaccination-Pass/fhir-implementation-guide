Profile: VPMedication
Parent: Medication
Id: vp-medication
Title: "Medication"
Description: "Medication profile for use in FHIR Vaccination Pass"
* id 0..1 MS
* code 1..1 MS
* code from http://fhir.de/ValueSet/ifa/pzn
  * coding 1.. MS
    * system 1..1 MS
    * code 1..1 MS
* manufacturer 1..1 MS
* manufacturer only Reference(VPOrganization)
* form 1..1 MS
* form from http://hl7.org/fhir/ValueSet/medication-form-codes
  * coding 1.. MS
    * system 1..1 MS
    * code 1..1 MS
* extension contains VPMedicationTradeName named tradeName 1..1 MS
* extension contains VPMedicationTargetDisease named targetDiseases 1.. MS

Extension: VPMedicationTradeName
Id: vp-medication-trade-name
Title: "MedicationTradeName"
Description: "The trade name of the medication."
* value[x] 1..1 MS
* value[x] only string

Extension: VPMedicationTargetDisease
Id: vp-medication-target-disease
Title: "VPMedicationTargetDisease"
Description: "The ICD-10 code of a disease that is targeted by this medication."
* value[x] 1..1 MS
* value[x] only CodeableConcept
* value[x] from VPICD10ValueSet
  * coding 1.. MS
    * system 1..1 MS
    * code 1..1 MS


Instance: vp-medication-target-disease-code-parameter
InstanceOf: SearchParameter
Usage: #definition
* name = "MedicationTargetDiseaseCodeParameter"
* status = #active
* description = "Search for 'code' in Medication.targetDiseases"
* base = #Medication
* code = #targetDiseaseCode
* type = #token
* expression = "extension('https://fhir-vaccination-pass.github.io/fhir-implementation-guide/StructureDefinition/vp-medication-target-disease').value"
