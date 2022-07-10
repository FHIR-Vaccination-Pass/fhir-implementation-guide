# FHIR Vaccination Pass Implementation Guide

This repository contains a FHIR Implementation Guide consisting of FHIR Resource profiles and a narrative and
an implementation of the `PackageRegistryResourceProvider` IBM FHIR interface that is packaged to a .jar suitable
for deployment in the `userlib/` directory of the IBM FHIR Server.

## Contributor Guide

### Prerequisites

- [JDK](https://adoptium.net) >= 11
- [Node.js](https://nodejs.org/en/) >= 16
- [Ruby](https://www.ruby-lang.org/) >= 3.1
- [jekyll](https://jekyllrb.com) - `gem install jekyll`
- [SUSHI](https://fshschool.org/docs/sushi/) - `npm install -g fsh-sushi`

### Quick Start

Run the gradle task `build` either in your IDE or on the commandline:

```bash
./gradlew build
```

With this the following artifacts will be available:

- FHIR Implementation Guide Documentation at [./ig/output/index.html](./ig/output/index.html)
- FHIR Package at [./ig/output/package.tgz](./ig/output/package.tgz)
- IBM FHIR Server compatible .jar at [./ibm-fhir-jar/build/libs/ibm-fhir-jar-1.0-SNAPSHOT.jar](./ibm-fhir-jar/build/libs/ibm-fhir-jar-1.0-SNAPSHOT.jar)

### Editing FHIR Models

We recommend to read the [FHIR Shorthand Overview](http://hl7.org/fhir/uv/shorthand/N1/overview.html), the
[SUSHI Tutorial](https://fshschool.org/docs/tutorials/basic/) and to familiarize yourself with the
[FHIR Shorthand Language Reference](http://hl7.org/fhir/uv/shorthand/N1/reference.html) before getting started.

All FHIR models that are part of the implementation guide are placed in `./ig/input/fsh/`.
The narrative of the implementation guide can be edited as markdown in `./ig/input/pagecontent/`.
Metadata and the navigation structure of the implementation guide can be edited in `./ig/sushi-config.yaml`.

### Gradle Task Reference

| Task                | Description                                                                                                                                                               |
|---------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| :ig:sushi           | Runs SUSHI on the `./ig` directory                                                                                                                                        |
| :ig:ig              | Runs IG Publisher on the `./ig` directory, this includes a run of SUSHI                                                                                                   |
| :ibm-fhir-jar:build | Runs `:ig:ig` if necessary, extracts the FHIR package in `./ibm-fhir-jar/build/resources/main/` and packages the Java project to a `.jar` in `./ibm-fhir-jar/build/libs/` |
