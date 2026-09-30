# Ferry's Homebrew cask, for the simophin/homebrew-tap tap:
#
#   brew install simophin/tap/ferry
#
# The Build workflow fills in the @...@ fields (packaging/macos/cask.sh) and
# pushes the result to the tap as Casks/ferry.rb with each release.
cask "ferry" do
  version "1.12.0"
  sha256 "5a5a6e62b3ea1b2ccf8fdb4667071a3f7f700c0950295941fffc16420dafd7be"

  url "https://github.com/simophin/ferryapp/releases/download/v1.12.0/ferry-1.12.0-macos-universal.dmg"
  name "Ferry"
  desc "KDE Connect client: share files and the clipboard with your phone"
  homepage "https://simophin.github.io/ferryapp/"

  depends_on macos: :monterey

  app "Ferry.app"
  binary "#{appdir}/Ferry.app/Contents/MacOS/ferry-cli"

  # The app is signed with a self-signed certificate, not notarized, so
  # Gatekeeper would refuse the copy Homebrew marked as downloaded.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Ferry.app"]
  end

  uninstall quit: "dev.fanchao.Ferry"

  zap trash: [
    "~/Library/Application Support/dev.fanchao.Ferry",
    "~/Library/Application Support/Ferry",
    "~/Library/LaunchAgents/dev.fanchao.Ferry*.plist",
  ]
end
