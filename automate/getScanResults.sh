#!/bin/bash
##usage ./sonar_result.sh ProjectKey

##properties to be passed in from JIRA
PROJECT_KEY="$1"

##properties to be maintained by project
SONAR_HOST_URL="http://127.0.0.1:9000/sonarqube"

##Don't modify below this line
qualityGateResult=$(curl -sX GET "$SONAR_HOST_URL/api/qualitygates/project_status?projectKey=$PROJECT_KEY" | grep -oP "status\":\"\K(\w*)" | head -1)
# echo "QUALITY GATE RESULT: $qualityGateResult"
if [ "$qualityGateResult" == "ERROR" ]
then
  printf "FAIL"
else
  printf "PASS"
fi

