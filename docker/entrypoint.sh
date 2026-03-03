#!/bin/bash
source /opt/ros/humble/setup.bash

# Add ROS and workspace setup to bashrc
echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
echo "source /opt/barracuda-ping-360/catkin_ws/install/setup.bash" >> ~/.bashrc

# Build & Source ROS2 workspace
cd /opt/barracuda-ping-360/catkin_ws
colcon build --symlink-install --merge-install
source install/setup.bash

# Launch the Ping360 node only if build succeeded
if [ -f install/share/barracuda_ping_360/launch/ping360.launch.py ]; then
  exec ros2 launch barracuda_ping_360 ping360.launch.py
else
  echo "Build did not complete successfully; barracuda_ping_360 not installed. Exiting."
  exit 1
fi
