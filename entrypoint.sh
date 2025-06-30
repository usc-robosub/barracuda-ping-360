#!/usr/bin/bash
source /opt/ros/melodic/setup.bash

# Build & Source catkin_ws
cd /opt/barracuda-sonar/catkin_ws
catkin clean
catkin build
source devel/setup.bash

roslaunch ping360_sonar example.launch || true

# Keep container running if roslaunch fails or exits
# while true; do sleep 1000; done

