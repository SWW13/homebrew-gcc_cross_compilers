require 'formula'

class I386ElfGdb < Formula
  homepage 'http://gcc.gnu.org'
  url 'http://ftp.gnu.org/gnu/gdb/gdb-7.8.tar.gz'
  url 'http://ftpmirror.gnu.org/gnu/gdb/gdb-7.8.tar.gz'
  sha1 '38d816d641093db2e13ba284e26090b4'

  depends_on 'i386-elf-binutils'
  depends_on 'i386-elf-gcc'

  def install
    mkdir 'build' do
      system '../configure', '--target=i386-elf', "--prefix=#{prefix}", '--disable-werror'
      system 'make'
      system 'make install'
      FileUtils.rm_rf share/"locale"
    end
  end
end
