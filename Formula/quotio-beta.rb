class QuotioBeta < Formula
  desc "Check AI provider quota and usage"
  homepage "https://github.com/nguyenphutrong/quotio"
  version "1.0.0-beta.4"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/nguyenphutrong/quotio/releases/download/cli-v1.0.0-beta.4/quotio-1.0.0-beta.4-aarch64-apple-darwin.tar.gz"
      sha256 "035651c495252334e23f0ab85607bc35baf6b063cfe9731087b4642b2e21b256"
    end
    on_intel do
      url "https://github.com/nguyenphutrong/quotio/releases/download/cli-v1.0.0-beta.4/quotio-1.0.0-beta.4-x86_64-apple-darwin.tar.gz"
      sha256 "1be1b32d8ede50448b39b176e218ac695589de4c0929e52514cd4785c70c98f1"
    end
  end
  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/nguyenphutrong/quotio/releases/download/cli-v1.0.0-beta.4/quotio-1.0.0-beta.4-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "fd373bd3dab6a7c1e88fdf0b9b1be4bada8139e737c6ff32c0a7ca4538f082cd"
  end

  def install
    bin.install "quotio"
    doc.install "THIRD-PARTY-NOTICES.md"
  end

  test do
    assert_match "quotio 1.0.0-beta.4", shell_output("#{bin}/quotio --version")
    assert_match "schema_version", shell_output("#{bin}/quotio usage --provider mock --no-saved-accounts --format json")
  end
end
