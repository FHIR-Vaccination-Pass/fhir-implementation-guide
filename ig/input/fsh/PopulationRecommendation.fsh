Profile: VPPopulationRecommendation
Parent: Basic
Id: vp-population-recommendation
Title: "PopulationRecommendation"
Description: ""
* extension contains VPPopulationRecommendationExtension named populationRecommendationExtension 1..1 MS


Extension: VPPopulationRecommendationExtension
Id: vp-population-recommendation-extension
Title: "PopulationRecommendationExtension"
Description: ""
* extension contains
  ageStart 0..1 MS and
  ageEnd 0..1 MS
* extension contains VPPopulationRecommendationLocationExtension named location 0..* MS

* extension[ageStart]
  * value[x] 1..1 MS
  * value[x] only Quantity
  * value[x] obeys age-1
  * value[x].code from http://hl7.org/fhir/ValueSet/all-time-units

* extension[ageEnd]
  * value[x] 1..1 MS
  * value[x] only Quantity
  * value[x] obeys age-1
  * value[x].code from http://hl7.org/fhir/ValueSet/all-time-units


Extension: VPPopulationRecommendationLocationExtension
Id: vp-population-recommendation-location-extension
Title: "PopulationRecommendationLocationExtension"
Description: ""
* extension contains
  country 1..1 MS and
  subdivision 0..1 MS

* extension[country]
  * value[x] 1..1 MS
  * value[x] only CodeableConcept
  * value[x] from http://hl7.org/fhir/ValueSet/iso3166-1-2
    * coding 1.. MS
      * system 1..1 MS
      * code 1..1 MS

* extension[subdivision]
  * value[x] 1..1 MS
  * value[x] only CodeableConcept
  * value[x] from VPSubdivisionValueSet
    * coding 1.. MS
      * system 1..1 MS
      * code 1..1 MS


Invariant: age-1
Description: """
  There SHALL be a code if there is a value and it SHALL be an expression of time.
  If system is present, it SHALL be UCUM. If value is present, it SHALL be positive.
"""
Expression: "(code.exists() or value.empty()) and (system.empty() or system = %ucum) and (value.empty() or value.hasValue().not() or value > 0)"
Severity: #error

ValueSet: VPSubdivisionValueSet
Id: vp-subdivision-value-set
Title: "SubdivisionValueSet"
Description: ""
* include codes from system urn:iso:std:iso:3166:-2
