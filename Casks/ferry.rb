# Ferry's Homebrew cask, for the simophin/homebrew-tap tap:
#
#   brew install simophin/tap/ferry
#
# The Build workflow fills in the @...@ fields (packaging/macos/cask.sh) and
# pushes the result to the tap as Casks/ferry.rb with each release.
cask "ferry" do
  version "1.14.0"
  sha256 "fc0490075f2409b4c918aed451f7c7fd85b9e0cb158bfce2ad553042fe4bafbc"

  url "https://github.com/simophin/ferryapp/releases/download/v1.14.0/ferry-1.14.0-macos-universal.dmg"
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
