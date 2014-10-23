require 'formula'

class Sh3ebElfGdb < Formula
  homepage 'http://gcc.gnu.org'
  url 'ftp://ftp.gnu.org/gnu/gdb/gdb-7.8.tar.gz'
  url 'http://ftpmirror.gnu.org/gdb/gdb-7.8.tar.gz'
  sha1 '4810d78a77064fefc05e701fc0a2193562a23afe'

  depends_on 'sh3eb-elf-binutils'
  depends_on 'sh3eb-elf-gcc'

  def install
    mkdir 'build' do
      system '../configure', '--target=sh3eb-elf', "--prefix=#{prefix}", '--disable-werror'
      system 'make'
      system 'make install'
      FileUtils.rm_rf share/"locale"
    end
  end
end
