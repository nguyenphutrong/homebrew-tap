class Agentlens < Formula
  desc "Prepare codebases for AI agents with structured documentation"
  homepage "https://github.com/nguyenphutrong/agentlens"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nguyenphutrong/agentlens/releases/download/v#{version}/agentlens-darwin-aarch64.tar.gz"
      sha256 "e7a12b94726e8a7258487cfc6e2a91b3685b44b3c2a0ced1a31a3bd2cd39fe89"
    end
    on_intel do
      url "https://github.com/nguyenphutrong/agentlens/releases/download/v#{version}/agentlens-darwin-x86_64.tar.gz"
      sha256 "8764bcff8c6063ffa724fc4a4c007aabc0d59cddb62681b103194a036ebd205b"
    end
  end

  def install
    bin.install "agentlens"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agentlens --version")
  end
end
