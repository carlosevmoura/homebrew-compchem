class JmolGraph < Formula
    desc "Viewer for chemical structures in 3D"
    homepage "http://www.jmol.org"
    url "https://downloads.sourceforge.net/jmol/Jmol/Version%2014.30/Version%2014.30.2/Jmol-14.30.2-binary.zip"
    version "14.30.2"
    sha256 "596df817967234ae3a5870b9ef604d01741af11c291522bde9deaf4e0127a508"

    head do
      url "https://jmol.svn.sourceforge.net/svnroot/jmol/trunk/Jmol"
      depends_on "ant" => :build
    end

    depends_on :java

    def install
      system "ant" if build.head?
      (bin/"jmol").write <<~EOS
        #!/bin/sh
        JMOL_HOME=#{prefix} exec #{prefix}/jmol.sh "$*"
      EOS
      chmod 0755, "jmol.sh"
      prefix.install "jmol.sh", Dir["*.jar"]
      prefix.install Dir["build/*.jar"] if build.head?
    end

    test do
      # unfortunately, the application can not be run headless
      # (throws java.awt.HeadlessException), but this should work otherwise
      system "jmol", "-n"
    end
  end