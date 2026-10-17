#!/bin/bash

source /environment.sh

# initialize launch file
dt-launchfile-init

# YOUR CODE BELOW THIS LINE
# ----------------------------------------------------------------------------

# The detector wired into the full Duckietown stack. THIS ONE RUNS ON THE BOT:
#
#     dts devel build -H DUCKIEBOT_NAME -f
#     dts devel run   -H DUCKIEBOT_NAME -L lane_following
#
# No -X here - the robot has no display. Open the debug views from `dts gui`.
echo "=== DEBUG ==="
echo "ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH"

echo "=== CATKIN SETUP ==="
ls -l /code/devel/setup.bash || true

echo "=== PACKAGE ==="
rospack find lane_detection || true

echo "=== LAUNCH FILE ==="
ls -l /code/src/lane-following/packages/lane_detection/launch/ || true

echo "=== END DEBUG ==="

dt-exec roslaunch lane_detection lane_following.launch

# ----------------------------------------------------------------------------
# YOUR CODE ABOVE THIS LINE

# wait for app to end
dt-launchfile-join
