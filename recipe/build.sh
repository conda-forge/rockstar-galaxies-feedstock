set -euo pipefail
set -x

mkdir -p build

cd build

cmake ${CMAKE_ARGS} -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${PREFIX} ../
make -j${CPU_COUNT}
make install

# Copy header files
mkdir -p ${PREFIX}/include/rockstar-galaxies/io
install -m 644 ../*.h ${PREFIX}/include/rockstar-galaxies
install -m 644 ../io/*.h ${PREFIX}/include/rockstar-galaxies/io