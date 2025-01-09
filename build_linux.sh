python3 -m pip install tomli
python3 -m pip install pyparsing

export LDFLAGS="-static-libgcc -static-libstdc++ -Wl,--exclude-libs=ALL"
export GMP_ROOT=/libgmp_static/dist
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

./configure.sh production --auto-download --ipo --no-static --no-cln --no-glpk --no-editline --java-bindings \
    --prefix=/mnt/linux-dist --name=linux-build \
    -DJAVA_AWT_LIBRARY="$JAVA_HOME/jre/lib/amd64/libjawt.so" \
    -DJAVA_JVM_LIBRARY="$JAVA_HOME/jre/lib/amd64/server/libjvm.so" \
    -DGMP_INCLUDE_DIR="$GMP_ROOT/include/" \
    -DGMPXX_INCLUDE_DIR="$GMP_ROOT/include/" \
    -DGMP_LIBRARIES="$GMP_ROOT/lib/libgmp.a" \
    -DGMPXX_LIBRARIES="$GMP_ROOT/lib/libgmpxx.a"

cd /mnt/linux-build
make -j10
make install
cd /mnt
