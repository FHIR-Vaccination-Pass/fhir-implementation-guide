Profile: VPTargetDisease
Parent: Basic
Id: vp-target-disease
Title: "TargetDisease"
Description: "Target disease contains information about a disease that can be vaccinated against"
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
  * value[x] from http://hl7.org/fhir/sid/icd-10
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
