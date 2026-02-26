FROM ros:humble-ros-base

ENV DEBIAN_FRONTEND=noninteractive
ENV ROS_DISTRO=humble

# Install system dependencies 
RUN apt-get update && apt-get install -y \
    python3-pip \
    ros-humble-cv-bridge \
    ros-humble-image-transport \
    libboost-dev \
    libboost-program-options-dev \
    libboost-system-dev \
    libboost-thread-dev \
    libboost-atomic-dev \
    && pip install bluerobotics-ping \
    && rm -rf /var/lib/apt/lists/*

COPY . /opt/barracuda-ping-360
# Use HTTPS for submodules so Docker build can clone without SSH

WORKDIR /opt

# Run the entrypoint script
CMD ["/bin/bash", "/opt/barracuda-ping-360/entrypoint.sh"]
