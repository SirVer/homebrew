require 'formula'

class ScalaDocs < Formula
  homepage 'http://www.scala-lang.org/'
  url 'http://www.scala-lang.org/downloads/distrib/files/scala-2.9.1.final-devel-docs.tgz'
  version '2.9.1'
  md5 '88668b400ec61c8b043e288ddc62b8b8'
end

class Scala < Formula
  homepage 'http://www.scala-lang.org/'
  url 'http://www.scala-lang.org/downloads/distrib/files/scala-2.9.1.final.tgz'
  version '2.9.1'
  md5 '1a06eacc7f59f279bf1700c98d5bf19d'

  def options
    [['--with-docs', 'Also install library documentation']]
  end

  def install
    rm_f Dir["bin/*.bat"]
    doc.install Dir['doc/*']
    man1.install Dir['man/man1/*']
    libexec.install Dir['*']
    bin.mkpath
    Dir["#{libexec}/bin/*"].each { |f| ln_s f, bin }

    if ARGV.include? '--with-docs'
      ScalaDocs.new.brew { doc.install Dir['*'] }
    end
  end
end
