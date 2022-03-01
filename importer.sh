#!/bin/bash

for tar_file in $(ls ./*.tar); do docker load -i $tar_file; done;
