require 'formula'

class Sqoop < Formula
  homepage 'http://sqoop.apache.org/'
  url 'http://apache.mirror.iphh.net/sqoop/1.4.4/sqoop-1.4.4.bin__hadoop-1.0.0.tar.gz'
  version '1.4.4'
  sha1 '1af2fa62b194794f50d3b2c5b064d3220bc1fc0d'

  depends_on 'hadoop'
  depends_on 'hbase'
  depends_on 'hive'
  depends_on 'zookeeper'

  def spoop_envs
    <<-EOS.undent
      export HADOOP_HOME="#{HOMEBREW_PREFIX}"
      export HBASE_HOME="#{HOMEBREW_PREFIX}"
      export HIVE_HOME="#{HOMEBREW_PREFIX}"
      export ZOOCFGDIR="#{etc}/zookeeper"
    EOS
  end

  def install
    libexec.install %w[bin conf lib]
    libexec.install Dir['*.jar']
    bin.write_exec_script Dir["#{libexec}/bin/*"]

    # Install a sqoop-env.sh file
    envs = libexec/'conf/sqoop-env.sh'
    envs.write(spoop_envs) unless envs.exist?
  end

  def caveats; <<-EOS.undent
    Hadoop, Hive, HBase and ZooKeeper must be installed and configured
    for Sqoop to work.
    EOS
  end
end
