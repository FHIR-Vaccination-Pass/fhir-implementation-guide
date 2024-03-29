Profile: VPActiveVaccinationScheme
Parent: Basic
Id: vp-active-vaccination-scheme
Title: "ActiveVaccinationScheme"
Description: "ActiveVaccinationScheme indicates which vaccination scheme is in use for a patient and target disease."
* code 1..1 MS
  * coding 1..1 MS
    * code 1..1 MS
    * code = #ActiveVaccinationScheme
* subject 1..1 MS
* subject only Reference(VPPatient)
* extension contains VPActiveVaccinationSchemeExtension named activeVaccinationSchemeExtension 1..1 MS

Extension: VPActiveVaccinationSchemeExtension
Id: vp-active-vaccination-scheme-extension
Title: "ActiveVaccinationSchemeExtension"
Description: ""
* extension contains
    vaccinationScheme 1..1 MS and
    changeReason 0..1 MS

* extension[vaccinationScheme]
  * value[x] 1..1 MS
  * value[x] only Reference(VPVaccinationScheme)

* extension[changeReason]
  * value[x] 1..1 MS
  * value[x] only markdown


Instance: vp-active-vaccination-scheme-to-scheme-parameter
InstanceOf: SearchParameter
Usage: #definition
* name = "ActiveVaccinationSchemeToSchemeParameter"
* status = #active
* description = "Search for 'vaccinationScheme' in ActiveVaccinationScheme."
* base = #Basic
* code = #activeVaccinationSchemeToScheme
* type = #string
* expression = "extension('https://fhir-vaccination-pass.github.io/fhir-implementation-guide/StructureDefinition/vp-active-vaccination-scheme-extension').extension('vaccinationScheme').value.reference"
