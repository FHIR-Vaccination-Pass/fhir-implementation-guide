package com.github.fhirvaccinationpass.ibmfhirig;

import com.ibm.fhir.model.resource.Practitioner;
import com.ibm.fhir.model.type.*;
import com.ibm.fhir.model.type.code.NameUse;
import com.ibm.fhir.validation.FHIRValidator;
import com.ibm.fhir.validation.exception.FHIRValidationException;
import org.junit.jupiter.api.Test;

import java.lang.String;

import static com.ibm.fhir.validation.util.FHIRValidationUtil.countErrors;
import static org.assertj.core.api.Assertions.assertThat;

public class PractitionerTest {

    static final String BASE_URL = "https://fhir-vaccination-pass.github.io/fhir-implementation-guide/StructureDefinition/";
    static final String PROFILE_URL = BASE_URL + "vp-practitioner";

    @Test
    void validatesWhenResourceIsCompliant() throws FHIRValidationException {
        var practitioner = Practitioner.builder()
                .meta(Meta.builder()
                        .profile(Canonical.of(PROFILE_URL))
                        .build())
                .name(
                        HumanName.builder()
                                .use(NameUse.OFFICIAL)
                                .family("Müller")
                                .given("Hubert", "Sebastian")
                                .build(),
                        HumanName.builder()
                                .use(NameUse.NICKNAME)
                                .given("Hubsi")
                                .build())
                .build();

        var issues = FHIRValidator.validator().validate(practitioner);
        issues.forEach(item -> {
            if (item.getSeverity().getValue().equals("error")) {
                System.out.println(PROFILE_URL + " " + item);
            }
        });

        assertThat(countErrors(issues)).isZero();
    }

}
