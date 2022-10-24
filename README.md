


# Configuration

Make sure to load all the module (if running on HPC) from `data-prep.sh`.

In addition, create a file `~/.R/Makevars` with the following contents:

```
MAKEFLAGS = -j8

## C++ flags
CXX=g++
CXX11=g++
CXX14=g++
CXX17=g++

CXXFLAGS=-O3 -march=native -Wno-ignored-attributes
CXX11FLAGS=-O3 -march=native -Wno-ignored-attributes
CXX14FLAGS=-O3 -march=native -Wno-ignored-attributes
CXX17FLAGS=-O3 -march=native -Wno-ignored-attributes

CXXPICFLAGS=-fPIC
CXX11PICFLAGS=-fPIC
CXX14PICFLAGS=-fPIC
CXX17PICFLAGS=-fPIC

CXX11STD=-std=c++11
CXX14STD=-std=c++14
CXX17STD=-std=c++17

## C flags
CC=gcc
CFLAGS=-O3 -march=native

## Fortran flags
FC=gfortran
F77=gfortran
FFLAGS=-O3 -march=native
FCFLAGS=-O3 -march=native


```

See [here](https://github.com/stan-dev/rstan/issues/892)
for more details