require 'formula'

class SdlImage < Formula
  homepage 'http://www.libsdl.org/projects/SDL_image'
  url 'http://www.libsdl.org/projects/SDL_image/release/SDL_image-1.2.12.tar.gz'
  sha1 '5e3e393d4e366638048bbb10d6a269ea3f4e4cf2'
  md5 'a0f9098ebe5400f0bdc9b62e60797ecb'

  depends_on 'libtiff'
  depends_on 'sdl'
  depends_on 'jpeg'
  depends_on :x11 # for Freetype

  option :universal

  def install
    ENV.universal_binary if build.universal?
    inreplace 'SDL_image.pc.in', '@prefix@', HOMEBREW_PREFIX

    system "./configure", "--prefix=#{prefix}",
                          "--disable-dependency-tracking",
                          "--disable-sdltest",
                          "--disable-imageio" # Still broken
                          "--with-freetype-exec-prefix=#{MacOS.x11_prefix}"
    system "make install"
  end
end
