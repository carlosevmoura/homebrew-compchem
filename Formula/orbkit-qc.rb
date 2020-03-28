class OrbkitQc < Formula
    desc "A Toolbox for Post-Processing Quantum Chemical Wavefunction Data"
    homepage "http://orbkit.github.io"
    url "https://github.com/orbkit/orbkit/archive/v1.0.zip"
    version "1.0"
    sha256 "85a12305ec4f523dbedcce973f3c004491303cb68fd76f3bf3bafc506df3142e"

    depends_on "python3"
    depends_on "wget"

    def install
        system "pip3", "install", "cython", "numpy", "scipy", "h5py", "mayavi"
        system "wget", "--no-check-certificate", "--content-disposition", "https://raw.githubusercontent.com/carlosevmoura/homebrew-compchem/develop/extra_files/orbkit-qc-setup.py"
        system "python3", "orbkit-qc-setup.py", "build_ext", "--inplace", "clean"
        bin.install "tools/orbkit" => "orbkit"
    end

    def caveats
        <<~EOS
        To use Orbkit, you may need to add the directory
        to your PATH environment variable, e.g. (for bash shell):
            export ORBKITPATH="/usr/local/Cellar/orbkit-qc/1.0/bin/orbkit"
            export PYTHONPATH=$PYTHONPATH:$ORBKITPATH
            export PATH=$PATH:$ORBKITPATH/tools
        EOS
    end
end