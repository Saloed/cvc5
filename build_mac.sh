export MACOSX_DEPLOYMENT_TARGET=11.1

# Install JDK
# Before install edit /usr/local/osxcross/bin/omp and disable verifyFileIntegrity function
#omp install -v openjdk11
#apt-get install openjdk-8-jdk python3-pip python3-venv

python3 -m pip install tomli
python3 -m pip install pyparsing

export CC=oa64-clang
export CXX=oa64-clang++

export SYS_ROOT="/usr/local/osxcross/SDK/MacOSX11.1.sdk"

export GMP_ROOT=/libgmp_static/dist
export JAVA_HOME="/usr/local/osxcross/macports/pkgs/opt/local/Library/Java/JavaVirtualMachines/openjdk11/Contents/Home"
export JAVA_EXEC_HOME="/usr/lib/jvm/java-8-openjdk-amd64"

export CPPFLAGS="-I$GMP_ROOT/include"
export LIBS="$GMP_ROOT/lib/libgmp.a"
export LDFLAGS="-L$GMP_ROOT/lib"

./configure.sh production --auto-download --ipo --no-static --no-cln --no-glpk --no-editline --java-bindings \
    --arm64 --prefix=/mnt/mac-dist --name=mac-build \
    -DCMAKE_SYSTEM_NAME="Darwin" \
    -DCMAKE_OSX_SYSROOT="$SYS_ROOT" \
    -DCMAKE_OSX_ARCHITECTURES="arm64" \
    -DJava_JAVA_EXECUTABLE="$JAVA_EXEC_HOME/bin/java" \
    -DJava_JAVAC_EXECUTABLE="$JAVA_EXEC_HOME/bin/javac" \
    -DJava_JAR_EXECUTABLE="$JAVA_EXEC_HOME/bin/jar" \
    -DJAVA_AWT_LIBRARY="$JAVA_HOME/lib/libawt.dylib" \
    -DJAVA_JVM_LIBRARY="$JAVA_HOME/lib/server/libjvm.dylib" \
    -DGMP_INCLUDE_DIR="$GMP_ROOT/include/" \
    -DGMPXX_INCLUDE_DIR="$GMP_ROOT/include/" \
    -DGMP_LIBRARIES="$GMP_ROOT/lib/libgmp.a" \
    -DGMPXX_LIBRARIES="$GMP_ROOT/lib/libgmpxx.a"

cd /mnt/mac-build
make -j10
make install

cd /mnt/mac-dist/lib

llvm-install-name-tool-14 -id libcvc5.1.dylib ./libcvc5.1.dylib

llvm-install-name-tool-14 -id libcvc5parser.1.dylib ./libcvc5parser.1.dylib
llvm-install-name-tool-14 -change @rpath/libcvc5.1.dylib libcvc5.1.dylib ./libcvc5parser.1.dylib

llvm-install-name-tool-14 -id libcvc5jni.dylib ./libcvc5jni.dylib
llvm-install-name-tool-14 -change @rpath/libcvc5.1.dylib libcvc5.1.dylib ./libcvc5jni.dylib
llvm-install-name-tool-14 -change @rpath/libcvc5parser.1.dylib libcvc5parser.1.dylib ./libcvc5jni.dylib

mkdir -p dist
cp libcvc5.1.dylib libcvc5parser.1.dylib libcvc5jni.dylib dist/
