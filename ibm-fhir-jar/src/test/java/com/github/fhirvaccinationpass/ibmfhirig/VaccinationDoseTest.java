package com.github.fhirvaccinationpass.ibmfhirig;

import com.ibm.fhir.model.resource.Basic;
import com.ibm.fhir.model.type.*;
import com.ibm.fhir.validation.FHIRValidator;
import com.ibm.fhir.validation.exception.FHIRValidationException;
import org.junit.jupiter.api.Test;

import java.lang.String;

import static com.ibm.fhir.validation.util.FHIRValidationUtil.countErrors;
import static org.assertj.core.api.Assertions.assertThat;

public class VaccinationDoseTest {

    static final String BASE_URL = "https://fhir-vaccination-pass.github.io/fhir-implementation-guide/StructureDefinition/";
    static final String PROFILE_URL = BASE_URL + "vp-vaccination-dose";

    @Test
    void validatesWhenResourceIsCompliant() throws FHIRValidationException {
        var immunization = Basic.builder()
                .meta(Meta.builder()
                        .profile(Canonical.of(PROFILE_URL))
                        .build())
                .code(CodeableConcept.builder()
                        .coding(Coding.builder()
                                .code(Code.builder()
                                        .value("VaccinationDose")
                                        .build())
                                .build())
                        .build())
                .extension(Extension.builder()
                        .url(BASE_URL + "vp-vaccination-dose-base-extension")
                        .extension(
                                Extension.builder()
                                        .url("doseQuantity")
                                        .value(Quantity.builder()
                                                .code(Code.of("ml"))
                                                .system(Uri.of("http://unitsofmeasure.org"))
                                                .value(Decimal.of(0.5))
                                                .build())
                                        .build(),
                                Extension.builder()
                                        .url("isProtected")
                                        .value(true)
                                        .build(),
                                Extension.builder()
                                        .url("notes")
                                        .value(Markdown.of("This is a note."))
                                        .build(),
                                Extension.builder()
                                        .url("vaccinationScheme")
                                        .value(Reference.builder()
                                                .reference("https://example.com/Basic/123")
                                                .build())
                                        .build()
                        )
                        .build())
                .extension(Extension.builder()
                        .url(BASE_URL + "vp-vaccination-dose-single-extension")
                        .extension(
                                Extension.builder()
                                        .url("numberInScheme")
                                        .value(UnsignedInt.of(2))
                                        .build(),
                                Extension.builder()
                                        .url("timeframeStart")
                                        .value(Quantity.builder()
                                                .code(Code.of("mo"))
                                                .system(Uri.of("http://unitsofmeasure.org"))
                                                .value(Decimal.of(1))
                                                .build())
                                        .build(),
                                Extension.builder()
                                        .url("timeframeEnd")
                                        .value(Quantity.builder()
                                                .code(Code.of("mo"))
                                                .system(Uri.of("http://unitsofmeasure.org"))
                                                .value(Decimal.of(3))
                                                .build())
                                        .build()
                        )
                        .build())
                .build();

        var issues = FHIRValidator.validator().validate(immunization);
        issues.forEach(item -> {
            if (item.getSeverity().getValue().equals("error")) {
                System.out.println(PROFILE_URL + " " + item);
            }
        });

        assertThat(countErrors(issues)).isZero();
    }

}
