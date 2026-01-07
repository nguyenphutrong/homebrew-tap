class Agentmap < Formula
  desc "Prepare codebases for AI agents with structured documentation"
  homepage "https://github.com/nguyenphutrong/agentmap"
  version "v0.4.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nguyenphutrong/agentmap/releases/download/v#{version}/agentmap-darwin-aarch64.tar.gz"
      sha256 "Not"
    end
    on_intel do
      url "https://github.com/nguyenphutrong/agentmap/releases/download/v#{version}/agentmap-darwin-x86_64.tar.gz"
      sha256 "Not"
    end
  end

  def install
    bin.install "agentmap"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agentmap --version")
  end
end
