class Devit < Formula
    desc "devit composing homebrew"
    homepage "https://github.com/simophin/devit"
    url "https://github.com/simophin/devit/archive/refs/tags/v1.0.0.tar.gz"
    sha256 "7108c55b10bef6aae3a77514d464be01902cba56f9aa8d2d9fe3e67d4aea1107"
  
    depends_on "rust" => :build # Newlines surrounding `depends_on` is required.
  
    def install
      system "cargo", "install", "--path", ".", "--root", prefix
    end
  end
  