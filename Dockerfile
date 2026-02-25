FROM ros:humble-ros-base

ENV DEBIAN_FRONTEND=noninteractive
ENV ROS_DISTRO=humble

# Install system dependencies
RUN apt-get update && apt-get install -y \
    python3-pip \
    ros-humble-cv-bridge \
    ros-humble-image-transport \
    && pip install bluerobotics-ping \
    && rm -rf /var/lib/apt/lists/*

COPY . /opt/barracuda-ping-360

WORKDIR /opt/barracuda-ping-360

# Set Python path for ping360_sonar sensor module imports (device.py, etc)
# This allows sensor.py to find "device" when it does "from device import PingDevice"
ENV PYTHONPATH="/opt/barracuda-ping-360/catkin_ws/src/ping360_sonar/src/ping360_sonar:${PYTHONPATH}"

# Simple entrypoint: just source ROS2 and run the node
ENTRYPOINT ["bash", "-c", "source /opt/ros/humble/setup.bash && python3 /opt/barracuda-ping-360/catkin_ws/src/barracuda_ping_360/barracuda_ping_360/node.py"]
