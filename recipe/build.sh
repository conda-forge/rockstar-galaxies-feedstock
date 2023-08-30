set -euo pipefail
set -x

mkdir -p build

cd build

cmake ${CMAKE_ARGS} -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${PREFIX} ../
make -j${CPU_COUNT}
make install

# Copy header files
mkdir -p ${PREFIX}/include/rockstar-galaxies/io
install -m 444 ../*.h ${PREFIX}/include/rockstar-galaxies
install -m 444 ../io/*.h ${PREFIX}/include/rockstar-galaxies/io