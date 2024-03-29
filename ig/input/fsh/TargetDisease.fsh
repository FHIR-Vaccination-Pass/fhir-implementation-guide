Profile: VPTargetDisease
Parent: Basic
Id: vp-target-disease
Title: "TargetDisease"
Description: "Target disease contains information about a disease that can be vaccinated against"
* code 1..1 MS
  * coding 1..1 MS
    * code 1..1 MS
    * code = #TargetDisease
* extension contains VPTargetDiseaseExtension named targetDiseaseExtension 1..1 MS

Extension: VPTargetDiseaseExtension
Id: vp-target-disease-extension
Title: "TargetDiseaseExtension"
Description: ""
* extension contains
  code 1..1 MS and
  name 1..1 MS and
  description 1..1 MS

* extension[code]
  * value[x] 1..1 MS
  * value[x] only CodeableConcept
  * value[x] from VPICD10ValueSet
  * value[x]
    * coding 1.. MS
      * system 1..1 MS
      * code 1..1 MS

* extension[name]
  * value[x] 1..1 MS
  * value[x] only string

* extension[description]
  * value[x] 1..1 MS
  * value[x] only markdown


Instance: vp-target-disease-code-parameter
InstanceOf: SearchParameter
Usage: #definition
* name = "TargetDiseaseCodeParameter"
* status = #active
* description = "Search for 'code' in TargetDisease."
* base = #Basic
* code = #targetDiseaseCode
* type = #token
* expression = "extension('https://fhir-vaccination-pass.github.io/fhir-implementation-guide/StructureDefinition/vp-target-disease-extension').extension('code').value"
