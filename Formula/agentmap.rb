class Agentmap < Formula
  desc "Prepare codebases for AI agents with structured documentation"
  homepage "https://github.com/nguyenphutrong/agentmap"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nguyenphutrong/agentmap/releases/download/v#{version}/agentmap-darwin-aarch64.tar.gz"
      sha256 "16f3384e029308e455204d51c4d237e1adc2c5ef06c0002b442a387b2920e923"
    end
    on_intel do
      url "https://github.com/nguyenphutrong/agentmap/releases/download/v#{version}/agentmap-darwin-x86_64.tar.gz"
      sha256 "2573f4c75071f25c2bfcfbe17da1c532fc16da10da0a75f7f11668ff42882864"
    end
  end

  def install
    bin.install "agentmap"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agentmap --version")
  end
end
