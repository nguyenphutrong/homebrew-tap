cask "quotio" do
  version "0.7.10"
  sha256 "7d26edfc5272d8b2bda8f6d0bf88b865c1f7e1d6bbf4e82ba10e680a80f5de20"

  url "https://github.com/nguyenphutrong/quotio/releases/download/v#{version}/Quotio-#{version}.dmg"
  name "Quotio"
  desc "Command center for AI coding assistants on macOS"
  homepage "https://github.com/nguyenphutrong/quotio"

  app "Quotio.app"

  zap trash: [
    "~/Library/Application Support/Quotio",
    "~/Library/Caches/Quotio",
    "~/Library/Preferences/com.nguyenphutrong.quotio.plist",
  ]
end
