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

    static final String BASE_URL = "https://fhir-vaccination-pass.github.io/fhir-implementation-guide/StructureDefinition/";
    static final String PROFILE_URL = BASE_URL + "vp-immunization";

    @Test
    void validatesWhenResourceIsCompliant() throws FHIRValidationException {
        var immunization = Immunization.builder()
                .meta(Meta.builder()
                        .profile(Canonical.of(PROFILE_URL))
                        .build())
                .status(ImmunizationStatus.COMPLETED)
                .vaccineCode(CodeableConcept.builder()
                        .coding(Coding.builder()
                                .system(Uri.builder()
                                        .value("http://fhir.de/CodeSystem/ifa/pzn")
                                        .build())
                                .code(Code.builder()
                                        .value("vaccine-abc")
                                        .build())
                                .build())
                        .build())
                .patient(Reference.builder()
                        .reference("https://example.com/Patient/123")
                        .build())
                .occurrence(DateTime.of(LocalDate.of(2022, 7, 10)))
                .lotNumber("lotNumber-abc")
                .performer(Immunization.Performer.builder()
                        .actor(Reference.builder()
                                .reference("https://example.com/Practitioner/456")
                                .build())
                        .build())
                .extension(Extension.builder()
                        .url(BASE_URL + "vp-administered-vaccination-dose")
                        .value(Reference.builder()
                                .reference("https://example.com/Basic/789")
                                .build())
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
