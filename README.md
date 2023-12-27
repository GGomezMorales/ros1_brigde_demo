# ROS1 Bridge Demo (Noetic and Foxy)

This repository hosts the Dockerfile for the ROS1_bridge demo, which enables a network bridge for message exchange between ROS 1 and ROS 2 systems. It is specifically designed to bridge standard ROS interfaces (messages/services) as listed in the [ros2/common_interfaces](https://github.com/ros2/common_interfaces) repository.

For custom message types, build the package from source and incorporate these types into separate workspaces for both ROS 1 and ROS 2.

1. Clone the Repository:
   ```bash
   git clone https://github.com/GGomezMorales/ros1_brigde_demo.git
   ```

2. Navigate to the Repository:
   ```bash
   cd ros1_brigde_demo
   ```

3. Build and Run the Docker Image:
   ```bash
   ./scripts/build.sh
   ./scripts/run.sh
   ```

4. Access the Docker Container:
   Open three terminals and run in each:
   ```bash
   ./scripts/bash.sh
   ```

   Inside the container terminals:
   - Terminal #1:
       ```bash
       ros2 run ros1_bridge dynamic_bridge
       ```
   - Terminal #2:
       ```bash
       `ros2 run turtlesim turtlesim_node
       ```
   - Terminal #3:
       ```bash
       rosrun teleop_twist_keyboard teleop_twist_keyboard.py cmd_vel:=turtle1/cmd_vel
       ```

## Demo

https://github.com/GGomezMorales/ros1_brigde_demo/assets/123125407/1e991f79-b527-47c7-8e65-c41a5659b219



