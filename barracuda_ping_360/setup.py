import os
from glob import glob
from setuptools import find_packages, setup

package_name = 'barracuda_ping_360'

setup(
    name=package_name,
    version='2.0.0',
    packages=find_packages(exclude=[]),
    data_files=[
        ('share/ament_index/resource_index/packages', 
            ['resource/' + package_name]),
        ('share/' + package_name, ['package.xml']),
        (os.path.join('share', package_name, 'launch'), glob('launch/*')),
    ],
    install_requires=[
        'setuptools',
        'numpy',
        'cv-bridge'
    ],
    zip_safe=True,
    maintainer='Takatoshi',
    maintainer_email='takatoshi@example.com',
    description='Barracuda AUV with Ping360 Sonar ROS2 Package',
    license='MIT',
    tests_require=[],
    entry_points={
        'console_scripts': [
            'ping360_node = barracuda_ping_360.node:main',
        ],
    },
)
