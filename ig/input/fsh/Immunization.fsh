Profile: VPImmunization
Parent: Immunization
Id: vp-immunization
Title: "Immunization"
Description: "Immunization profile for use in FHIR Vaccination Pass"
* id 0..1 MS
* status 1..1 MS
* vaccineCode 1..1 MS
* vaccineCode from http://fhir.de/ValueSet/ifa/pzn
  * coding 1.. MS
    * system 1..1 MS
    * code 1..1 MS
* patient 1..1 MS
* patient only Reference(VPPatient)
* occurrence[x] 1..1 MS
* occurrence[x] only dateTime
* lotNumber 1..1 MS
* performer 1..1 MS
  * actor 1..1 MS
  * actor only Reference(VPPractitioner)
* extension contains VPAdministeredVaccinationDose named administeredVaccinationDose 1..1 MS

Extension: VPAdministeredVaccinationDose
Id: vp-administered-vaccination-dose
Title: "VPAdministeredVaccinationDose"
Description: ""
* value[x] 1..1 MS
* value[x] only Reference(VPVaccinationDose)
