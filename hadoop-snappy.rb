require 'formula'

class HadoopSnappy < Formula
  homepage 'https://github.com/xerial/snappy-java'

  url 'https://github.com/xerial/snappy-java/archive/1.1.1.3.tar.gz'
  sha256 '1e7071f5fbfc96fd063f94fcf25a6faf389ad6e1b0f3f40d3fdcc50f5402d76a'

  depends_on "sbt"

  def install
    ENV.fetch('JAVA_HOME') do
      odie "JAVA_HOME is not set. Enure you've installed JDK 1.7 and then add export JAVA_HOME=`/usr/libexec/java_home` to your .bashrc"
    end

    system "make", "native", "LIBNAME=libsnappyjava.dylib"
    system "./sbt", "package"
    
    libexec.install Dir['target/*']
  end

  # def native_lib
  #   `find #{libexec} -iname 'lib' -type d -print -quit`
  # end

  def caveats; <<-EOS.undent
    Make sure you add the following lines to your .bashrc:

    export HADOOP_CLASSPATH=#{opt_prefix}/libexec/snappy-java-1.1.1.3.jar:$HADOOP_CLASSPATH

    EOS
  end


end
