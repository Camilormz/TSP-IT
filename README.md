# TSP-IT
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

An Independence Test based on Data-Driven Tree-Structured Representations.

## Contents
This repository includes:
- A Python wrapper to C++ implementation of the mutual information estimator based on data-driven tree-structured partitions (TSP) presented by [Silva et al. (2012)](https://arxiv.org/pdf/2110.14122.pdf).
- A Python implementation of the independence test based on the data-driven tree-structured partitions (TSP) presented by [Gonzalez et al. (2021)](https://arxiv.org/pdf/2110.14122.pdf) (including all the experiments developed).

## Usage
- Python package `TSP.py` example of use.
```Python
import sys
import numpy as np
# Set the TSP.py package path
sys.path.insert(1, '../src/build')
# Then import the package
from TSP import TSP

# Initialize NumPy arrays of shape (n_samples, dim) with random 
# variables samples in Fortran-contiguous memory order
X = np.array([...], order='F')
Y = np.array([...], order='F')

# Initialize the TSP with its parameters
l_bn = 0.167
w_bn = 5e-2
reg_factor = 2.5e-5
tsp = TSP(l_bn, w_bn, reg_factor)

# Set observations to the estimator
tsp.grow(X, Y)

# Get TSP size and estimated mutual information
size = tsp.size()
emi = tsp.emi()

# Regularize the TSP mutual information estimator
tsp.regularize()

# Get the regularized TSP size and estimated mutual information
reg_size = tsp.size()
reg_emi = tsp.emi()
```

## Installation

### From Binaries
... 

### Install From Source

#### Prerequisites
If you are installing from source, you will need:
* Python 3.7 or later (for Linux, Python 3.7.6+ or 3.8.1+ is needed)
* A C++14 compatible compiler, such as clang
* Clone this repo to your local machine using `https://github.com/mvidela31/TSP-IT`

#### Install Dependencies
* [Eigen](http://eigen.tuxfamily.org/).
* [CMake](https://cmake.org/).
* [Boost](https://www.boost.org/).
* [Python 3](https://www.python.org/).
* [NumPy](https://numpy.org/).

##### Ubuntu:
```Shell
apt install cmake libeigen3-dev libboost-all-dev
```

##### Arch:
```Shell
pacman -S cmake eigen boost
```

### Compilation
```Shell
cd ./src/build
cmake .. -DNUMPY_INCLUDE_PATH=$(dirname $(python -c 'import numpy as np; print(np.__file__)'))/cor
e/include}
make
```
- The python package `TSP.py` it's now built! Now you can run the Jupyter notebooks from the folder `experiments`.


## References
[[1](https://arxiv.org/pdf/2110.14122.pdf)]  Gonzalez, M. E., Silva, J. F., Videla, M., & Orchard, M. E. (2021). **Data-Driven Representations for Testing Independence: Modeling, Analysis and Connection with Mutual Information Estimation**. *IEEE Transactions on Signal Processing, 70*, 158-173.

[[2](https://sail.usc.edu/publications/files/silva_tit_2012.pdf)] Silva, J. F., & Narayanan, S. (2012). **Complexity-Regularized Tree-Structured Partition for Mutual Information Estimation**. *IEEE Transactions on Information Theory, 58*(3), 1940-1952.
