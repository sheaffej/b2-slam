
MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

${MYDIR}/dev_cmd.sh rosbag play --clock /root/Downloads/b2_bags/b2_downstairs_2020-03-14-18-52-55.bag

