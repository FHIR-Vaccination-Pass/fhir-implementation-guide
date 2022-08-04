Profile: VPPopulationRecommendation
Parent: Basic
Id: vp-population-recommendation
Title: "PopulationRecommendation"
Description: """
  PopulationRecommendation models a general recommendation to achieve immunity against a specific disease, possibly
  limited to locations where the disease is prevalent or to an age range of the patients.
"""
* code 1..1 MS
* extension contains VPPopulationRecommendationExtension named populationRecommendationExtension 1..1 MS


Extension: VPPopulationRecommendationExtension
Id: vp-population-recommendation-extension
Title: "PopulationRecommendationExtension"
Description: ""
* extension contains
  targetDisease 1..1 MS and
  ageStart 0..1 MS and
  ageEnd 0..1 MS
* extension contains VPPopulationRecommendationLocationExtension named location 0..* MS

* extension[targetDisease]
  * value[x] 1..1 MS
  * value[x] only CodeableConcept
  * value[x] from VPICD10ValueSet
    * coding 1.. MS
      * system 1..1 MS
      * code 1..1 MS

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


Extension: VPPopulationRecommendationLocationExtension
Id: vp-population-recommendation-location-extension
Title: "PopulationRecommendationLocationExtension"
Description: ""
* extension contains
  VPCountryCodeExtension named country 1..1 MS and
  VPStateCodeExtension named state 0..1 MS
