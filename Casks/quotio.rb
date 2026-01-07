cask "quotio" do
  version "0.6.0"
  sha256 "c9645909db45a13fdd7d9cd4f97d0efe0bb77e2d5264a031b6651cc8b1ed4179"

  url "https://github.com/nguyenphutrong/quotio/releases/download/v#{version}/Quotio-#{version}.dmg"
  name "Quotio"
  desc "Command center for AI coding assistants on macOS"
  homepage "https://github.com/nguyenphutrong/quotio"

  auto_updates true

  app "Quotio.app"

  zap trash: [
    "~/Library/Application Support/Quotio",
    "~/Library/Caches/Quotio",
    "~/Library/Preferences/com.nguyenphutrong.quotio.plist",
  ]
end
