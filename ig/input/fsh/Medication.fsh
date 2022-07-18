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

Extension: VPMedicationTradeName
Id: vp-medication-trade-name
Title: "MedicationTradeName"
Description: "The trade name of the medication."
* value[x] 1..1 MS
* value[x] only string
