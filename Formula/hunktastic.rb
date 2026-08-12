class Hunktastic < Formula
  desc "Terminal diff viewer for agent changesets, with difftastic structural diffs"
  homepage "https://github.com/Zamua/hunktastic"
  license "MIT"
  version "0.18.0"

  on_macos do
    on_arm do
      url "https://github.com/Zamua/hunktastic/releases/download/v0.18.0-ht.1/hunktastic-aarch64-apple-darwin.tar.gz"
      sha256 "c4782002ed3abd6ec28e21f57872527e788289c14568fa024646a714a02afd4a"
    end
  end

  # The structural engine runs difft as a subprocess. Without it, hunktastic
  # still works but falls back to line diffs with a notice.
  depends_on "difftastic"
  depends_on arch: :arm64
  depends_on :macos

  conflicts_with "hunk", because: "both install a hunk binary"

  def install
    bin.install "hunk"
    # `hunk skill path` finds the agent skill by walking up from the binary,
    # so this has to sit beside bin/ rather than in share/.
    prefix.install "skills"
    bin.install_symlink bin/"hunk" => "hunktastic"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hunk --version")
    assert_match "SKILL.md", shell_output("#{bin}/hunk skill path")

    system "git", "init"
    (testpath/"a.js").write "function f(a) {\n  return a;\n}\n"
    system "git", "add", "a.js"
    system "git", "-c", "user.email=t@t", "-c", "user.name=t", "commit", "-m", "init"
    (testpath/"a.js").write "function f(a) {\n  if (flag) {\n    return a * 2;\n  }\n}\n"
    # Non-interactive engine check: difft must produce a structural result for
    # the pair, which is what the viewer consumes.
    assert_match "flag", shell_output("#{Formula["difftastic"].opt_bin}/difft --display inline a.js a.js")
  end
end
