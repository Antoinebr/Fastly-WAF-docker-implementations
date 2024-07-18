# Fastly WAF mode demo 

Here's the corrected text:



This repository gathers different on-premise implementations of the Fastly WAF. You will find in the different folders a Debian setup with Apache, an Nginx setup with Ubuntu, and one with a Node.js app and the agent set up as a reverse proxy.

The aim of this repository is to keep track of my different implementations for future reuse and allow users to experiment with a working out-of-the-box demo.


## Demo 


[![My video](./image.png)](https://www.youtube.com/watch?v=CtwaWXZgV9U&ab_channel=AntoineBrossault)

# How to use 

In each folder, you will find a Makefile.sample that you can customize. Of course, you need to put your keys in the Makefile. Once the Makefile is complete, rename it from Makefile.sample to just Makefile, then follow the commands below.



## Variables
- **IMAGE_NAME**: Name of the Docker image to be built e.g : (`debian-sigsci-agent`).
- **CONTAINER_NAME**: Name of the Docker container to be created e.g :(`debian-sigsci-agent-container`).
- **PORT**: Port number to be used for the container e.g : (`8345`).
- **HOST_WWW_DIR**: Directory on the host machine to be mounted as a volume in the container e.g : (`$(PWD)/www`).
- **ACCESS_KEY_ID**: Access key ID for environment variable e.g : (`qssqs-sd-sddsa-dd`).
- **SECRET_ACCESS_KEY**: Secret access key for environment variable e.g : (`sqdqdsqdsqs-OplWZe1IBew999SJDScIGc`).

## Commands

### Default Target
- **all**: Default target that runs both `build` and `run` commands sequentially.

### Build Commands
- **build**: Builds the Docker image using the Dockerfile in the current directory.
  ```sh
  make build
  ```
- **build-no-cache**: Builds the Docker image without using the cache.
  ```sh
  make build-no-cache
  ```

### Container Management Commands
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

### Image Management Command
- **rmi**: Removes the Docker image.
  ```sh
  make rmi
  ```

### Utility Commands
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