Here's the updated `README.md` to reflect the changes based on the provided Makefile:
# Fastly WAF Debian and Apache Setup

This repository provides a ready demo for the Fastly Next-Gen WAF (formerly known as Signal Sciences) on Debian with Apache2 using Docker.

## Overview

The Next-Gen WAF agent is a small process that provides the interface between your web server and Fastly's analysis platform. An inbound web request is passed to the agent, which then decides whether the request should be permitted to continue, blocked, rate limited, or tagged with signals. Depending on your deployment method, the agent is typically installed directly on your web server or as a sidecar extending your existing deployment.

## How to Use

This `Makefile` provides a set of commands for building, running, and managing a Docker container for the Fastly WAF setup. Below is an explanation of the main commands and their functionalities.

### Variables

- **IMAGE_NAME**: Name of the Docker image to be built (`my-debian-apache2`).
- **CONTAINER_NAME**: Name of the Docker container to be created (`my-debian-apache2-container`).
- **PORT**: Port number to be used for the container (`8888`).
- **HOST_WWW_DIR**: Directory on the host machine to be mounted as a volume in the container (`$(PWD)/www`).
- **ACCESS_KEY_ID**: Access key ID for the Signal Sciences agent.
- **SECRET_ACCESS_KEY**: Secret access key for the Signal Sciences agent.

### Commands

#### Default Target

- **all**: Default target that runs both `build` and `run` commands sequentially.
  ```sh
  make all
  ```

#### Build Commands

- **build**: Builds the Docker image using the Dockerfile in the current directory.
  ```sh
  make build
  ```

- **build-no-cache**: Builds the Docker image without using the cache.
  ```sh
  make build-no-cache
  ```

#### Container Management Commands

- **run**: Runs the Docker container with the specified environment variables, port, and volume mount.
  ```sh
  make run
  ```

- **start**: Starts the Docker container if it is stopped.
  ```sh
  make start
  ```

- **stop**: Stops the Docker container if it is running.
  ```sh
  make stop
  ```

- **rm**: Removes the Docker container.
  ```sh
  make rm
  ```

- **clean**: Stops and removes the Docker container.
  ```sh
  make clean
  ```

#### Image Management Command

- **rmi**: Removes the Docker image.
  ```sh
  make rmi
  ```

#### Utility Commands

- **logs**: Views the logs from the Docker container.
  ```sh
  make logs
  ```

- **shell**: Opens a shell into the running Docker container.
  ```sh
  make shell
  ```

- **images**: Lists all Docker images on the host machine.
  ```sh
  make images
  ```

- **ps**: Lists all Docker containers on the host machine.
  ```sh
  make ps
  ```
