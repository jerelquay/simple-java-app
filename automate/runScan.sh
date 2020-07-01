#!/bin/bash

#Usage ./run_sonar.sh ProjectKey ProjectPath Projectversion
#this script is for scanning java project source code, excluding built binaries and 3rd party jars
#The best way to deactivate an individual issue you don't intend to fix is to mark it "Won't Fix" or "False Positive" through the SonarQube UI.
#If you need to deactivate a rule (or all rules) for an entire file, then issue exclusions are the way to go. But if you only want to deactivate a rule across a subset of a file - all the lines of a method or a class - you can use @SuppressWarnings("all") or @SuppressWarnings with rule keys: @SuppressWarnings("squid:S2078") or @SuppressWarnings({"squid:S2078", "squid:S2076"}).

#properties to be passed in from JIRA
PROJECT_KEY="$1"
BASE_DIR="$2"
PROJECT_VERSION="$3"

echo ${PROJECT_KEY}
#properties to be maintained by project
SONAR_HOST_URL="http://127.0.0.1:9000/sonarqube"
SONAR_SCANNER_PATH="/opt/sonar-scanner/bin/" #directory containing sonar-scanner
PROJECT_SOURCE="src" #comma-separated relative paths to source files
THIRD_PARTY_LIB="" # Comma-separated relative paths to files with third-party libraries (JAR or Zip files) used by your project. Wildcards can be used: sonar.java.libraries=path/to/Library.jar,directory/**/*.jar
SOURCE_ENCODING="UTF-8" #Encoding of the source files. Eg: UTF-8, MacRoman, Shift_JIS. 
JAVA_VER="8" # "X" (for instance 7 for java 7, 8 for java 8, etc. )


##### Should not modify anything below this line ##########
SONAR_SCANNER="${SONAR_SCANNER_PATH}/sonar-scanner"
${SONAR_SCANNER} -Dsonar.host.url=${SONAR_HOST_URL} -Dsonar.projectKey=${PROJECT_KEY} -Dsonar.projectName=${PROJECT_KEY} -Dsonar.projectBaseDir=${BASE_DIR} -Dsonar.projectVersion=${PROJECT_VERSION} -Dsonar.sources=${PROJECT_SOURCE} -Dsonar.sourceEncoding=${SOURCE_ENCODING} -Dsonar.java.source=${JAVA_VER} -Dsonar.java.libraries=${THIRD_PARTY_LIB} -Dsonar.java.binaries=${PROJECT_SOURCE} -Dsonar.scm.disabled=True 

#Future?
#TESTS="" # Comma-separated paths to directories containing test source files.

