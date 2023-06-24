class Devit < Formula
    desc "cpxy homebrew"
    homepage "https://github.com/simophin/cpxy"
    url "https://github.com/simophin/cpxy/archive/refs/tags/v1.6.3.tar.gz"
    sha256 "5e5916b60a973c549ae4244d1b06528b7ebf4505d22e77b971db6c788c212b0b"
  
    depends_on "rust" => :build # Newlines surrounding `depends_on` is required.
  
    def install
      system "cargo", "install", "--path", ".", "--root", prefix
    end
  end
  
