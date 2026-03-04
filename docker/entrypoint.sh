#!/bin/bash
set -e

source /opt/ros/humble/setup.bash
source install/setup.bash

echo "=========================================="
echo " Barracuda Ping 360 Workspace Ready! "
echo "=========================================="

exec "$@"