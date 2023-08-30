set -euo pipefail
set -x

mkdir -p build

cd build

cmake ${CMAKE_ARGS} -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${PREFIX} ../
make -j${CPU_COUNT}
make install

# Copy header files
mkdir -p ${PREFIX}/include/rockstar-galaxies/io
install ../*.h ${PREFIX}/include/rockstar-galaxies
install ../io/*.h ${PREFIX}/include/rockstar-galaxies/io