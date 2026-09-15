class Quotio < Formula
  desc "Check AI provider quota and usage"
  homepage "https://github.com/nguyenphutrong/quotio"
  version "0.2.12"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/nguyenphutrong/quotio/releases/download/cli-v0.2.12/quotio-0.2.12-aarch64-apple-darwin.tar.gz"
      sha256 "8e170296a40777709a14b10956e5ccee4002b68338142a44a475692b881b052b"
    end
    on_intel do
      url "https://github.com/nguyenphutrong/quotio/releases/download/cli-v0.2.12/quotio-0.2.12-x86_64-apple-darwin.tar.gz"
      sha256 "2db4753218342bd3ea9b95738c47776a30a74c55c22e9b9c820f9d2f7a50cb35"
    end
  end
  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/nguyenphutrong/quotio/releases/download/cli-v0.2.12/quotio-0.2.12-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9646e29071da93f5e321a80e242a0c8a8be4d8d3ce039c09fde00619e8a0a0f3"
  end

  def install
    bin.install "quotio"
    doc.install "THIRD-PARTY-NOTICES.md"
  end

  test do
    assert_match "quotio 0.2.12", shell_output("#{bin}/quotio --version")
    assert_match "schema_version", shell_output("#{bin}/quotio usage --provider mock --no-saved-accounts --format json")
  end
end
