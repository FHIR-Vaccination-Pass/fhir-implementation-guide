package com.github.fhirvaccinationpass.ibmfhirig;

import com.ibm.fhir.model.resource.Basic;
import com.ibm.fhir.model.type.*;
import com.ibm.fhir.validation.FHIRValidator;
import com.ibm.fhir.validation.exception.FHIRValidationException;
import org.junit.jupiter.api.Test;

import java.lang.String;

import static com.ibm.fhir.validation.util.FHIRValidationUtil.countErrors;
import static org.assertj.core.api.Assertions.assertThat;

class TargetDiseaseTest {

    static final String PROFILE_URL = "https://fhir-vaccination-pass.github.io/fhir-implementation-guide/StructureDefinition/vp-target-disease";

    @Test
    void validatesWhenResourceIsCompliant() throws FHIRValidationException {
        var populationRecommendation = Basic.builder()
                .meta(Meta.builder()
                        .profile(Canonical.of(PROFILE_URL))
                        .build())
                .code(CodeableConcept.builder()
                        .coding(Coding.builder()
                                .code(Code.builder()
                                        .value("TargetDisease")
                                        .build())
                                .build())
                        .build())
                .extension(Extension.builder()
                        .url("https://fhir-vaccination-pass.github.io/fhir-implementation-guide/StructureDefinition/vp-target-disease-extension")
                        .extension(
                                Extension.builder()
                                        .url("code")
                                        .value(CodeableConcept.builder()
                                                .coding(Coding.builder()
                                                        .system(Uri.of("http://hl7.org/fhir/sid/icd-10"))
                                                        .code(Code.of("U07.1"))
                                                        .build())
                                                .build())
                                        .build(),
                                Extension.builder()
                                        .url("name")
                                        .value("SARS-COV-19")
                                        .build(),
                                Extension.builder()
                                        .url("description")
                                        .value("This is bad for you.")
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
