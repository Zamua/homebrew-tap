class Onlineonly < Formula
  desc "Make Dropbox files online-only or available offline from the CLI or agents"
  homepage "https://github.com/Zamua/onlineonly"
  url "https://github.com/Zamua/onlineonly/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "7a51e16b4b234d13cf7461f4d7e36bfd6e7e18804c1c0d5919a2d2a98f4f2290"
  license "MIT"

  # Drives the macOS Dropbox desktop app over a local Mach port.
  depends_on :macos

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/onlineonly --version")
    # The MCP handshake needs no Dropbox, so it exercises the server end to end.
    request = '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"2025-06-18"}}'
    assert_match '"name":"onlineonly"', pipe_output("#{bin}/onlineonly mcp", "#{request}\n")
  end
end
