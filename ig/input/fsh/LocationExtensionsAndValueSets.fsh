Extension: VPCountryCodeExtension
Id: vp-country-code-extension
Title: "VPCountryCodeExtension"
Description: ""
* value[x] 1..1 MS
* value[x] only CodeableConcept
* value[x] from http://hl7.org/fhir/ValueSet/iso3166-1-2
  * coding 1.. MS
    * system 1..1 MS
    * code 1..1 MS

Extension: VPStateCodeExtension
Id: vp-state-code-extension
Title: "VPStateCodeExtension"
Description: ""
* value[x] 1..1 MS
* value[x] only CodeableConcept
* value[x] from VPStateCodeValueSet
  * coding 1.. MS
    * system 1..1 MS
    * code 1..1 MS

ValueSet: VPStateCodeValueSet
Id: vp-state-code-value-set
Title: "VPStateCodeValueSet"
Description: ""
* include codes from system urn:iso:std:iso:3166:-2