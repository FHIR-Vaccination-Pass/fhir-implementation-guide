plugins {
    java
}

java {
    sourceCompatibility = JavaVersion.VERSION_11
    targetCompatibility = JavaVersion.VERSION_11
}

group = "com.github.fhirvaccinationpass"
version = "1.0-SNAPSHOT"

repositories {
    mavenCentral()
}

val igPackage by configurations.register("igPackage") {
    isCanBeConsumed = false
    isCanBeResolved = true
}

dependencies {
    val ibmFhirVersion = "4.11.1"
    implementation("com.ibm.fhir:fhir-model:${ibmFhirVersion}")
    implementation("com.ibm.fhir:fhir-registry:${ibmFhirVersion}")

    testImplementation("org.junit.jupiter:junit-jupiter-api:5.8.1")
    testRuntimeOnly("org.junit.jupiter:junit-jupiter-engine:5.8.1")

    igPackage(project(":ig", "igPackage"))
}

val test: Test by tasks
test.useJUnitPlatform()

val copyIGPackage by tasks.registering {
    inputs.files(igPackage)

    doLast {
        copy {
            from(tarTree(igPackage.singleFile))
            into("./build/resources/main/com/github/fhirvaccinationpass/ig")
        }
    }
}

val compileJava: Task by tasks.getting
compileJava.dependsOn(copyIGPackage)
