require 'formula'

class Libggz <Formula
  url 'http://ftp.belnet.be/packages/ggzgamingzone/ggz/0.0.14.1/libggz-0.0.14.1.tar.gz'
  homepage 'http://www.ggzgamingzone.org/'
  md5 '603739504648833779aa13b0327a1c3d'

  depends_on 'libgcrypt'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end
end
