Profile: VPPopulationRecommendation
Parent: Basic
Id: vp-population-recommendation
Title: "PopulationRecommendation"
Description: ""
* extension contains VPPopulationRecommendationExtension named populationRecommendationExtension 1..1

Extension: VPPopulationRecommendationExtension
Id: vp-population-recommendation-extension
Title: "PopulationRecommendationExtension"
Description: ""
* extension contains
  ageStart 0..1 MS and
  ageEnd 0..1 MS
* extension[ageStart].value[x] only Quantity
* extension[ageStart].value[x] obeys age-1
* extension[ageStart].value[x].code from http://hl7.org/fhir/ValueSet/all-time-units

* extension[ageEnd].value[x] only Quantity
* extension[ageEnd].value[x] obeys age-1
* extension[ageEnd].value[x].code from http://hl7.org/fhir/ValueSet/all-time-units

Invariant: age-1
Description: """
  There SHALL be a code if there is a value and it SHALL be an expression of time.
  If system is present, it SHALL be UCUM. If value is present, it SHALL be positive.
"""
Expression: "(code.exists() or value.empty()) and (system.empty() or system = %ucum) and (value.empty() or value.hasValue().not() or value > 0)"
Severity: #error
