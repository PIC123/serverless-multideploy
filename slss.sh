#!/bin/bash
export SLS_DEBUG=*

echo 'Deploying function to' $1

source ./config

if [[ $2 = "deploy" ]]; then
    if [[ $1 = "aws" ]]; then
        mv serverless-aws.yml serverless.yml
        sls deploy -r us-west-1
        mv serverless.yml serverless-aws.yml
    else
        mv serverless-azure.yml serverless.yml
        sls deploy
        mv serverless.yml serverless-azure.yml
    fi
else
    if [ $1 = "aws" ]; then
        mv serverless-aws.yml serverless.yml
        sls invoke local -f hello -p httpTest.json
        mv serverless.yml serverless-aws.yml
    else
        mv serverless-azure.yml serverless.yml
        sls invoke local -f hello -p httpTest.json
        mv serverless.yml serverless-azure.yml
    fi
fi