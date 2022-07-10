package com.github.fhirvaccinationpass.ibmfhirig;

import com.ibm.fhir.model.resource.Immunization;
import com.ibm.fhir.model.type.*;
import com.ibm.fhir.model.type.code.ImmunizationStatus;
import com.ibm.fhir.validation.FHIRValidator;
import com.ibm.fhir.validation.exception.FHIRValidationException;
import org.junit.jupiter.api.Test;

import java.lang.String;
import java.time.LocalDate;

import static com.ibm.fhir.validation.util.FHIRValidationUtil.countErrors;
import static org.assertj.core.api.Assertions.*;

class ImmunizationTest {

    static final String PROFILE_URL = "https://fhir-vaccination-pass.github.io/fhir-implementation-guide/StructureDefinition/vp-immunization";

    @Test
    void validatesWhenResourceIsCompliant() throws FHIRValidationException {
        var immunization = Immunization.builder()
                .meta(Meta.builder()
                        .profile(Canonical.of(PROFILE_URL))
                        .build())
                .patient(Reference.builder()
                        .reference("https://example.com/Patient/123")
                        .build())
                .status(ImmunizationStatus.COMPLETED)
                .occurrence(DateTime.of(LocalDate.of(2022, 7, 10)))
                .vaccineCode(CodeableConcept.builder()
                        .coding(Coding.builder()
                                .code(Code.builder()
                                        .value("vaccine-abc")
                                        .build())
                                .build())
                        .build())

                .lotNumber("ABC123")
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
