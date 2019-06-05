#!/bin/bash

echo 'Deploying function to' $1

source ./config

if [[ $2 = "deploy" ]]; then
    if [[ $1 = "aws" ]]; then
        mv serverless-aws-s3.yml serverless.yml
        sls deploy
        mv serverless.yml serverless-aws-s3.yml
    else
        mv serverless-azure-blob.yml serverless.yml
        sls deploy
        mv serverless.yml serverless-azure-blob.yml
    fi
else
    if [ $1 = "aws" ]; then
        mv serverless-aws-s3.yml serverless.yml
        sls invoke local -f hello -p httpTest.json
        mv serverless.yml serverless-aws-s3.yml
    else
        mv serverless-azure-blob.yml serverless.yml
        sls invoke local -f hello -p httpTest.json
        mv serverless.yml serverless-azure-blob.yml
    fi
fi