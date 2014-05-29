require 'formula'

class I386ElfGdb < Formula
  homepage 'http://gcc.gnu.org'
  url 'http://ftp.gnu.org/gnu/gdb/gdb-7.7.tar.bz2'
  url 'http://ftpmirror.gnu.org/gnu/gdb/gdb-7.7.tar.bz2'
  sha1 '5cdc83ada4fe2a37d775c36272187f08b95bebe6'

  depends_on 'i386-elf-binutils'
  depends_on 'i386-elf-gcc'

  def install
    mkdir 'build' do
      system '../configure', '--target=i386-elf', "--prefix=#{prefix}", '--disable-werror'
      system 'make'
      system 'make install'
      FileUtils.rm_rf share/"locale"
      FileUtils.mv lib, libexec
    end
  end
end
