class QuotioBeta < Formula
  desc "Check AI provider quota and usage"
  homepage "https://github.com/nguyenphutrong/quotio"
  version "1.0.0-beta.6"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/nguyenphutrong/quotio/releases/download/cli-v1.0.0-beta.6/quotio-1.0.0-beta.6-aarch64-apple-darwin.tar.gz"
      sha256 "89b421b3b29e9a2d4ab1ab56d310989be4bf7c35c1dc99d18418ac68e40ae307"
    end
    on_intel do
      url "https://github.com/nguyenphutrong/quotio/releases/download/cli-v1.0.0-beta.6/quotio-1.0.0-beta.6-x86_64-apple-darwin.tar.gz"
      sha256 "13b962ff158194fd0ffa2e8615afb551d4ddb50fe3e2db4934aacf582e23209f"
    end
  end
  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/nguyenphutrong/quotio/releases/download/cli-v1.0.0-beta.6/quotio-1.0.0-beta.6-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0cf4564f2832551eff9e601e40e72ccc2663d85baaa3af2892e09fa606f9912c"
  end

  def install
    bin.install "quotio"
    doc.install "THIRD-PARTY-NOTICES.md"
  end

  test do
    assert_match "quotio 1.0.0-beta.6", shell_output("#{bin}/quotio --version")
    assert_match "schema_version", shell_output("#{bin}/quotio usage --provider mock --no-saved-accounts --format json")
  end
end
