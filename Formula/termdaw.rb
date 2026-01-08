class Termdaw < Formula
  desc "Terminal-based Digital Audio Workstation with vim-style navigation"
  homepage "https://github.com/Zamua/termdaw"
  license "MIT"
  version "0.0.1-test"

  on_macos do
    url "https://github.com/Zamua/termdaw/releases/download/v0.0.1-test/termdaw-universal-apple-darwin.tar.gz"
    sha256 "91a4187859d8e8695677d59bc60fa5d315c6c6701f9f741b06475fae1d313e9e"
  end

  on_linux do
    url "https://github.com/Zamua/termdaw/releases/download/v0.0.1-test/termdaw-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "dfc1b2f5fcb18cd8dec06a1cec5a3d4138eb6db73067f306855497259a1f0ae2"
  end

  def install
    bin.install "termdaw"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/termdaw --version 2>&1", 1)
  end
end
