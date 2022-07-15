import org.apache.tools.ant.taskdefs.condition.Os

val sushi by tasks.register<Exec>("sushi") {
    if (Os.isFamily(Os.FAMILY_WINDOWS)) {
        commandLine("cmd", "/c", "sushi", "-s", ".")
    } else {
        commandLine("sushi", "-s", ".")
    }

    group = "build"
    inputs.dir("./input")
    inputs.file("./sushi-config.yaml")
    outputs.dir("./fsh-generated")
}

val updatePublisher by tasks.register<Exec>("updatePublisher") {
    if (Os.isFamily(Os.FAMILY_WINDOWS)) {
        commandLine("cmd", "/c", "_updatePublisher.bat", "/f")
    } else {
        commandLine("./_updatePublisher.sh", "-y")
    }

    onlyIf { !file("./input-cache/publisher.jar").exists() }
}

val ig by tasks.register<Exec>("ig") {
    if (Os.isFamily(Os.FAMILY_WINDOWS)) {
        commandLine("cmd", "/c", "_genonce.bat")
    } else {
        commandLine("./_genonce.sh")
    }

    group = "build"
    dependsOn(updatePublisher)
    inputs.dir("./input")
    inputs.file("./sushi-config.yaml")
    inputs.file("./ig.ini")
    outputs.dir("./fsh-generated")
    outputs.dir("./output")
}

val build = tasks.register("build") {
    dependsOn(ig)
}

val igPackage by configurations.register("igPackage") {
    isCanBeConsumed = true
    isCanBeResolved = false
}

artifacts {
    add("igPackage", file("./output/package.tgz")) {
        builtBy(ig)
    }
}
