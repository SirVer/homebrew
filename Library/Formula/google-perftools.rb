require 'formula'

class GooglePerftools < Formula
  url 'http://gperftools.googlecode.com/files/gperftools-2.0.tar.gz'
  sha1 'da7181a7ba9b5ee7302daf6c16e886c179fe8d1b'
  homepage 'http://code.google.com/p/google-perftools/'

  fails_with :llvm do
    build 2326
    cause "Segfault during linking"
  end

  def install
    ENV.append_to_cflags '-D_XOPEN_SOURCE'
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make"
    system "make install"
  end
end
