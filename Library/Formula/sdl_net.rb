require 'formula'

class SdlNet < Formula
  homepage 'http://www.libsdl.org/projects/SDL_net/'
  url 'http://www.libsdl.org/projects/SDL_net/release/SDL_net-1.2.8.tar.gz'
  sha1 'fd393059fef8d9925dc20662baa3b25e02b8405d'
  head 'http://hg.libsdl.org/SDL_net', :using => :hg

  option :universal

  depends_on 'pkg-config' => :build
  depends_on 'sdl'

  def patches
     DATA
  end

  def install
    ENV.universal_binary if build.universal?
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--disable-sdltest"
    system "make install"
  end
end

__END__
diff --git a/SDLnetsys.h b/SDLnetsys.h
index b5cd95b..97f1d30 100644
--- a/SDLnetsys.h
+++ b/SDLnetsys.h
@@ -56,9 +56,7 @@ typedef int socklen_t;
 #ifndef __BEOS__
 #include <arpa/inet.h>
 #endif
-#ifdef linux /* FIXME: what other platforms have this? */
 #include <netinet/tcp.h>
-#endif
 #include <sys/socket.h>
 #include <net/if.h>
 #include <netdb.h>
