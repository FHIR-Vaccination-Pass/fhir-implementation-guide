package com.github.fhirvaccinationpass.ibmfhirig;

import com.ibm.fhir.model.resource.Patient;
import com.ibm.fhir.model.type.*;
import com.ibm.fhir.model.type.code.AddressUse;
import com.ibm.fhir.model.type.code.AdministrativeGender;
import com.ibm.fhir.model.type.code.NameUse;
import com.ibm.fhir.validation.FHIRValidator;
import com.ibm.fhir.validation.exception.FHIRValidationException;
import org.junit.jupiter.api.Test;

import java.lang.String;

import static com.ibm.fhir.validation.util.FHIRValidationUtil.countErrors;
import static org.assertj.core.api.Assertions.assertThat;

public class PatientTest {

    static final String BASE_URL = "https://fhir-vaccination-pass.github.io/fhir-implementation-guide/StructureDefinition/";
    static final String PROFILE_URL = BASE_URL + "vp-patient";

    @Test
    void validatesWhenResourceIsCompliant() throws FHIRValidationException {
        var patient = Patient.builder()
                .meta(Meta.builder()
                        .profile(Canonical.of(PROFILE_URL))
                        .build())
                .active(true)
                .name(
                        HumanName.builder()
                                .use(NameUse.OFFICIAL)
                                .family("Müller")
                                .given("Hubert", "Sebastian")
                                .build(),
                        HumanName.builder()
                                .use(NameUse.NICKNAME)
                                .given("Hubsi")
                                .build()
                )
                .gender(AdministrativeGender.MALE)
                .birthDate(Date.builder()
                        .value("2000-01-01")
                        .build())
                .deceased(false)
                .address(Address.builder()
                        .use(AddressUse.HOME)
                        .state(com.ibm.fhir.model.type.String.builder()
                                .value("Bavaria")
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
                        .country(com.ibm.fhir.model.type.String.builder()
                                .value("Germany")
                                .extension(Extension.builder()
                                        .url(BASE_URL + "vp-country-code-extension")
                                        .value(CodeableConcept.builder()
                                                .coding(Coding.builder()
                                                        .system(Uri.of("urn:iso:std:iso:3166"))
                                                        .code(Code.of("DE"))
                                                        .build())
                                                .build())
                                        .build())
                                .build())
                        .build())
                .extension(Extension.builder()
                        .url(BASE_URL + "vp-patient-keycloak-username-extension")
                        .value("müller")
                        .build())
                .extension(Extension.builder()
                        .url(BASE_URL + "vp-patient-is-pregnant-extension")
                        .value(false)
                        .build())
                .build();

        var issues = FHIRValidator.validator().validate(patient);
        issues.forEach(item -> {
            if (item.getSeverity().getValue().equals("error")) {
                System.out.println(PROFILE_URL + " " + item);
            }
        });

        assertThat(countErrors(issues)).isZero();
    }

}
