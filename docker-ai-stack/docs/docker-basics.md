# Docker Usage Guide

## Table of Contents
- [Installing Docker on Ubuntu](#installing-docker-on-ubuntu)
  - [Using the Convenience Script](#using-the-convenience-script)
  - [Starting Docker](#starting-docker)
  - [Troubleshooting Startup Error](#troubleshooting-startup-error)
- [Testing Docker Installation](#testing-docker-installation)
- [Working with Images](#working-with-images)
  - [Search for Images](#search-for-images)
  - [Pull an Image](#pull-an-image)
  - [View Local Images](#view-local-images)
  - [Delete an Image](#delete-an-image)
- [Running Containers](#running-containers)
  - [Start an Interactive Container](#start-an-interactive-container)
  - [Exiting a Container](#exiting-a-container)
  - [Run Container in Background](#run-container-in-background)
  - [View All Containers](#view-all-containers)
  - [Stop a Container](#stop-a-container)
  - [Start a Container](#start-a-container)
  - [Delete a Container](#delete-a-container)
- [Docker Compose Usage](#docker-compose-usage)
  - [Setting Up the Repository](#setting-up-the-repository)
  - [Installing Docker Compose](#installing-docker-compose)
  - [Docker Compose Example](#docker-compose-example)

---

## Installing Docker on Ubuntu

Open the official Docker installation guide:  
[https://docs.docker.com/engine/install/ubuntu/](https://docs.docker.com/engine/install/ubuntu/)

### Using the Convenience Script

Execute the installation commands:

```bash
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
```

### Starting Docker

```bash
sudo service docker start
```

### Troubleshooting Startup Error

If you encounter this error:

```
/etc/init.d/docker: 62: ulimit: error setting limit (Invalid argument)
```

Edit the Docker init script:

```bash
sudo vim /etc/init.d/docker
```

On line 62, change:

```bash
ulimit -Hn 524288
```

To:

```bash
ulimit -n 524288
```

After making the change, restart Docker:

```bash
sudo service docker restart
```

---

## Testing Docker Installation

Run the following command to pull and run a simple Docker container:

```bash
docker run hello-world
```

If successful, you'll see the welcome message: **Hello from Docker!**

---

## Working with Images

### Search for Images

Search for available images on Docker Hub:

```bash
docker search ubuntu
```

### Pull an Image

Pull an image to local:

```bash
docker pull ubuntu
```

### View Local Images

View local images:

```bash
docker images
```

### Delete an Image

Delete an image:

```bash
docker rmi <image_id>
```

---

## Running Containers

### Start an Interactive Container

Start an interactive container:

```bash
docker run -it ubuntu bash
```

**Parameter Explanation:**
- `run`: Run a new container
- `-it`: Combination of two parameters:
  - `-i`: Interactive operation
  - `-t`: Terminal (allocates a pseudo-terminal)
- `ubuntu`: Specifies the base image (Ubuntu OS image)
- `bash`: Command to execute after container starts (starts bash shell)

### Exiting a Container

In the container shell, type `exit` or press `Ctrl+D` to exit and stop the container.

### Run Container in Background

Run container in background:

```bash
docker run -d ubuntu sleep 1000
```

**Parameter Explanation:**
- `ubuntu`: Image name
- `sleep 1000`: Command to execute inside the container after startup (can be replaced with other commands like running a script)

### View All Containers

View all containers (including stopped ones):

```bash
docker ps -a
```

### Stop a Container

Stop a container:

```bash
docker stop <container_id>
```

### Start a Container

Start a container:

```bash
docker start <container_id>
```

### Delete a Container

Delete a container:

```bash
docker rm <container_id>
```

---

## Docker Compose Usage

### Setting Up the Repository

Reference: [https://docs.docker.com/compose/install/linux/#install-using-the-repository](https://docs.docker.com/compose/install/linux/#install-using-the-repository)

### Installing Docker Compose

Install Docker Compose:

```bash
# Installation
sudo apt-get install docker-compose-plugin

# Verify installation
docker compose version
```

### Docker Compose Example

Docker Compose example: Flask app  
Reference: [https://docs.docker.com/compose/gettingstarted/](https://docs.docker.com/compose/gettingstarted/)
