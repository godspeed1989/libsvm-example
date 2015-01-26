#!/bin/sh

# This script will grab the LibSVM formatted version of the
# MNIST database if we don't already have it.
if [ ! -d "data" ]; then
	mkdir data
	mkdir data/mnist
fi
if [ -d "data" ]; then
	if [ ! -d "data/mnist" ]; then
		mkdir mnist
	fi
fi

# train data
cd ./data/mnist
if [ -f "mnist.scale" ]; then
	echo "[mnist.scale] Nothing to do."
fi
if [ ! -f "mnist.scale" ]; then
	#wget http://www.csie.ntu.edu.tw/~cjlin/libsvmtools/datasets/multiclass/mnist.scale.bz2
	bzip2 -dk mnist.scale.bz2
fi

# test data
if [ -f "mnist.scale.t" ]; then
	echo "[mnist.scale.t] Nothing to do."
fi
if [ ! -f "mnist.scale.t" ]; then
	#wget http://www.csie.ntu.edu.tw/~cjlin/libsvmtools/datasets/multiclass/mnist.scale.t.bz2
	bzip2 -dk mnist.scale.t.bz2
fi

