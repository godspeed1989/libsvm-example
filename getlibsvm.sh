#!/bin/sh

# If we already have libsvm installed, make sure it is up to date
if [ -d "libsvm" ]; then
	cd ./libsvm
	git fetch origin
	git pull
	cd ..
fi

# If we don't have it, install it locally, here
if [ ! -d "libsvm" ]; then
	git clone https://github.com/cjlin1/libsvm.git --depth 1
fi

# Build executables
cd ./libsvm
make
cd ..

# Build MEX
cd ./libsvm/matlab
matlab -nosplash -nodesktop -nodisplay -r "make;exit;"
cd ../..

# Make a bin directory inside libsvm if it doesn't exist
cd ./libsvm
if [ ! -d "bin" ]; then
	mkdir bin
fi
cp svm-train   ./bin/
cp svm-predict ./bin/
cp svm-scale   ./bin/
cp ./matlab/libsvmread.mex*  ./bin/
cp ./matlab/libsvmwrite.mex* ./bin/
cp ./matlab/svmtrain.mex*    ./bin/
cp ./matlab/svmpredict.mex*  ./bin/
cd ..

# Additional Tools
# ROC-Curve tool
# wget http://www.csie.ntu.edu.tw/~cjlin/libsvmtools/roc/plotroc.m
mv plotroc.m ./libsvm/tools/plotroc.m

