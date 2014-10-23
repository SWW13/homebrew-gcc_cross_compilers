require 'formula'

class Sh3ebElfGcc < Formula
  homepage 'http://gcc.gnu.org'
  url 'http://ftpmirror.gnu.org/gcc/gcc-4.9.1/gcc-4.9.1.tar.bz2'
  mirror 'http://ftp.gnu.org/gnu/gcc/gcc-4.9.1/gcc-4.9.1.tar.bz2'
  sha1 '3f303f403053f0ce79530dae832811ecef91197e'

  depends_on 'gmp' => :build
  depends_on 'libmpc' => :build
  depends_on 'mpfr' => :build
  depends_on 'gcc49' => :build
  depends_on 'sh3eb-elf-binutils'

  def install
    binutils = Formula.factory 'sh3eb-elf-binutils'

    ENV['CC'] = '/usr/local/bin/gcc-4.9'
    ENV['CXX'] = '/usr/local/bin/g++-4.9'
    ENV['CPP'] = '/usr/local/bin/cpp-4.9'
    ENV['LD'] = '/usr/local/bin/gcc-4.9'
    ENV['PATH'] += ":#{binutils.prefix/"bin"}"

    mkdir 'build' do
      system '../configure', '--target=sh3eb-elf',
                             '--disable-nls', '--disable-werror',
                             '--enable-interwork', '--enable-multilib',
                             '--with-gmp=/usr/local',
                             '--with-mpc=/usr/local',
                             '--with-mpfr=/usr/local',
                             "--enable-languages=c,c++",
                             "--without-headers",
                             "--prefix=#{prefix}"
      
      system 'make', 'all-gcc'
      system 'make', 'install-gcc'
      FileUtils.ln_sf binutils.prefix/"sh3eb-elf", prefix/"sh3eb-elf"
      system 'make', 'all-target-libgcc'
      system 'make', 'install-target-libgcc'
      FileUtils.rm_rf share/"man"/"man7"
    end
  end
end
