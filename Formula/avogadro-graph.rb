class AvogadroGraph < Formula
    version '1.2.0'
    sha256 '8a9567a2f3ebf162eab8e375073ea84cd28483f004c7cd3cae33e21864615cc7'

  # sourceforge.net/avogadro was verified as official when first introduced to the cask
    url "https://downloads.sourceforge.net/avogadro/Avogadro-1.2.0.dmg"
    name 'Avogadro'
    homepage 'https://avogadro.cc/wiki/Main_Page'

    def install
        system "mv", "-fr", 'Avogadro.app', "/Applications/"
    end

end