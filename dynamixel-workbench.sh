echo "INSTALL DYNAMIXEL_WORKBENCH"
echo "TARGET ROS VERSION >>> ROS NOETIC"
echo "make ws >>> $HOME/dynamixel_ws"
echo "PRESS [ENTER] TO CONTINUE INSTALLATION"
echo "IF YOU WANT TO CANSEL, PRESS [CTRL] + [C]"
read

echo "update & upgrade"
sudo apt update && sudo apt upgrade -y

echo "meke ws"
cd
mkdir -p dynamixel_ws/src
cd dynamixel_ws/src
git clone -b noetic-devel https://github.com/ROBOTIS-GIT/dynamixel-workbench.git
git clone -b noetic-devel https://github.com/ROBOTIS-GIT/dynamixel-workbench-msgs.git
git clone -b noetic-devel https://github.com/ROBOTIS-GIT/DynamixelSDK.git

echo "##### set the dynamixelSDK #####"
sudo apt-get install gcc-5 -y
sudo apt-get install build-essential -y
sudo apt-get install gcc-multilib g++-multilib -y

echo "##### make install /buld/linux64/make #####"
cd ~/dynamixel_ws/src/DynamixelSDK/c++/build/linux64
make
echo "if you ocured error. press [CTRL] + [C]"
sudo make install
cd ../../example/protocol1.0/read_write/linux64/

echo "##### make install /read_write/linux64/"
make
echo "if you ocured error. press [CTRL] + [C]"
sudo make installe

eccho "##### setup Dynamixel-workbench #####"
cd ~/dynamixel_ws/src/dynamixel-workbench/dynamixel_workbench_toolbox/examples
mkdir -p build && cd build
cmake ..
make

echo "SET ARM'S USB."
echo "IF YOU SET IT, PRESS [ENTER]"
read
sudo chmod 777 /dev/ttyUSB0
sudo chmod 777 /dev/ttyUSB1

