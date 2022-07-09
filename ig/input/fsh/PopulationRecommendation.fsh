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
  ageStart 0..1 and
  ageEnd 0..1
* extension[ageStart].value[x] only Age
* extension[ageEnd].value[x] only Age
