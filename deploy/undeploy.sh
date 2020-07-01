#!/bin/bash

# Ansible playbook (undeploy_task.yml) invokes this. The script is expected to return only after the undeployment is completed
# The project will determine what un-deployment steps need to be applied for each environment.
# Note that in the PRD environment, JIRA - RETRY will invoke undeploy.sh only while JIRA - ROLLBACK will invoke undeploy.sh followed by deploy.sh
