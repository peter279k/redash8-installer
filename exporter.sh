#!/bin/bash

echo "Exporting required Docker image TAR files for Redash 8..."

if [[ ! -f ./tar_lists.csv ]]; then
    echo "tar_lists.csv: No such file or directory"
    exit 1;
fi;

for tar_file in $(cat tar_lists.csv)
do
    docker_img_name=$(echo $tar_file | awk '{split($1,a,","); print a[1]}')
    docker_tar_name=$(echo $tar_file | awk '{split($1,a,","); print a[2]}')

    docker save $docker_img_name -o $docker_tar_name
done;

echo "Exporting required Docker image files have been done."
