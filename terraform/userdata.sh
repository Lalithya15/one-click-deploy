#!/bin/bash
yum update -y
curl -sL https://rpm.nodesource.com/setup_16.x | bash -
yum install -y nodejs git

mkdir -p /app
cd /app

cp -r /tmp/app/* /app/

npm install
nohup npm start &
