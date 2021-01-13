class MoldenGraph < Formula
  desc "Pre- and post-processing of molecular and electronic structure"
  homepage "http://www.cmbi.umcn.nl/molden/"
  url "ftp://ftp.cmbi.umcn.nl/pub/molgraph/molden/molden6.2.tar.gz"
  version "6.2"
  sha256 "b6e074dfae52b0b8ade2c44e93f9646dd3bfc2d5a064b5cf892efc5bf6b9a506"

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