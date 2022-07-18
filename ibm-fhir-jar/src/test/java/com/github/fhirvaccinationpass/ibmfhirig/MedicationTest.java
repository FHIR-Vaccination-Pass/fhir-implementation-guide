package com.github.fhirvaccinationpass.ibmfhirig;

import com.ibm.fhir.model.resource.Medication;
import com.ibm.fhir.model.type.*;
import com.ibm.fhir.validation.FHIRValidator;
import com.ibm.fhir.validation.exception.FHIRValidationException;
import org.junit.jupiter.api.Test;

import java.lang.String;

import static com.ibm.fhir.validation.util.FHIRValidationUtil.countErrors;
import static org.assertj.core.api.Assertions.assertThat;

public class MedicationTest {

    static final String BASE_URL = "https://fhir-vaccination-pass.github.io/fhir-implementation-guide/StructureDefinition/";
    static final String PROFILE_URL = BASE_URL + "vp-medication";

    @Test
    void validatesWhenResourceIsCompliant() throws FHIRValidationException {
        var medication = Medication.builder()
                .meta(Meta.builder()
                        .profile(Canonical.of(PROFILE_URL))
                        .build())
                .code(CodeableConcept.builder()
                        .coding(Coding.builder()
                                .system(Uri.builder()
                                        .value("http://fhir.de/CodeSystem/ifa/pzn")
                                        .build())
                                .code(Code.builder()
                                        .value("vaccine-abc")
                                        .build())
                                .build())
                        .build())
                .manufacturer(Reference.builder()
                        .reference("https://example.com/Organization/123")
                        .build())
                .form(CodeableConcept.builder()
                        .coding(Coding.builder()
                                .system(Uri.builder()
                                        .value("http://snomed.info/sct")
                                        .build())
                                .code(Code.builder()
                                        .value("736542009")
                                        .build())
                                .build())
                        .build())
                .extension(Extension.builder()
                        .url(BASE_URL + "vp-medication-trade-name")
                        .value("vaccine-name-abc")
                        .build())
                .build();

        var issues = FHIRValidator.validator().validate(medication);
        issues.forEach(item -> {
            if (item.getSeverity().getValue().equals("error")) {
                System.out.println(PROFILE_URL + " " + item);
            }
        });

        assertThat(countErrors(issues)).isZero();
    }

}
