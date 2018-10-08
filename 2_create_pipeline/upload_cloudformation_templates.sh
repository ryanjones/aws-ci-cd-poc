#!/usr/bin/env bash

function usage {
     echo """
     Upload cloudformation templates to S3

     upload_cloudformation_templates.sh <s3_bucket_name>
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

aws s3 cp ./2_create_pipeline/ "s3://$S3_BUCKET" --recursive --exclude "*.sh" --region=us-east-1 --output=json
