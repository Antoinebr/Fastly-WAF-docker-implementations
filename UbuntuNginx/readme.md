# Fastly WAF Ubuntu and Nginx Setup

This repo provides a ready demo the Fastly Next-Gen WAF (formerly known as Signal Sciences) on Ubuntu with Nginx using Docker. The NGINX dynamic module is compiled and then dynamically loaded into NGINX at runtime without recompiling the entire NGINX binary. This module is written in C and can be integrated with NGINX Open Source and NGINX Plus.

## Overview

The Next-Gen WAF agent is a small process that provides the interface between your web server and Fastly's analysis platform. An inbound web request is passed to the agent, which then decides whether the request should be permitted to continue, blocked, rate limited, or tagged with signals. Depending on your deployment method, the agent is typically installed directly on your web server or as a sidecar extending your existing deployment.


## How to Use

This `Makefile` provides a set of commands for building, running, and managing a Docker container for the Fastly WAF setup. Below is an explanation of the main commands and their functionalities.

### Variables

- **IMAGE_NAME**: Name of the Docker image to be built (`my-ubuntu-nginx`).
- **CONTAINER_NAME**: Name of the Docker container to be created (`my-ubuntu-nginx-container`).
- **PORT**: Port number to be used for the container (`9999`).
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
