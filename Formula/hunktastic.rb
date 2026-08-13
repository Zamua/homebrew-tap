class Hunktastic < Formula
  desc "Terminal diff viewer for agent changesets, with difftastic structural diffs"
  homepage "https://github.com/Zamua/hunktastic"
  license "MIT"
  version "0.18.0"

  on_macos do
    on_arm do
      url "https://github.com/Zamua/hunktastic/releases/download/v0.18.0-ht.4/hunktastic-aarch64-apple-darwin.tar.gz"
      sha256 "c955322e04e33a1d8ff7d9ea707d4bae8d0d7f71c0957c2ef4bfa12873177f64"
    end
  end

  # The structural engine runs difft as a subprocess. Without it, hunktastic
  # still works but falls back to line diffs with a notice.
  depends_on "difftastic"
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "hunkt"
    # `hunkt skill path` finds the agent skill by walking up from the binary,
    # so this has to sit beside bin/ rather than in share/.
    prefix.install "skills"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hunkt --version")
    assert_match "SKILL.md", shell_output("#{bin}/hunkt skill path")

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
