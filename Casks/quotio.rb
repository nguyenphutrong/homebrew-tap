cask "quotio" do
  version "0.7.7"
  sha256 "36c6939bc059066b491c7879ee7af6be9c0db557256802a9b6d650583376f6e0"

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
