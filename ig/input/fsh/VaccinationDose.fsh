Profile: VPVaccinationDose
Parent: Basic
Id: vp-vaccination-dose
Title: "VaccinationDose"
Description: "VaccinationDose models one of the doses of a vaccination given as part of a vaccination scheme."
* code 1..1 MS
  * coding 1..1 MS
    * code 1..1 MS
    * code = #VaccinationDose
* subject 1..1 MS
* subject only Reference(VPVaccinationScheme)
* extension contains
  VPVaccinationDoseBaseExtension named base 1..1 MS and
  VPVaccinationDoseSingleExtension named singleDose 0..1 MS and
  VPVaccinationDoseRepeatingExtension named repeatingDose 0..1 MS
* obeys vp-vaccination-dose-extension-only-one-kind-invariant

Extension: VPVaccinationDoseBaseExtension
Id: vp-vaccination-dose-base-extension
Title: "VaccinationDoseBaseExtension"
Description: ""
* extension contains
    doseQuantity 1..1 MS and
    isProtected 1..1 MS and
    notes 0..1 MS

* extension[doseQuantity]
  * value[x] 1..1 MS
  * value[x] only Quantity
  * value[x]
    * code 1..1 MS
    * code from http://hl7.org/fhir/ValueSet/ucum-units
    * system 1..1 MS
    * value 1..1 MS

* extension[isProtected]
  * value[x] 1..1 MS
  * value[x] only boolean

* extension[notes]
  * value[x] 1..1 MS
  * value[x] only markdown

Extension: VPVaccinationDoseSingleExtension
Id: vp-vaccination-dose-single-extension
Title: "VaccinationDoseSingleExtension"
Description: ""
* extension contains
    numberInScheme 1..1 MS and
    timeframeStart 0..1 MS and
    timeframeEnd 0..1 MS
* obeys vp-vaccination-single-dose-timeframe-existance-invariant

* extension[numberInScheme]
  * value[x] 1..1 MS
  * value[x] only unsignedInt

* extension[timeframeStart]
  * value[x] 1..1 MS
  * value[x] only Quantity
  * value[x] obeys age-1
  * value[x]
    * code 1..1 MS
    * code from http://hl7.org/fhir/ValueSet/age-units
    * system 1..1 MS
    * value 1..1 MS

* extension[timeframeEnd]
  * value[x] 1..1 MS
  * value[x] only Quantity
  * value[x] obeys age-1
  * value[x]
    * code 1..1 MS
    * code from http://hl7.org/fhir/ValueSet/age-units
    * system 1..1 MS
    * value 1..1 MS

Extension: VPVaccinationDoseRepeatingExtension
Id: vp-vaccination-dose-repeating-extension
Title: "VaccinationDoseRepeatingExtension"
Description: ""
* extension contains
    interval 1..1 MS

* extension[interval]
  * value[x] 1..1 MS
  * value[x] only Quantity
  * value[x] obeys age-1
  * value[x]
    * code 1..1 MS
    * code from http://hl7.org/fhir/ValueSet/age-units
    * system 1..1 MS
    * value 1..1 MS

Invariant: vp-vaccination-dose-extension-only-one-kind-invariant
Description: "A vaccination dose can either be a single dose or a repeating dose."
Expression: "extension('https://fhir-vaccination-pass.github.io/fhir-implementation-guide/StructureDefinition/vp-vaccination-dose-single-extension').exists() != extension('https://fhir-vaccination-pass.github.io/fhir-implementation-guide/StructureDefinition/vp-vaccination-dose-repeating-extension').exists()"
Severity: #error

Invariant: vp-vaccination-single-dose-timeframe-existance-invariant
Description: "A single vaccination dose must have 'timeframeStart' and 'timeframeEnd' if its number in the scheme is bigger than 1."
Expression: "(extension('numberInScheme').first().value <= 1 and extension('timeframeStart').empty() and extension('timeframeEnd').empty()) or (extension('numberInScheme').first().value >= 2 and extension('timeframeStart').exists() and extension('timeframeEnd').exists())"
Severity: #error
