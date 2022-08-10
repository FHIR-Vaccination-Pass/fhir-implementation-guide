package com.github.fhirvaccinationpass.ibmfhirig;

import com.ibm.fhir.model.resource.Basic;
import com.ibm.fhir.model.type.*;
import com.ibm.fhir.validation.FHIRValidator;
import com.ibm.fhir.validation.exception.FHIRValidationException;
import org.junit.jupiter.api.Test;

import java.lang.String;

import static com.ibm.fhir.validation.util.FHIRValidationUtil.countErrors;
import static org.assertj.core.api.Assertions.assertThat;

public class ActiveVaccinationSchemeTest {

    static final String BASE_URL = "https://fhir-vaccination-pass.github.io/fhir-implementation-guide/StructureDefinition/";
    static final String PROFILE_URL = BASE_URL + "vp-active-vaccination-scheme";

    @Test
    void validatesWhenResourceIsCompliant() throws FHIRValidationException {
        var activeVaccinationScheme = Basic.builder()
                .meta(Meta.builder()
                        .profile(Canonical.of(PROFILE_URL))
                        .build())
                .code(CodeableConcept.builder()
                        .coding(Coding.builder()
                                .code(Code.builder()
                                        .value("ActiveVaccinationScheme")
                                        .build())
                                .build())
                        .build())
                .extension(Extension.builder()
                        .url(BASE_URL + "vp-active-vaccination-scheme-extension")
                        .extension(
                                Extension.builder()
                                        .url("vaccinationScheme")
                                        .value(Reference.builder()
                                                .reference("https://example.com/Basic/123")
                                                .build())
                                        .build(),
                                Extension.builder()
                                        .url("patient")
                                        .value(Reference.builder()
                                                .reference("https://example.com/Patient/123")
                                                .build())
                                        .build(),
                                Extension.builder()
                                        .url("changeReason")
                                        .value(Markdown.of("This is a reason."))
                                        .build()
                        )
                        .build())
                .build();

        var issues = FHIRValidator.validator().validate(activeVaccinationScheme);
        issues.forEach(item -> {
            if (item.getSeverity().getValue().equals("error")) {
                System.out.println(PROFILE_URL + " " + item);
            }
        });

        assertThat(countErrors(issues)).isZero();
    }

}
