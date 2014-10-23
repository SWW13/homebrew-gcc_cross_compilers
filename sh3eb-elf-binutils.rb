require 'formula'

class Sh3ebElfBinutils < Formula
  homepage 'http://gcc.gnu.org'
  url 'http://ftp.gnu.org/gnu/binutils/binutils-2.24.tar.gz'
  mirror 'http://ftpmirror.gnu.org/gnu/binutils/binutils-2.24.tar.gz'
  sha1 '1b2bc33003f4997d38fadaa276c1f0321329ec56'

  depends_on 'gcc49' => :build

  def install
    ENV['CC'] = '/usr/local/bin/gcc-4.9'
    ENV['CXX'] = '/usr/local/bin/g++-4.9'
    ENV['CPP'] = '/usr/local/bin/cpp-4.9'
    ENV['LD'] = '/usr/local/bin/gcc-4.9'

    mkdir 'build' do
      system '../configure', '--target=sh3eb-elf',
                             '--disable-nls', '--disable-werror',
                             '--enable-interwork', '--enable-multilib',
                             "--prefix=#{prefix}"
      system 'make', 'all'
      system 'make', 'install'
    end
  end

end
