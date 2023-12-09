#!/bin/bash

source /opt/ros/noetic/setup.bash

cd /ros1_ws && catkin_make

source /ros1_ws/devel/setup.bash

roscore
