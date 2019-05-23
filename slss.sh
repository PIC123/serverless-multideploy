#!/bin/bash

echo 'Deploying function to' $1

source ./config

if [ $1 = "aws" ]; then
    mv serverless-aws.yml serverless.yml
    sls deploy
    mv serverless.yml serverless-aws.yml
else
    mv serverless-azure.yml serverless.yml
    sls deploy
    mv serverless.yml serverless-azure.yml
fi