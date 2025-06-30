FROM ros:melodic-ros-base-bionic

ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies
RUN apt-get update && apt-get install -y \
    python-pip \
    ros-melodic-cv-bridge \
    ros-melodic-roslint \
    ros-melodic-tf \
    && pip install catkin-tools \
    && pip install bluerobotics-ping \
    && rm -rf /var/lib/apt/lists/*

COPY . /opt/barracuda-sonar

WORKDIR /opt/barracuda-sonar/catkin_ws

# Set working directory
WORKDIR /opt

CMD ["/bin/bash", "/opt/barracuda-sonar/entrypoint.sh"]
