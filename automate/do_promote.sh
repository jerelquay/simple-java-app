#!/bin/bash

ansible-playbook ./automate/promote.yml --extra-vars "targetFolder=$1 backupFolder=$2 env=$3"  -i automate/hosts.ini -v

