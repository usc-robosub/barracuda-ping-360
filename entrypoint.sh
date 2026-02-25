#!/bin/bash
source /opt/ros/humble/setup.bash

# Add ROS and workspace setup to bashrc
echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
echo "source /opt/barracuda-ping-360/catkin_ws/install/setup.bash" >> ~/.bashrc

# Build & Source ROS2 workspace
cd /opt/barracuda-ping-360/catkin_ws
colcon build --symlink-install
source install/setup.bash

# Launch the Ping360 node
ros2 launch barracuda_ping_360 ping360.launch.py
