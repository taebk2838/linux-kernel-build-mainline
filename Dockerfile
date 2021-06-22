FROM centos:7

# Install.
RUN \
  yum -y install sudo
  sudo yum -y install bzip2
  sudo yum -y install libmpc-devel mpfr-devel gmp-devel
  curl ftp://ftp.mirrorservice.org/sites/sourceware.org/pub/gcc/releases/gcc-4.9.2/gcc-4.9.2.tar.bz2 -O
  ls
  tar xvfj gcc-4.9.2.tar.bz2
  cd gcc-4.9.2
  ./configure --disable-multilib --enable-languages=c,c++
  make -j 4
  make install
  yum -y install git epel-release "@Development Tools"
  yum -y install createrepo mock redhat-rpm-config rpmdevtools
  yum -y install openssl openssl-devel bc
  mkdir public
  git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git --depth 1
  cp config linux/.config
  cd linux
  make olddefconfig
  make rpm
  cd ..
  mv /root/rpmbuild/RPMS/x86_64/* ./public
  mv /root/rpmbuild/SRPMS/* ./public
  createrepo --database ./public
  mv ./kernel-mainline.repo ./public
  ls ./public/ | ./genindex.sh > ./index.html
  mv ./index.html ./public
  rm -rf /var/lib/apt/lists/*

# Add files.
ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/.scripts /root/.scripts

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
