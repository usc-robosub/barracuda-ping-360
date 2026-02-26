cmake_minimum_required(VERSION 3.5)
project(barracuda_ping_360)

find_package(ament_cmake REQUIRED)
find_package(ament_cmake_python REQUIRED)

# Install Python modules
ament_python_install_package(barracuda_ping_360)

# Install entry point script (ament_cmake_python does not install console_scripts from setup.py)
install(PROGRAMS scripts/ping360_node DESTINATION lib/${PROJECT_NAME})

# Install launch files
install(DIRECTORY
  launch
  DESTINATION share/${PROJECT_NAME}
)

ament_package()
