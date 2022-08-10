Profile: VPActiveVaccinationScheme
Parent: Basic
Id: vp-active-vaccination-scheme
Title: "ActiveVaccinationScheme"
Description: "ActiveVaccinationScheme indicates which vaccination scheme is in use for a patient and target disease."
* code 1..1 MS
* extension contains VPActiveVaccinationSchemeExtension named activeVaccinationSchemeExtension 1..1 MS

Extension: VPActiveVaccinationSchemeExtension
Id: vp-active-vaccination-scheme-extension
Title: "ActiveVaccinationSchemeExtension"
Description: ""
* extension contains
    vaccinationScheme 1..1 MS and
    patient 1..1 MS and
    changeReason 0..1 MS

* extension[vaccinationScheme]
  * value[x] 1..1 MS
  * value[x] only Reference(VPVaccinationScheme)

* extension[patient]
  * value[x] 1..1 MS
  * value[x] only Reference(VPPatient)

* extension[changeReason]
  * value[x] 1..1 MS
  * value[x] only markdown
