HOST_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

alias run_base="docker run -it --rm --name nccr_manet_base --net=host --privileged symbiobox/nccr_manet bash -c 'ROS_MASTER_URI=http://192.168.168.1:11311 ROS_IP=192.168.168.1 ROS_HOSTNAME=192.168.168.1 roslaunch nccr_manet base_station.launch'"


alias run_base_st="docker run -d --restart=always --name nccr_manet_base_st --net=host --privileged symbiobox/nccr_manet bash -c 'ROS_MASTER_URI=http://192.168.168.1:11311 ROS_IP=192.168.168.1 ROS_HOSTNAME=192.168.168.1 roslaunch nccr_manet base_station.launch'"

alias run_vstream="docker run -it --rm --name nccr_manet_vstream --net=host --privileged symbiobox/nccr_vstream video_stream.sh"
