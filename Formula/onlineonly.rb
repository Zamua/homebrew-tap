class Onlineonly < Formula
  desc "Make Dropbox files online-only or available offline from the CLI or agents"
  homepage "https://github.com/Zamua/onlineonly"
  url "https://github.com/Zamua/onlineonly/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "ffa46c89846a6782a8592f052f4468d4cd4d9d0ec106a7662b032327d37835cb"
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
