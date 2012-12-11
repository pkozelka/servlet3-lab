My servlet 3 API laboratory
===========================

Note: No animal suffered during experiments in this laboratory.

This project contains few experiments with the Servlet 3 API technology.

Right now, it shows several styles of using Web fragments with Maven

For development testing, I tried Tomcat - which apriori fails on JAR modules, and Jetty - which works fine.
See particular pom.xml files for detailed configuration.


Bird style
----------
Uses WAR packaging, but the generated WAR should be ignored.

Nice:

* WAR packaging indicates that this module is related to web

Ugly:

* WAR packaging can confuse people to thinking that the resulting primary WAR is useful as a dependency
* The real JAR artifact usable as dependency needs to have a classifier due to limitations in maven-war-plugin

Cat  style
----------
Uses JAR packaging, and expects resources in src/main/resources/META-INF/resources.


Nice:

* Minimalistic pom.xml configuration

Ugly:

* the path for static resources contains the word "resources" twice, which can be a bit confusing. Some frameworks even use "resources" under that and then it can be even worse


Dog style
---------
Uses JAR packaging, and expects resources in src/main/webapp.

Nice:

* familiar location for static and dynamic web resources, known from regular webapps

Ugly:

* developers can be tempted to create WEB-INF under webapp which is a nonsense, of course


