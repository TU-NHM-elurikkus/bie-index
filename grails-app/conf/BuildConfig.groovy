grails.servlet.version = "3.0" // Change depending on target container compliance (2.5 or 3.0)
grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.project.work.dir = "target/work"
grails.project.target.level = 1.8
grails.project.source.level = 1.8

grails.project.fork = [
    test: [maxMemory: 768, minMemory: 64, debug: false, maxPerm: 256, daemon:true], // configure settings for the test-app JVM
    run: [maxMemory: 768, minMemory: 64, debug: false, maxPerm: 256], // configure settings for the run-app JVM
    war: [maxMemory: 768, minMemory: 64, debug: false, maxPerm: 256], // configure settings for the run-war JVM
    console: [maxMemory: 768, minMemory: 64, debug: false, maxPerm: 256] // configure settings for the Console UI JVM
]

grails.project.dependency.resolver = "maven" // or ivy
grails.project.dependency.resolution = {
    // inherit Grails' default dependencies
    inherits("global") {
        // specify dependency exclusions here; for example, uncomment this to disable ehcache:
        // excludes 'ehcache'
    }
    log "error" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
    checksums true // Whether to verify checksums on resolve
    legacyResolve false // whether to do a secondary resolve on plugin installation, not advised and here for backwards compatibility

    repositories {
        mavenLocal()
        mavenRepo ("http://nexus.ala.org.au/content/groups/public/") {
            updatePolicy 'always'
        }
    }

    dependencies {
        // specify dependencies here under either 'build', 'compile', 'runtime', 'test' or 'provided' scopes
        compile 'com.github.davidmoten:rxjava-file:0.4'
        compile 'io.reactivex:rxgroovy:1.0.3'
        compile ('org.jasig.cas.client:cas-client-core:3.3.3') {
            excludes([group: 'javax.servlet', name: 'servlet-api'])
        }

        runtime 'net.sf.opencsv:opencsv:2.3'
        runtime "org.apache.solr:solr-solrj:5.4.0"
        runtime "org.gbif:dwca-io:1.24"
        runtime("au.org.ala:ala-name-matching:2.4.0"){
            excludes 'org.slf4j:slf4j-log4j12'
        }
        runtime "org.jsoup:jsoup:1.8.3"
        runtime "mysql:mysql-connector-java:5.1.44" // MySQL driver

        test "org.grails:grails-datastore-test-support:1.0-grails-2.4"
        test "org.gebish:geb-spock:0.12.2"
        test "org.seleniumhq.selenium:selenium-support:2.48.2"
        test "org.seleniumhq.selenium:selenium-firefox-driver:2.48.2"
        test "org.seleniumhq.selenium:selenium-htmlunit-driver:2.48.2"
    }

    plugins {
        build(":release:3.0.1", ":rest-client-builder:2.0.3") {
            export = false
        }
        build ":tomcat:7.0.70"
        runtime ":cors:1.1.6"
        runtime ":ala-bootstrap3:1.6.2"
        runtime(":ala-auth:1.3.4") {
            excludes "servlet-api"
        }
        runtime ":ala-admin-plugin:1.2"
        runtime ":hibernate:3.6.10.19"

        compile ":cache:1.1.8"
        compile ":spring-websocket:1.3.0"
        compile ":shiro:1.2.1"  // Authentication/permissions support for endpoints

        test ":geb:0.12.2"
    }
}
