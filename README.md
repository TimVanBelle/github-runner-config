# GitHub Self-Hosted Runner Configuration

This repository contains the configuration for a self-hosted GitHub Actions runner.

## Setup Instructions

1. Clone this repository
2. Copy `.env.template` to `.env`
3. Fill in your GitHub details in `.env`
4. Deploy using Docker Compose or Portainer

## Environment Variables

- `RUNNER_NAME`: Name of your runner (default: hostinger-self-hosted-runner-1)
- `ACCESS_TOKEN`: GitHub Personal Access Token
- `REPO_OWNER`: GitHub username or organization
- `REPO_NAME`: Repository name
- `RUNNER_LABELS`: Labels for the runner
- `RUNNER_WORKDIR`: Working directory for the runner
- `RUNNER_GROUP`: Runner group name

## Deployment

Using Docker Compose:
```bash
docker-compose up -d