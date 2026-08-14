cask "sitesearch" do
  version "0.10.0"
  sha256 "5342087559f0fb7d1431949c02bfe927f89a85255ce2f70fcbf5675781ddeab7"

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
