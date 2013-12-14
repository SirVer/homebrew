require 'formula'

class Libpng < Formula
  homepage 'http://www.libpng.org/pub/png/libpng.html'
  url 'http://downloads.sf.net/project/libpng/libpng15/1.5.17/libpng-1.5.17.tar.bz2'
  sha1 '899d660104f3ef5c349c57faad10844b388f8442'

  bottle do
    cellar :any
    revision 1
    sha1 '039e4a626f4cbcbfa14349f86f33663ebc9d20d8' => :mavericks
    sha1 '6f9f7ad1ea035e897845dc3f4d3909a92664dbb8' => :mountain_lion
    sha1 '53e282b87f737dc16ddb0700585b5754cec6b913' => :lion
  end

  keg_only :provided_pre_mountain_lion

  option :universal

<<<<<<< HEAD
  bottle do
    # sha1 '5e7feb640d654df0c2ac072d86e46ce9df9eaeee' => :mountain_lion
    # sha1 'bbd94d671653943cf21314911978d90f5fb536df' => :lion
    # sha1 'fb685cfb8b37b883bf004ee7c9ca785d3435b155' => :snow_leopard
  end

=======
>>>>>>> master
  def install
    ENV.universal_binary if build.universal?
    system "./configure", "--disable-dependency-tracking",
			  "--enable-static",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
