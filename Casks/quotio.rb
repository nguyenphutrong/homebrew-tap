cask "quotio" do
  version "0.10.0"
  sha256 "4b8a24e3a0ae7c6f880ebc3ba6ae8726203cacb9e2402f1b43381000b76be2f8"

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
