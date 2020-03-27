class MoldenGraph < Formula
  desc "Pre- and post-processing of molecular and electronic structure"
  homepage "http://www.cmbi.ru.nl/molden/"
  url "ftp://ftp.cmbi.ru.nl/pub/molgraph/molden/molden6.2.tar.gz"

  revision 1
  # tag "chemistry"
  # doi "10.1023/A:1008193805436"

  depends_on :x11
  depends_on "gcc" if OS.mac? # for gfortran

  def install
    system "make"
    bin.install "molden", "gmolden"
  end

  def caveats; <<~EOS
    Two versions of Molden were installed:
      - gmolden is the full OpenGL version
      - molden is the Xwindows version
    EOS
  end

  test do
    # molden is an interactive program, there is not much we can test here
    assert_match "Molden#{version}", shell_output("#{bin}/gmolden -h")
  end
end