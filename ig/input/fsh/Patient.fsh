Profile: VPPatient
Parent: Patient
Id: vp-patient
Title: "Patient"
Description: "Patient profile for use in FHIR Vaccination Pass"
* id 0..1 MS
* active 1..1 MS
* name MS
* name ^slicing.discriminator.type = #value
* name ^slicing.discriminator.path = "use"
* name ^slicing.rules = #closed
* name ^slicing.description = "Slice based on name.use value. One slice with name.use = official must be present."
* name contains
    officialName 1..1 MS and
    @default 0.. MS
* name[officialName]
  * use 1..1 MS
  * use = #official
  * family 1..1 MS
  * given 1.. MS
* name[@default]
  * use 1..1 MS
* gender 1..1 MS
* birthDate 1..1 MS
* deceased[x] 1..1 MS
* address 1.. MS
  * use 1..1 MS
  * state 1..1 MS
    * extension contains VPStateCodeExtension named code 1..1 MS
  * country 1..1 MS
    * extension contains VPCountryCodeExtension named code 1..1 MS
* extension contains VPPatientKeycloakUsernameExtension named keycloakUsername 1..1 MS
* extension contains VPPatientIsPregnantExtension named isPregnant 1..1 MS
* obeys vp-address-use-home-must-exist-invariant

Extension: VPPatientKeycloakUsernameExtension
Id: vp-patient-keycloak-username-extension
Title: "VPPatientKeycloakUsernameExtension"
Description: ""
* value[x] 1..1 MS
* value[x] only string

Extension: VPPatientIsPregnantExtension
Id: vp-patient-is-pregnant-extension
Title: "VPPatientIsPregnantExtension"
Description: ""
* value[x] 1..1 MS
* value[x] only boolean

Invariant: vp-address-use-home-must-exist-invariant
Description: "At least one address has to be 'home'"
Expression: "address.where(use = 'home').exists()"
Severity: #error


Instance: vp-patient-state-code-parameter
InstanceOf: SearchParameter
Usage: #definition
* name = "PatientStateCodeParameter"
* status = #active
* description = "Search for 'code' in Medication.address.state.extension.state"
* base = #Patient
* code = #stateCode
* type = #token
* expression = "address.state.extension('https://fhir-vaccination-pass.github.io/fhir-implementation-guide/StructureDefinition/vp-state-code-extension').value"

Instance: vp-patient-country-code-parameter
InstanceOf: SearchParameter
Usage: #definition
* name = "PatientCountryCodeParameter"
* status = #active
* description = "Search for 'code' in Medication.address.country.extension.state"
* base = #Patient
* code = #countryCode
* type = #token
* expression = "address.country.extension('https://fhir-vaccination-pass.github.io/fhir-implementation-guide/StructureDefinition/vp-country-code-extension').value"
