package com.github.fhirvaccinationpass.ibmfhirig;

import com.ibm.fhir.model.resource.Basic;
import com.ibm.fhir.model.type.*;
import com.ibm.fhir.validation.FHIRValidator;
import com.ibm.fhir.validation.exception.FHIRValidationException;
import org.junit.jupiter.api.Test;

import java.lang.String;

import static com.ibm.fhir.validation.util.FHIRValidationUtil.countErrors;
import static org.assertj.core.api.Assertions.assertThat;

public class VacationPlanTest {

    static final String BASE_URL = "https://fhir-vaccination-pass.github.io/fhir-implementation-guide/StructureDefinition/";
    static final String PROFILE_URL = BASE_URL + "vp-vacation-plan";

    @Test
    void validatesWhenResourceIsCompliant() throws FHIRValidationException {
        var vacationPlan = Basic.builder()
                .meta(Meta.builder()
                        .profile(Canonical.of(PROFILE_URL))
                        .build())
                .code(CodeableConcept.builder()
                        .coding(Coding.builder()
                                .code(Code.builder()
                                        .value("VacationPlan")
                                        .build())
                                .build())
                        .build())
                .subject(Reference.builder()
                        .reference("https://example.com/Patient/123")
                        .build())
                .extension(Extension.builder()
                        .url(BASE_URL + "vp-vacation-plan-extension")
                        .extension(Extension.builder()
                                .url(BASE_URL + "vp-location-extension")
                                .extension(Extension.builder()
                                        .url(BASE_URL + "vp-country-code-extension")
                                        .value(CodeableConcept.builder()
                                                .coding(Coding.builder()
                                                        .system(Uri.of("urn:iso:std:iso:3166"))
                                                        .code(Code.of("DE"))
                                                        .build())
                                                .build())
                                        .build())
                                .extension(Extension.builder()
                                        .url(BASE_URL + "vp-state-code-extension")
                                        .value(CodeableConcept.builder()
                                                .coding(Coding.builder()
                                                        .system(Uri.of("urn:iso:std:iso:3166:-2"))
                                                        .code(Code.of("DE-BY"))
                                                        .build())
                                                .build())
                                        .build())
                                .build())
                        .extension(Extension.builder()
                                .url("departureDate")
                                .value(Date.of("2000-01-01"))
                                .build())
                        .build())
                .build();

        var issues = FHIRValidator.validator().validate(vacationPlan);
        issues.forEach(item -> {
            if (item.getSeverity().getValue().equals("error")) {
                System.out.println(PROFILE_URL + " " + item);
            }
        });

        assertThat(countErrors(issues)).isZero();
    }

}
