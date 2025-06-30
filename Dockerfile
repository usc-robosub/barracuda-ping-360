FROM ros:melodic-ros-base-bionic

ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies
RUN apt-get update && apt-get install -y \
    python-pip \
    python-numpy \
    python-setuptools \
    python-dev \
    build-essential \
    ros-melodic-cv-bridge \
    ros-melodic-image-transport \
    ros-melodic-roslaunch \
    git \
    ros-melodic-roslint \
    ros-melodic-tf \
    ros-melodic-rqt-common-plugins \
    ros-melodic-catkin \
    && rm -rf /var/lib/apt/lists/*

# Install catkin tools (Python 2 version for Melodic)
RUN pip install catkin-tools

# Install correct version of bluerobotics-ping
RUN pip install bluerobotics-ping==0.0.9

COPY . /opt/barracuda-sonar

WORKDIR /opt/barracuda-sonar/catkin_ws

# Set working directory
WORKDIR /opt

CMD ["/bin/bash", "/opt/barracuda-sonar/entrypoint.sh"]
