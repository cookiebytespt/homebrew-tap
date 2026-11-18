cask "recorte" do
  version "0.4.0"
  sha256 "54c576cd3348ba1565f0f0b64c5f984651d570f4e3a54a8f9e6ebf47133693b1"

  url "https://github.com/cookiebytespt/Recorte/releases/download/#{version}/Recorte-#{version}.zip"
  name "Recorte"
  desc "Design and cut software for Liyu GF series vinyl cutters/plotters"
  homepage "https://github.com/cookiebytespt/Recorte"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Recorte.app"

  # The release build is ad-hoc signed but not notarized, so Gatekeeper would
  # refuse to open it. Drop the quarantine flag Homebrew adds on download.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Recorte.app"]
  end

  zap trash: [
    "~/Library/Application Support/pt.cookiebytes.recorte",
    "~/Library/Application Support/Recorte",
    "~/Library/Caches/pt.cookiebytes.recorte",
    "~/Library/HTTPStorages/pt.cookiebytes.recorte",
    "~/Library/Preferences/pt.cookiebytes.recorte.plist",
    "~/Library/Saved Application State/pt.cookiebytes.recorte.savedState",
  ]

  caveats <<~EOS
    Recorte is not notarized by Apple. If macOS still blocks it on first launch,
    right-click Recorte.app in /Applications and choose Open.
  EOS
end
