# ROS1 Brigde demo (Noetic and Foxy)

This repository contains the Dockerfile for the ROS1_brigde demo.

This package provides a network bridge that allows the exchange of messages between ROS 1 and ROS 2.

This package is capable of bridging the stantard ROS interfaces (messages/services) listed in the [ros2/common_interfaces](https://github.com/ros2/common_interfaces) repository.

To utilize the bridge with custom message types, it becomes necessary to construct the package from its source code. Additionally, the custom types need to be incorporated into separate workspaces for both ROS 1 and ROS 2. Specifically regarding services, explicit bridging is required between ROS 2 and ROS 1, as well as between ROS 1 and ROS 2.

## Running

In this demo, the 'ros1_bridge' package will be used to establish a network bridge to teleoperate 'turtlesim', running in ROS2, from ROS1. This requires using the 'turtlesim' package in ROS2 Foxy (`ros-foxy-turtlesim`) and the teleoperation package in ROS1 Noetic (`ros-noetic-teleop-twist-keyboard`). To perform this, follow these steps:

1. Get source code:

```bash
git clone https://github.com/GGomezMorales/ros1_brigde_demo.git
```

2. Go to the specific path:

```bash
cd ros1_brigde_demo
```

3. Build and execute the docker image:

```bash
./scripts/build.sh
./scripts/run.sh
```

4. Open three terminals (terminal #1, terminal #2 and terminal #3)

In terminal #1, #2 and #3, run the following command to access the docker container terminal:

```bash
./scripts/bash.sh
```

* Inside the ROS terminal #1 (container), run:

  ```bash
  ros2 run ros1_bridge dynamic_bridge 
  ```
* Inside the ROS terminal #2 (container), run:

  ```bash
  ros2 run turtlesim turtlesim_node
  ```
* Inside the ROS terminal #3 (container), run:

  ```bash
  rosrun teleop_twist_keyboard teleop_twist_keyboard.py cmd_vel:=turtle1/cmd_vel
  ```

## Demo

https://github.com/GGomezMorales/ros1_brigde_demo/assets/123125407/1e991f79-b527-47c7-8e65-c41a5659b219



