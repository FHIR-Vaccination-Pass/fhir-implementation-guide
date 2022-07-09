package com.github.fhirvaccinationpass.ibmfhirig;

import com.ibm.fhir.registry.util.PackageRegistryResourceProvider;

public class VPImplementationGuideResourceProvider extends PackageRegistryResourceProvider {
    @Override
    public String getPackageId() {
        return "com.github.fhirvaccinationpass.ig";
    }
}
