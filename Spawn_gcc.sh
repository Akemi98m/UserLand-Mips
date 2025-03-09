for url in https://ftp.gnu.org/gnu/gcc/gcc-14.2.0/gcc-14.2.0.tar.gz https://mirrors.kernel.org/gnu/gcc/gcc-14.2.0/gcc-14.2.0.tar.gz ; do
    wget --timeout=60 --continue --no-check-certificate $url && break
done
tar xvfz gcc-14.2.0.tar.gz
cd gcc-14.2.0
./contrib/download_prerequisites
mkdir build
cd build
../configure --target=mipsel-none-elf --without-isl --disable-nls --disable-threads --disable-shared --disable-libssp --disable-libstdcxx-pch --disable-libgomp --disable-werror --without-headers --disable-hosted-libstdcxx --with-as=$PREFIX/bin/mipsel-none-elf-as --with-ld=$PREFIX/bin/mipsel-none-elf-ld --enable-languages=c,c++ --prefix=$PREFIX
make all-gcc
make install-strip-gcc
make all-target-libgcc
make install-strip-target-libgcc
make all-target-libstdc++-v3
make install-strip-target-libstdc++-v3
