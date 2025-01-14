#!/bin/bash

cd /home/runner/actions-runner

# Configure the runner with new variable names
./config.sh --url https://github.com/${REPO_OWNER}/${REPO_NAME} \
    --token ${ACCESS_TOKEN} \
    --name ${RUNNER_NAME} \
    --labels ${RUNNER_LABELS} \
    --unattended \
    --replace

# Start the runner
./run.sh