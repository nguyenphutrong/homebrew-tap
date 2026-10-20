class QuotioBeta < Formula
  desc "Check AI provider quota and usage"
  homepage "https://github.com/nguyenphutrong/quotio"
  version "1.0.0-beta.7"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/nguyenphutrong/quotio/releases/download/cli-v1.0.0-beta.7/quotio-1.0.0-beta.7-aarch64-apple-darwin.tar.gz"
      sha256 "7e8a39d0f6725e21ed51b1cb72ec748f5d00ff387fa9c2349a95bb002c973b77"
    end
    on_intel do
      url "https://github.com/nguyenphutrong/quotio/releases/download/cli-v1.0.0-beta.7/quotio-1.0.0-beta.7-x86_64-apple-darwin.tar.gz"
      sha256 "3a2135c72638bdabfe2843edf280e276d3f69e7dc7268aed67de3d85777d6cf9"
    end
  end
  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/nguyenphutrong/quotio/releases/download/cli-v1.0.0-beta.7/quotio-1.0.0-beta.7-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8c0ae57be8fd552a21b68a9ab89cf0ca070bc06a40b53c2f21470d556ca41a3b"
  end

  def install
    bin.install "quotio"
    doc.install "THIRD-PARTY-NOTICES.md"
  end

  test do
    assert_match "quotio 1.0.0-beta.7", shell_output("#{bin}/quotio --version")
    assert_match "schema_version", shell_output("#{bin}/quotio usage --provider mock --no-saved-accounts --format json")
  end
end
