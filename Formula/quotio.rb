class Quotio < Formula
  desc "Check AI provider quota and usage"
  homepage "https://github.com/nguyenphutrong/quotio-cli"
  version "0.1.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/nguyenphutrong/quotio-cli/releases/download/v0.1.0/quotio-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "fc157a0ade3f81545aa1a4c0ca3c1fd0d6b3c295e77e4014aebe4add81fe13d7"
    end
    on_intel do
      url "https://github.com/nguyenphutrong/quotio-cli/releases/download/v0.1.0/quotio-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "0ce5fc8d00ac9576347f128130911ac1ac7c66ac6322c024ff35d24ed8bcf1a1"
    end
  end
  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/nguyenphutrong/quotio-cli/releases/download/v0.1.0/quotio-0.1.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a6af999b0ee1f280876f7ceb6e8bcd71a656c6ad5240303408f26705a77b5aad"
  end

  def install
    bin.install "quotio"
    doc.install "THIRD-PARTY-NOTICES.md"
  end

  test do
    assert_match "quotio 0.1.0", shell_output("#{bin}/quotio --version")
    assert_match "schema_version", shell_output("#{bin}/quotio usage --provider mock --no-saved-accounts --format json")
  end
end
