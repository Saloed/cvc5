
# Use MSYS2 MINGW64, Python must be installed on the host windows system
export PATH="$PATH:/c/Python312/:/c/Python312/Scripts/"

# JDK must be installed on the host windows system
export JAVA_HOME="/c/jdk-1.8"

pacman -S \
  make \
  git \
  mingw-w64-x86_64-ccache \
  mingw-w64-x86_64-cmake \
  mingw-w64-x86_64-gcc \
  mingw-w64-x86_64-gmp

python -m pip install -r contrib/requirements_build.txt

export LDFLAGS="-static-libgcc -static-libstdc++ -Wl,-Bstatic,--whole-archive -lstdc++ -lwinpthread -Wl,-Bdynamic,--no-whole-archive -Wl,--allow-multiple-definition"

./configure.sh production --auto-download --ipo --no-static --no-cln --no-glpk --no-editline \
 --win64-native --java-bindings --prefix=$(pwd)/win-dist --name=win-build \
 -DJAVA_AWT_LIBRARY="$JAVA_HOME/lib/jawt.lib" \
 -DJAVA_JVM_LIBRARY="$JAVA_HOME/lib/jvm.lib" \
 -DCMAKE_CXX_COMPILER_LAUNCHER=ccache \
 -DCMAKE_C_COMPILER_LAUNCHER=ccache

cd win-build/ && pwd=$(pwd)
ccache --set-config="base_dir=$pwd"
make -j4
make install

# make install usually fails on this one
cp src/api/java/libcvc5jni.dll ../win-dist/lib/
