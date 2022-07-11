Profile: VPVaccinationDose
Parent: Basic
Id: vp-vaccination-dose
Title: "VaccinationDose"
Description: "VaccinationDose models one of the doses of a vaccination given as part of a vaccination scheme."
* extension contains VPVaccinationDoseExtension named vaccinationDoseExtension 1..1

Extension: VPVaccinationDoseExtension
Id: vp-vaccination-dose-extension
Title: "VaccinationDoseExtension"
Description: ""
* extension contains
  VPVaccinationDoseSingleExtension named singleDose 0..1 MS and
  VPVaccinationDoseRepeatingExtension named repeatingDose 0..1 MS
* obeys vp-vaccination-dose-extension-only-one-kind-invariant

Invariant: vp-vaccination-dose-extension-only-one-kind-invariant
Description: ""
Expression: "extension('singleDose').exists() != extension('repeatingDose').exists()"
Severity: #error

Extension: VPVaccinationDoseSingleExtension
Id: vp-vaccination-dose-single-extension
Title: "VaccinationDoseSingleExtension"
Description: ""

Extension: VPVaccinationDoseRepeatingExtension
Id: vp-vaccination-dose-repeating-extension
Title: "VaccinationDoseRepeatingExtension"
Description: ""
