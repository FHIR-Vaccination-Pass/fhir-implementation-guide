Profile: VPVaccinationScheme
Parent: Basic
Id: vp-vaccination-scheme
Title: "VaccinationScheme"
Description: """
  VaccinationScheme models a process consisting of immunizations through wich a patient can reach immunity against a target
  disease.
"""
* code 1..1 MS
  * coding 1..1 MS
    * code 1..1 MS
    * code = #VaccinationScheme
* subject 1..1 MS
* subject only Reference(VPMedication)
* extension contains VPVaccinationSchemeExtension named vaccinationSchemeExtension 1..1 MS

Extension: VPVaccinationSchemeExtension
Id: vp-vaccination-scheme-extension
Title: "VaccinationSchemeExtension"
Description: ""
* extension contains
  name 1..1 MS and
  type 1..1 MS and
  isPreferred 1..1 MS and
  ageStart 0..1 MS and
  ageEnd 0..1 MS

* extension[name]
  * value[x] 1..1 MS
  * value[x] only string

* extension[type]
  * value[x] 1..1 MS
  * value[x] only string
  * value[x] from VPVaccinationSchemeTypeValueSet

* extension[isPreferred]
  * value[x] 1..1 MS
  * value[x] only boolean

* extension[ageStart]
  * value[x] 1..1 MS
  * value[x] only Quantity
  * value[x] obeys age-1
  * value[x]
    * code 1..1 MS
    * code from http://hl7.org/fhir/ValueSet/age-units
    * system 1..1 MS
    * value 1..1 MS

* extension[ageEnd]
  * value[x] 1..1 MS
  * value[x] only Quantity
  * value[x] obeys age-1
  * value[x]
    * code 1..1 MS
    * code from http://hl7.org/fhir/ValueSet/age-units
    * system 1..1 MS
    * value 1..1 MS


CodeSystem: VPVaccinationSchemeType
Id: vp-vaccination-scheme-type
Title: "VaccinationSchemeType"
Description: "Describes the type of a vaccination scheme such as standard, quick or repeating"
* #standard "Standard scheme that should be followed in most cases"
* #fast "Fast scheme that can be used if an accelerated immunization process is desired"
* #booster "Scheme that includes only repeating immunizations to refresh the protection"


ValueSet: VPVaccinationSchemeTypeValueSet
Id: vp-vaccination-scheme-type-value-set
Title: "VaccinationSchemeTypeValueSet"
Description: "Describes the type of a vaccination scheme such as standard, quick or repeating"
* include codes from system VPVaccinationSchemeType
