set -ex

PREFIX=${PREFIX:-"/usr/local"}

for url in https://ftp.gnu.org/gnu/binutils/binutils-2.43.tar.gz https://mirrors.kernel.org/gnu/binutils/binutils-2.43.tar.gz ; do
    wget --timeout=60 --continue $url && break
done
tar xvfz binutils-2.43.tar.gz
cd binutils-2.43
./configure --target=mipsel-none-elf --disable-multilib --disable-nls --disable-werror --prefix=$PREFIX
make
make install-strip
cd ..