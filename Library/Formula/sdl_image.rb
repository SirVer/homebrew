require 'formula'

class SdlImage < Formula
  url 'http://www.libsdl.org/projects/SDL_image/release/SDL_image-1.2.12.tar.gz'
  homepage 'http://www.libsdl.org/projects/SDL_image'
  md5 'a0f9098ebe5400f0bdc9b62e60797ecb'

  depends_on 'libtiff'
  depends_on 'sdl'
  depends_on 'jpeg'

  def options
    [['--universal', 'Build universal binaries.']]
  end

  def install
    ENV.universal_binary if ARGV.build_universal?
    ENV.x11 # For Freetype
    inreplace 'SDL_image.pc.in', '@prefix@', HOMEBREW_PREFIX

    system "./configure", "--prefix=#{prefix}",
                          "--disable-dependency-tracking",
                          "--disable-sdltest",
                          "--with-freetype-exec-prefix=/usr/X11",
                          "--disable-imageio" # Still broken
    system "make install"
  end
end
