require 'formula'

class I486ElfBinutils < Formula
  homepage 'http://gcc.gnu.org'
  url 'http://ftp.gnu.org/gnu/binutils/binutils-2.20.1.tar.bz2'

  depends_on 'apple-gcc42' => :build

  def install
    ENV['CC'] = '/usr/local/bin/gcc-4.2'
    ENV['CXX'] = '/usr/local/bin/g++-4.2'
    ENV['CPP'] = '/usr/local/bin/cpp-4.2'
    ENV['LD'] = '/usr/local/bin/gcc-4.2'

    mkdir 'build' do
      system '../configure', '--disable-nls', '--target=i486-elf',
                             '--disable-werror', 
                             '--enable-gold=yes',
                             "--prefix=#{prefix}"
      system 'make all'
      system 'make install'
      FileUtils.mv lib, libexec
    end
  end

end
