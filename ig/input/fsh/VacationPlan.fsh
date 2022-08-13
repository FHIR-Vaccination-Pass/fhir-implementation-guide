Profile: VPVacationPlan
Parent: Basic
Id: vp-vacation-plan
Title: "VacationPlan"
Description: """
  VacationPlan models the intent of a patient to travel to a different location, potentially leading to a change of the
  indicated immunizations for the patient.
"""
* code 1..1 MS
  * coding 1..1 MS
    * code 1..1 MS
    * code = #VacationPlan
* subject 1..1 MS
* subject only Reference(VPPatient)
* extension contains VPVacationPlanExtension named vacationPlanExtension 1..1 MS

Extension: VPVacationPlanExtension
Id: vp-vacation-plan-extension
Title: "VacationPlanExtension"
Description: ""
* extension contains VPLocationExtension named location 1.. MS
* extension contains departureDate 1..1 MS

* extension[departureDate]
  * value[x] 1..1 MS
  * value[x] only date
