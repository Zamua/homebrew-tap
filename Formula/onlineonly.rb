class Onlineonly < Formula
  desc "Make Dropbox files online-only or available offline from the CLI or agents"
  homepage "https://github.com/Zamua/onlineonly"
  url "https://github.com/Zamua/onlineonly/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "e3a8406185dc5ffb09605b17787d6d44c6b10268c6fd9ca0dab916fdea9bbf8d"
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
