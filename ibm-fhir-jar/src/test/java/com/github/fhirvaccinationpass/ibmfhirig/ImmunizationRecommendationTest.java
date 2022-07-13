package com.github.fhirvaccinationpass.ibmfhirig;

import com.ibm.fhir.model.resource.ImmunizationRecommendation;
import com.ibm.fhir.model.type.*;
import com.ibm.fhir.validation.FHIRValidator;
import com.ibm.fhir.validation.exception.FHIRValidationException;
import org.junit.jupiter.api.Test;

import java.lang.String;
import java.time.LocalDate;

import static com.ibm.fhir.validation.util.FHIRValidationUtil.countErrors;
import static org.assertj.core.api.Assertions.assertThat;

class ImmunizationRecommendationTest {

    static final String PROFILE_URL = "https://fhir-vaccination-pass.github.io/fhir-implementation-guide/StructureDefinition/vp-immunization-recommendation";

    @Test
    void validatesWhenResourceIsCompliant() throws FHIRValidationException {
        var immunizationRecommendation = ImmunizationRecommendation.builder()
                .meta(Meta.builder()
                        .profile(Canonical.of(PROFILE_URL))
                        .build())
                .patient(Reference.builder()
                        .reference("https://example.com/Patient/123")
                        .build())
                .date(DateTime.of(LocalDate.of(2022, 7, 10)))
                .recommendation(ImmunizationRecommendation.Recommendation.builder()
                        .vaccineCode(CodeableConcept.builder()
                                .coding(Coding.builder()
                                        .code(Code.builder()
                                                .value("vaccine-abc")
                                                .build())
                                        .build())
                                .build())
                        .targetDisease(CodeableConcept.builder()
                                .coding(Coding.builder()
                                        .code(Code.builder()
                                                .value("disease-abc")
                                                .build())
                                        .build())
                                .build())
                        .forecastStatus(CodeableConcept.builder()
                                .coding(Coding.builder()
                                        .code(Code.builder()
                                                .value("complete")
                                                .build())
                                        .build())
                                .build())
                        .dateCriterion(ImmunizationRecommendation.Recommendation.DateCriterion.builder()
                                .code(CodeableConcept.builder()
                                        .coding(Coding.builder()
                                                .code(Code.builder()
                                                        .value("dueDate")
                                                        .build())
                                                .build())
                                        .build())
                                .value(DateTime.of(LocalDate.of(2022, 7, 14)))
                                .build())
                        .build())
                .build();

        var issues = FHIRValidator.validator().validate(immunizationRecommendation);
        issues.forEach(item -> {
            if (item.getSeverity().getValue().equals("error")) {
                System.out.println(PROFILE_URL + " " + item);
            }
        });

        assertThat(countErrors(issues)).isZero();
    }
}
