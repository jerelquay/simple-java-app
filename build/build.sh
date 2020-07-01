#!/bin/bash
# Ansible playbook (build_task.yml) invokes this. The script is expected to return only after the build is fully completed

# simple example of performing a build
cd src

javac Demoapp.java

jar cmf Manifest.mf Demoapp.jar Demoapp.class Demoapp.java

cp Demoapp.jar ../Demoapp.jar