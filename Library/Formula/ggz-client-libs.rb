require 'formula'

class GgzClientLibs <Formula
  url 'http://ftp.belnet.be/packages/ggzgamingzone/ggz/0.0.14.1/ggz-client-libs-0.0.14.1.tar.gz'
  homepage 'http://www.ggzgamingzone.org/'
  md5 '299eaa93721b1d867b5bf7dc6ac764b0'

  depends_on 'libggz'
  depends_on 'expat'
  depends_on 'gettext'

  def patches
    # configure is to stupid to look for .dylib. Not reported upstream, because
    # they have no freaking bug tracker!
    DATA
  end

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end
end
__END__
--- a/configure	2011-02-14 21:37:22.000000000 +0100
+++ b/configure	2011-02-14 21:37:10.000000000 +0100
@@ -20513,7 +20513,7 @@ libggz_libdirs=$ret
 
 libggz_libdir=NO
 for dir in $libggz_libdirs; do
+  try="ls -1 $dir/libggz.la $dir/libggz.dylib $dir/libggz.so"
-  try="ls -1 $dir/libggz.la $dir/libggz.so"
   if test -n "`$try 2> /dev/null`"; then libggz_libdir=$dir; break; else echo "tried $dir" >&5 ; fi
 done
