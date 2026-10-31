cask "sitesearch" do
  version "0.11.2"
  sha256 "2a18a7774b57a5568931967b11d3f553a4b08657c39565fe3115ba9ac17de452"

  url "https://github.com/Zamua/sitesearch/releases/download/v#{version}/SiteSearch-#{version}.zip"
  name "SiteSearch"
  desc "Custom website search for Spotlight"
  homepage "https://github.com/Zamua/sitesearch"

  # Running App Intents actions from Spotlight is macOS 26 only; on anything
  # older the app installs but its action never appears. The bare symbol means
  # "this version or newer" - the ">= :tahoe" string form is deprecated.
  depends_on macos: :tahoe

  app "SiteSearch.app"

  # Sites, and the favicons cached beside them. Not the Spotlight quick-key
  # entry: that lives in Apple's own com.apple.Spotlight domain, which an
  # uninstall has no business rewriting.
  zap trash: [
    "~/Library/Application Support/SiteSearch",
    "~/Library/Caches/com.zamua.SiteSearch",
    "~/Library/Preferences/com.zamua.SiteSearch.plist",
  ]
end
