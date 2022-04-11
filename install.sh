# TSP-MI installation script
# This script assumes that you have a Python 3 and a NumPy installation

# Installs Boost
sudo apt-get install libboost-all-dev

# Installs Eigen
sudo apt install libeigen3-dev

# Performs the source code compilation
mkdir -p ./src/build
cd ./src/build || echo "Couldn't change directory to ./src/build"
cmake ..
make
cd ../.. || echo "Couldn't change directory to ../.."
