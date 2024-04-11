
# Use MSYS2 MINGW64, Python must be installed on host windows system
export PATH=$PATH:/c/Python312:/c/Python312/Scripts

pacman -S \
  make \
  mingw-w64-x86_64-ccache \
  mingw-w64-x86_64-cmake \
  mingw-w64-x86_64-gcc \
  mingw-w64-x86_64-gmp

python3 -m pip install -r contrib/requirements_build.txt

./configure.sh production --auto-download --ipo --no-static --no-cln --no-glpk --no-editline --no-poly --win64-native --prefix=$(pwd)/win-dist -DCMAKE_CXX_COMPILER_LAUNCHER=ccache -DCMAKE_C_COMPILER_LAUNCHER=ccache --name=build-shared

cd build-shared/ && pwd=$(pwd)
ccache --set-config="base_dir=$pwd"
make -j4
