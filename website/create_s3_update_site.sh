#!/usr/bin/env bash

function usage {
     echo """
     Creates a bucket to host the SAM template to run the cloudformation

     upload_website.sh <s3_bucket_name>

     ex:
     new_s3_host_main.sh samfarm-app-demo-app-bucket
     """
 }


S3_BUCKET=''

 # Get the table name
 if [ $# -eq 0 ]; then
     usage;
     exit;
 else
     S3_BUCKET="$1"
 fi

aws s3 cp ./website/ "s3://$S3_BUCKET" --recursive --exclude "*.yaml"
