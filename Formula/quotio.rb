class Quotio < Formula
  desc "Check AI provider quota and usage"
  homepage "https://github.com/nguyenphutrong/quotio-cli"
  version "0.2.11"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/nguyenphutrong/quotio-cli/releases/download/v0.2.11/quotio-0.2.11-aarch64-apple-darwin.tar.gz"
      sha256 "1cfd6987d1b7c6df5cfa0b0bed9c562750bddd85d0cc44694d80ffa570cc4a05"
    end
    on_intel do
      url "https://github.com/nguyenphutrong/quotio-cli/releases/download/v0.2.11/quotio-0.2.11-x86_64-apple-darwin.tar.gz"
      sha256 "1d8801b0194ca5f4c9d4bda9528b8e618a0536ba026379804a71ab0d013495b4"
    end
  end
  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/nguyenphutrong/quotio-cli/releases/download/v0.2.11/quotio-0.2.11-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6ccd3e7e7d9b8894b1fcbfbe221c5c5c4e53ab31ea690c198c5963c83ce51c7c"
  end

  def install
    bin.install "quotio"
    doc.install "THIRD-PARTY-NOTICES.md"
  end

  test do
    assert_match "quotio 0.2.11", shell_output("#{bin}/quotio --version")
    assert_match "schema_version", shell_output("#{bin}/quotio usage --provider mock --no-saved-accounts --format json")
  end
end
