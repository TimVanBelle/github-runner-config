FROM ubuntu:22.04

# Set environment variables
ENV RUNNER_NAME="hostinger-self-hosted-runner-1"
ENV ACCESS_TOKEN=""
ENV REPO_OWNER=""
ENV REPO_NAME=""
ENV RUNNER_LABELS="self-hosted,linux,docker"
ENV RUNNER_WORKDIR="/home/runner/work"
ENV RUNNER_GROUP="default"

# Install required packages
RUN apt-get update && apt-get install -y \
    curl \
    tar \
    jq \
    wget \
    unzip \
    sudo \
    git \
    && rm -rf /var/lib/apt/lists/*

# Create a runner user
RUN useradd -m runner && \
    usermod -aG sudo runner && \
    echo "runner ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Switch to runner user
USER runner
WORKDIR /home/runner

# Download and install GitHub Actions runner
RUN mkdir actions-runner && cd actions-runner && \
    curl -o actions-runner-linux-x64-2.311.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.311.0/actions-runner-linux-x64-2.311.0.tar.gz && \
    tar xzf ./actions-runner-linux-x64-2.311.0.tar.gz

# Copy the startup script
COPY --chown=runner:runner start.sh /home/runner/start.sh
RUN chmod +x /home/runner/start.sh

RUN mkdir -p ${RUNNER_WORKDIR}

# Start the runner
ENTRYPOINT ["/home/runner/start.sh"]