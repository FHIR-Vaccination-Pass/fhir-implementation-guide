Profile: VPVacationPlan
Parent: Basic
Id: vp-vacation-plan
Title: "VacationPlan"
Description: """
  VacationPlan models the intent of a patient to travel to a different location, potentially leading to a change of the
  indicated immunizations for the patient.
"""
* extension contains VPVacationPlanExtension named vacationPlanExtension 1..1

Extension: VPVacationPlanExtension
Id: vp-vacation-plan-extension
Title: "VacationPlanExtension"
Description: ""
