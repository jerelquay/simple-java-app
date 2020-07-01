#!/bin/bash

# passed in by jira
output_dir=$1
rel_name=$2
build_path=$3


#removing any old "tar.gz" files
CleanUp()
{
OLD_GZ_FILE="$(ls -1|grep gz$)"
[ -f ${OLD_GZ_FILE} ] && rm -rf ${OLD_GZ_FILE} 
}

# Compressing all the files for current folder
tar_file()
{

tar -czf ${rel_name}.tar.gz *

}

 build()
{
         
    output_dir=$1
    rel_name=$2
    build_path=$3
    ansible-playbook ./automate/build.yml --extra-vars "output_dir=$output_dir  rel_name=$rel_name build_path=$build_path host=BuildServer" -i automate/hosts.ini
    

}
CleanUp
tar_file
build $output_dir $rel_name $build_path   

