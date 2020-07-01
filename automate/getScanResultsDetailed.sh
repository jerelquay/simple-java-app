#!/bin/bash
#usage ./sonar_result.sh ProjectKey

#properties to be passed in from JIRA
PROJECT_KEY="$1"

#properties to be maintained by project
SONAR_HOST_URL="http://127.0.0.1:9000/sonarqube"

#vul=$(curl -sX GET "$SONAR_HOST_URL/api/issues/search?projectKeys=$PROJECT_KEY&types=VULNERABILITY&resolved=false"| grep -oE 'total[^,]+' | head -1 | cut -c 8- );
#bug=$(curl -sX GET "$SONAR_HOST_URL/api/issues/search?projectKeys=$PROECT_KEY&types=BUG&resolved=false"| grep -oE 'total[^,]+' | head -1 | cut -c 8- );
#codesmell=$(curl -sX GET "$SONAR_HOST_URL/api/issues/search?projectKeys=$PROJECT_KEY&types=CODE_SMELL&resolved=false"| grep -oE 'total[^,]+' | head -1 | cut -c 8- );
#securityH=$(curl -sX GET "$SONAR_HOST_URL/api/issues/search?projectKeys=$PROJECT_KEY&types=SECURITY_HOTSPOT&resolved=false"| grep -oE 'total[^,]+' | head -1 | cut -c 8- );

blockerB=$(curl -sX GET "$SONAR_HOST_URL/api/issues/search?projectKeys=$PROJECT_KEY&types=BUG&severities=BLOCKER&resolved=false"| grep -oE 'total[^,]+' | head -1 | cut -c 8- );
blockerV=$(curl -sX GET "$SONAR_HOST_URL/api/issues/search?projectKeys=$PROJECT_KEY&types=VULNERABILITY&severities=BLOCKER&resolved=false"| grep -oE 'total[^,]+' | head -1 | cut -c 8- );
blockerC=$(curl -sX GET "$SONAR_HOST_URL/api/issues/search?projectKeys=$PROJECT_KEY&types=CODE_SMELL&severities=BLOCKER&resolved=false"| grep -oE 'total[^,]+' | head -1 | cut -c 8- );

criticalC=$(curl -sX GET "$SONAR_HOST_URL/api/issues/search?projectKeys=$PROJECT_KEY&types=CODE_SMELL&severities=CRITICAL&resolved=false"| grep -oE 'total[^,]+' | head -1 | cut -c 8- );
criticalB=$(curl -sX GET "$SONAR_HOST_URL/api/issues/search?projectKeys=$PROJECT_KEY&types=BUG&severities=CRITICAL&resolved=false"| grep -oE 'total[^,]+' | head -1 | cut -c 8- );
criticalV=$(curl -sX GET "$SONAR_HOST_URL/api/issues/search?projectKeys=$PROJECT_KEY&types=VULNERABILITY&severities=CRITICAL&resolved=false"| grep -oE 'total[^,]+' | head -1 | cut -c 8- );
#major=$(curl -sX GET "$SONAR_HOST_URL/api/issues/search?projectKeys=L1DX&types=CODE_SMELL&severities=MAJOR&resolved=false"| grep -oE 'total[^,]+' | head -1 | cut -c 8- );
majorB=$(curl -sX GET "$SONAR_HOST_URL/api/issues/search?projectKeys=$PROJECT_KEY&types=BUG&severities=MAJOR&resolved=false"| grep -oE 'total[^,]+' | head -1 | cut -c 8- );
majorV=$(curl -sX GET "$SONAR_HOST_URL/api/issues/search?projectKeys=$PROJECT_KEY&types=VULNERABILITY&severities=MAJOR&resolved=false"| grep -oE 'total[^,]+' | head -1 | cut -c 8- );
majorC=$(curl -sX GET "$SONAR_HOST_URL/api/issues/search?projectKeys=$PROJECT_KEY&types=CODE_SMELL&severities=MAJOR&resolved=false"| grep -oE 'total[^,]+' | head -1 | cut -c 8- );

minorB=$(curl -sX GET "$SONAR_HOST_URL/api/issues/search?projectKeys=$PROJECT_KEY&types=BUG&severities=MAJOR&resolved=false"| grep -oE 'total[^,]+' | head -1 | cut -c 8- );
minorV=$(curl -sX GET "$SONAR_HOST_URL/api/issues/search?projectKeys=$PROJECT_KEY&types=VULNERABILITY&severities=MAJOR&resolved=false"| grep -oE 'total[^,]+' | head -1 | cut -c 8- );
minorC=$(curl -sX GET "$SONAR_HOST_URL/api/issues/search?projectKeys=$PROJECT_KEY&types=CODE_SMELL&severities=MINOR&resolved=false"| grep -oE 'total[^,]+' | head -1 | cut -c 8- );

infoB=$(curl -sX GET "$SONAR_HOST_URL/api/issues/search?projectKeys=$PROJECT_KEY&types=BUG&severities=INFO&resolved=false"| grep -oE 'total[^,]+' | head -1 | cut -c 8- );
infoV=$(curl -sX GET "$SONAR_HOST_URL/api/issues/search?projectKeys=$PROJECT_KEY&types=VULNERABILITY&severities=INFO&resolved=false"| grep -oE 'total[^,]+' | head -1 | cut -c 8- );
infoC=$(curl -sX GET "$SONAR_HOST_URL/api/issues/search?projectKeys=$PROJECT_KEY&types=CODE_SMELL&severities=INFO&resolved=false"| grep -oE 'total[^,]+' | head -1 | cut -c 8- );
#qualityGateResult=$(curl -sX GET "$SONAR_HOST_URL/api/qualitygates/project_status?projectKey=$PROJECT_KEY" | grep -oP "status\":\"\K(\w*)" | head -1)

#echo "Total number of VULNERABILITIES are $no_vul"
#echo "Total number of BUGS are $no_bug"
#echo "Total number of CODE_SMELL are $no_codesmell"
#echo "$no_vul,$no_bug,$no_codesmell,$no_securityH"
#echo "BUG=$no_bug x=$no_blockerB y=$no_criticalB a=$no_majorB b=$no_minorB z=$no_infoB"
#echo "VUL=$no_vul x=$no_blockerV y=$no_criticalV a=$no_majorV b=$no_minorV z=$no_infoV"
#echo "C_S=$no_codesmell x=$no_blockerC y=$no_criticalC a=$no_majorC b=$no_minorC z=$no_infoC"

#echo " project Key $PROJECT_KEY"
printf "\t\t\tBLOCKER\t   CRIT   MAJ  MIN  INFO\nBUGS\t\t\t$blockerB\t\t$criticalB\t$majorB\t$minorB\t$infoB\nVULNERABILITIES\t$blockerV\t\t$criticalV\t$majorV\t$minorV\t$infoV\nCODE SMELLS\t\t$blockerC\t\t$criticalC\t$majorC\t$minorC\t$infoC"

#gio open $SONAR_HOST_URL/project/issues?id=$PROJECT_KEY&resolved=false
