#!/usr/bin/bash
source /opt/ros/melodic/setup.bash

# Add ROS and workspace setup to bashrc
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
echo "source /opt/barracuda-ping-360/catkin_ws/devel/setup.bash" >> ~/.bashrc

# Build & Source catkin_ws
cd /opt/barracuda-ping-360/catkin_ws
catkin clean
catkin build
source devel/setup.bash

roslaunch ping360_sonar example.launch

# Keep container running if roslaunch fails or exits
# while true; do sleep 1000; done

