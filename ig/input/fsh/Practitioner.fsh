Profile: VPPractitioner
Parent: Practitioner
Id: vp-practitioner
Title: "Practitioner"
Description: "Practitioner profile for use in FHIR Vaccination Pass"
* id 0..1 MS
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
