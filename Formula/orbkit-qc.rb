class OrbkitQC < Formula
    desc "A Toolbox for Post-Processing Quantum Chemical Wavefunction Data"
    homepage "http://orbkit.github.io"
    url "https://github.com/orbkit/orbkit/archive/v1.0.zip"
    version "1.0"
    sha256 "85a12305ec4f523dbedcce973f3c004491303cb68fd76f3bf3bafc506df3142e"

    depends_on :
    depends_on :

    def install
        system "python3 setup.py build_ext --inplace clean"
    end

    :path_environment_variable do |path|
    def caveats; <<~EOS
        To use #{@cask}, you may need to add the #{path} directory
        to your PATH environment variable, e.g. (for bash shell):
            export ORBKITPATH=#{path}
            export PYTHONPATH=$PYHONPATH:$ORBKITPATH
            export PATH=$PATH:$ORBKITPATH/tools
        EOS
    end

