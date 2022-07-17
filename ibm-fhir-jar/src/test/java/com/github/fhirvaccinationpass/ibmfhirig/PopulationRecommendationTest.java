package com.github.fhirvaccinationpass.ibmfhirig;

import com.ibm.fhir.model.resource.Basic;
import com.ibm.fhir.model.type.*;
import com.ibm.fhir.validation.FHIRValidator;
import com.ibm.fhir.validation.exception.FHIRValidationException;
import org.junit.jupiter.api.Test;

import java.lang.String;

import static com.ibm.fhir.validation.util.FHIRValidationUtil.countErrors;
import static org.assertj.core.api.Assertions.assertThat;

class PopulationRecommendationTest {

    static final String PROFILE_URL = "https://fhir-vaccination-pass.github.io/fhir-implementation-guide/StructureDefinition/vp-population-recommendation";

    @Test
    void validatesWhenResourceIsCompliant() throws FHIRValidationException {
        var populationRecommendation = Basic.builder()
                .meta(Meta.builder()
                        .profile(Canonical.of(PROFILE_URL))
                        .build())
                .code(CodeableConcept.builder()
                        .coding(Coding.builder()
                                .code(Code.builder()
                                        .value("PopulationRecommendation")
                                        .build())
                                .build())
                        .build())
                .extension(Extension.builder()
                        .url("https://fhir-vaccination-pass.github.io/fhir-implementation-guide/StructureDefinition/vp-population-recommendation-extension")
                        .extension(
                                Extension.builder()
                                        .url("ageStart")
                                        .value(Age.builder()
                                                .code(Code.builder()
                                                        .value("a")
                                                        .build())
                                                .system(Uri.of("http://unitsofmeasure.org"))
                                                .value(Decimal.of(12))
                                                .unit("yr")
                                                .build())
                                        .build(),
                                Extension.builder()
                                        .url("ageEnd")
                                        .value(Age.builder()
                                                .code(Code.builder()
                                                        .value("a")
                                                        .build())
                                                .system(Uri.of("http://unitsofmeasure.org"))
                                                .value(Decimal.of(42))
                                                .unit("yr")
                                                .build())
                                        .build(),
                                Extension.builder()
                                        .url("https://fhir-vaccination-pass.github.io/fhir-implementation-guide/StructureDefinition/vp-population-recommendation-location-extension")
                                        .extension(
                                                Extension.builder()
                                                        .url("country")
                                                        .value(CodeableConcept.builder()
                                                                .coding(Coding.builder()
                                                                        .system(Uri.of("urn:iso:std:iso:3166"))
                                                                        .code(Code.of("DE"))
                                                                        .build())
                                                                .build())
                                                        .build(),
                                                Extension.builder()
                                                        .url("subdivision")
                                                        .value(CodeableConcept.builder()
                                                                .coding(Coding.builder()
                                                                        .system(Uri.of("urn:iso:std:iso:3166:-2"))
                                                                        .code(Code.of("DE-BY"))
                                                                        .build())
                                                                .build())
                                                        .build()
                                        )
                                        .build()
                        )
                        .build())
                .build();

        var issues = FHIRValidator.validator().validate(populationRecommendation);
        issues.forEach(item -> {
            if (item.getSeverity().getValue().equals("error")) {
                System.out.println(PROFILE_URL + " " + item);
            }
        });

        assertThat(countErrors(issues)).isZero();
    }
}
