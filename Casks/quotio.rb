cask "quotio" do
  version "0.7.5"
  sha256 "1d48b2e175472d3ae10b7c6d1cd0e22185c55b3cfe6dfc8a0a65648a63c1bd5e"

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
