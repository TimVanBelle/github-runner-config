#!/bin/bash

cd /home/runner/actions-runner

# Configure the runner
./config.sh --url https://github.com/${GITHUB_OWNER}/${GITHUB_REPOSITORY} \
    --token ${GITHUB_PAT} \
    --name ${RUNNER_NAME} \
    --unattended \
    --replace

# Start the runner
./run.sh