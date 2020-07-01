#!/bin/bash

ansible-playbook ./automate/deploy.yml --extra-vars "targetFolder=$1 backupFolder=$2 tarFile=$3 env=$4"  -i automate/hosts.ini -v

