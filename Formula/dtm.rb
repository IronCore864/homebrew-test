class Devstream < Formula
    desc "DevStream: the open-source DevOps toolchain manager (DTM)."
    homepage "https://dtm.dev"
    url "https://github.com/merico-dev/stream/archive/refs/tags/v0.3.0.tar.gz"
    sha256 "3223ff4ea46626d6849831ad9abfa6f67699731fd927fe477ab945b3ab9424eb"
    license "Apache-2.0"
  
    depends_on "cmake" => :build
  
    def install
      ENV["GOPATH"] = buildpath
      bin_path = buildpath/"src/github.com/kevinburke/hostsfile"
      bin_path.install Dir["*"]
      cd bin_path do
        system "make", "build-core"
      end
    end
  
    test do
      system "false"
    end
  end

    test do
      assert_match "0.3.0", shell_output("#{bin}/dtm version 2>&1", 2)
    end
  end
