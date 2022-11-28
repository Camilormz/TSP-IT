cmake_minimum_required(VERSION 3.18.3)
project(TSP DESCRIPTION "Implementation of an histogram-based mutual information estimator using data-driven tree-structured partitions (TSP)"
            LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

find_package(PythonInterp REQUIRED)
find_package(PythonLibs 3 REQUIRED)
find_package(Boost COMPONENTS python3 REQUIRED)
find_package(Eigen3 3 REQUIRED)

set(PYTHON_INCLUDE_DIRS ${PYTHON_INCLUDE_DIRS} ${NUMPY_INCLUDE_PATH})

python_add_module(TSP TSP.cpp TSPNode.cpp)

target_include_directories(TSP PUBLIC ${Boost_INCLUDE_DIRS} ${PYTHON_INCLUDE_DIRS} Eigen3::Eigen)
target_link_libraries(TSP ${Boost_LIBRARIES} ${PYTHON_LIBRARIES} Eigen3::Eigen)

if (NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
endif()

set(CMAKE_CXX_FLAGS "-Wall -Wextra")
set(CMAKE_CXX_FLAGS_RELEASE "-O2")