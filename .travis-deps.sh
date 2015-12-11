#!/bin/bash

if [ "$TRAVIS_OS_NAME" == "linux" ]
then
  # Add repositories
  sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test/
  sudo add-apt-repository -y ppa:kubuntu-ppa/backports
  sudo add-apt-repository -y 'deb http://llvm.org/apt/precise/ llvm-toolchain-precise-3.6 main'
  wget -O - http://llvm.org/apt/llvm-snapshot.gpg.key | sudo apt-key add -
  sudo apt-get update -qq

  # Install newer GCC
  sudo apt-get install -qq gcc-4.8 g++-4.8
  sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 20
  sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 20

  # Install newer CMake
  sudo apt-get install -qq cmake

  # Install Clang + LLVM
  sudo apt-get install -qq llvm-3.6-dev libclang-3.6-dev clang-3.6
  sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-3.6 20
  sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-3.6 20
  sudo rm /usr/local/clang-3.4/bin/clang
  sudo rm /usr/local/clang-3.4/bin/clang++

  # Other dependencies
  sudo apt-get install -qq libedit-dev
elif [ "$TRAVIS_OS_NAME" == "osx" ]
then
  # TODO
  brew update
  brew search llvm
  brew install llvm --with-clang
  ls /usr/local/Cellar/llvm
fi
